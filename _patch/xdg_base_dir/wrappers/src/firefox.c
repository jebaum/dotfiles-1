#define _XOPEN_SOURCE 500

#include <errno.h>
#include <ftw.h>
#include <libgen.h>
#include <linux/limits.h>
#include <signal.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#define TIME_LIMIT 5    // wait 5 seconds for '~/.mozilla' dir to appear
#define PROC_SELF  "/proc/self/exe"

int rm(const char mode, const char* fmt, ...);
int ntfw_rm(const char* fpath, const struct stat* sb, int typeflag, struct FTW* ftwbuf);
int ntfw_rmdir(const char* fpath, const struct stat* sb, int typeflag, struct FTW* ftwbuf);

int mkdir_p(const char* path);

char* findRealBin();
void clearJunk();
void genArgs(char* firefox, char* args[], int argc, char* argv[]);

struct stat fb = { 0 };

int main(int argc, char* argv[])
{
    char firefox[PATH_MAX];
    if (findRealBin(firefox) == NULL) {
        perror("Could not find original binary");
        exit(1);
    }

    for (int i = 1; i < argc; ++i) {
        if (strcmp(argv[i], "--profile") == 0) {
            execv(firefox, argv);
        }
    }

    pid_t pid = fork();

    if (pid < 0) {
        perror("");
        exit(1);
    }

    if (pid) {
        char* args[ARG_MAX];
        genArgs(firefox, args, argc, argv);

        if (stat(args[2], &fb) < 0) { // create dir for profile doesn't already exist
            mkdir_p(args[2]);
        }

        signal(SIGCHLD, SIG_IGN); // forget about zombie from clearJunk()
        execv(firefox, args);
    } else {
        clearJunk();
    }

    return 0;
}

void genArgs(char* firefox, char* args[], int argc, char* argv[])
{
    char xdg_data_home[PATH_MAX];
    char* temp = getenv("XDG_DATA_HOME");
    if (temp) {
        strncpy(xdg_data_home, temp, PATH_MAX);
    } else {
        snprintf(xdg_data_home, PATH_MAX, "%s%s", getenv("HOME"), "/.local/share");
    }

    char profile[PATH_MAX];
    snprintf(profile, PATH_MAX, "%s%s", xdg_data_home, "/firefox");

    int n = argc + 2 + 1; // number of args: passed to executable + profile + NULL

    args[0] = strdup(firefox);
    args[1] = strdup("--profile");
    args[2] = strdup(profile);
    args[n-1] = NULL;

    for (int i = 1; i < argc; ++i) {
        args[i+2] = strdup(argv[i]);
    }
}

char* findRealBin(char* bin)
{
    errno = 0;

    char cur[PATH_MAX];
    if (readlink(PROC_SELF, cur, PATH_MAX) < 0) {
        errno = ENOENT;
        return NULL;
    }

    char* bs = basename(cur);
    stat(cur, &fb);
    ino_t curInode = fb.st_ino;

    char buf[PATH_MAX];
    char PATH[BUFSIZ];
    strncpy(PATH, getenv("PATH"), BUFSIZ);
    char* dir = strtok(PATH, ":");

    do {
        snprintf(buf, PATH_MAX, "%s%s%s", dir, "/", bs);
        if (stat(buf, &fb) == 0 && fb.st_ino != curInode && fb.st_mode & S_IXUSR) {
            strncpy(bin, buf, PATH_MAX);
            return bin;
        }
    } while ((dir = strtok(NULL, ":")));

    errno = ENOENT;
    return NULL;
}

void clearJunk()
{
    char mozilla[BUFSIZ]; // "~/.mozilla"
    snprintf(mozilla, BUFSIZ, "%s%s", getenv("HOME"), "/.mozilla");

    int t = 0; // timer

    while (access(mozilla, F_OK) < 0) {
        if (t > TIME_LIMIT) {
            perror("Time limit exceeded | ~/.mozilla");
            exit(1);
        }
        sleep(1);
        ++t;
    }

    rm('r', "%s%s", mozilla, "/firefox/Crash Reports");
    rm('d', "%s%s", mozilla, "/firefox/Pending Pings");
    rm('D', "%s",   mozilla);
}

int rm(const char mode, const char* fmt, ...)
{
    va_list vars;
    va_start(vars, fmt);
    char path[BUFSIZ];
    vsnprintf(path, BUFSIZ, fmt, vars);
    va_end(vars);

    switch (mode) {
        case 'r': // remove recursively
            return nftw(path, ntfw_rm, 100, FTW_DEPTH|FTW_PHYS);
        case 'd': // remove dir
            return rmdir(path);
        case 'D': // remove empty subdirs and if emptied, then dir too
            return nftw(path, ntfw_rmdir, 100, FTW_DEPTH|FTW_PHYS);
        default:  // remove file
            return unlink(path);
    }
}

int ntfw_rm(const char* fpath, const struct stat* sb, int typeflag, struct FTW* ftwbuf)
{
    return remove(fpath);
}

int ntfw_rmdir(const char* fpath, const struct stat* sb, int typeflag, struct FTW* ftwbuf)
{
    return rmdir(fpath);
}

int mkdir_p(const char* path_)
{
    errno = 0;

    if (strlen(path_) > PATH_MAX-1) {
        errno = ENAMETOOLONG;
        return -1;
    }

    char path[PATH_MAX];
    strcpy(path, path_);

    // Create "intermediate" directories
    for (char* p = path + 1; *p; ++p) {
        if (*p == '/') {
            *p = '\0'; // temporarily truncate
            if (mkdir(path, S_IRWXU) < 0 && errno != EEXIST) {
                return -1;
            }
            *p = '/';
        }
    }

    // Create final dir
    if (mkdir(path, S_IRWXU) < 0) {
        if (errno != EEXIST) {
            return -1;
        }
    }

    return 0;
}
