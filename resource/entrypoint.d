module entrypoint;

// OryxOS userland initalisation process

import syscalls.oryx;

// TODO: change this to main
extern extern (C) void _main();

extern (C) void entry() {
    _main();

    exit();
}