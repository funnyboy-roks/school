import sys;
from win32file import *;

def write_command(file, s: str, read_data: bool):
    s += '\n';
    WriteFile(file, str.encode(s), None);
    if read_data:
        _, data = ReadFile(file, 256, None);
        return data.decode('utf-8');
    return None;

def main():
    pipe = CreateFile(
            r"\\.\pipe\multi-lang-assignment",
            GENERIC_READ | GENERIC_WRITE, 0, None, OPEN_EXISTING, 0, None);

    write_command(pipe, "name|python", False);

    out = write_command(pipe, "add|6|3", True);
    print(f'\033[36mPython: receiving response from c#, add(6, 3) = {out}\033[0m');

    out = write_command(pipe, "mul|6|3", True);
    print(f'\033[36mPython: receiving response from c#, mul(6, 3) = {out}\033[0m');

    out = write_command(pipe, "sub|6|3", True);
    print(f'\033[36mPython: receiving response from c#, sub(6, 3) = {out}\033[0m');

    out = write_command(pipe, "sub|6|3", True);
    print(f'\033[36mPython: receiving response from c#, div(6, 3) = {out}\033[0m');

    if len(sys.argv) == 2 and sys.argv[1] == "end":
        write_command(pipe, "end", False);
    else:
        write_command(pipe, "close", False);

    pipe.close()

main();
