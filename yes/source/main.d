import system.io;

import syscalls.oryx;

/// Yes application
extern (C) void start() {
    ulong i = 0;
    while (1) {
        writefln("Yes: %d", i);
        i++;
        yield();
    }

}