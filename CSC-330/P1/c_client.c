#include <stdio.h>
#include <string.h>
#ifdef __linux__
#include "/usr/x86_64-w64-mingw32/include/windows.h"
#else // __linux__
// this library is a crime against humanity
#include <windows.h>
#endif

const char *send_command(HANDLE pipe, const char *command, char *out_buf, DWORD *out_len) {
    int cmd_len = strlen(command);
    char cmd[cmd_len + 1];
    memcpy(cmd, command, cmd_len);
    cmd[cmd_len++] = '\n';
    cmd[cmd_len] = '\0';
    WriteFile(pipe, cmd, cmd_len, NULL, NULL);

    if (out_buf != NULL)
        ReadFile(pipe, out_buf, 256, out_len, NULL);
}

int main(int argc, char **argv)
{
    HANDLE pipe = CreateFile(
        "\\\\.\\pipe\\multi-lang-assignment",
        GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);
    send_command(pipe, "name|C", NULL, NULL);

    char buf[256];
    DWORD count;
    send_command(pipe, "add|2|3", buf, &count);
    printf("\033[32mC: Receiving request from C#, add(2, 3) = %.*s\033[0m\n", count, buf);

    send_command(pipe, "mul|84|4", buf, &count);
    printf("\033[32mC: Receiving request from C#, mul(84, 4) = %.*s\033[0m\n", count, buf);

    send_command(pipe, "sub|8|4489", buf, &count);
    printf("\033[32mC: Receiving request from C#, sub(8, 4489) = %.*s\033[0m\n", count, buf);

    send_command(pipe, "div|8|4", buf, &count);
    printf("\033[32mC: Receiving request from C#, div(8, 4) = %.*s\033[0m\n", count, buf);

    if (argc == 2 && !strcmp(argv[1], "end")) {
        send_command(pipe, "end", NULL, NULL);
    }

    send_command(pipe, "close", NULL, NULL);
    CloseHandle(pipe);
}
