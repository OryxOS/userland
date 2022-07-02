module main;

import system.io;

import syscalls.oryx;

/// No application
extern (C) void start() {
    ulong i = 0;
    while (1) {
        writefln("No: %d", i);
        i++;
        yield();
    }
}
