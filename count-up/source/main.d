import au.types;

import system.io;

import syscalls.oryx;

extern (C) void _main() {
	for (usize i = 0; i < 10; i++) {
		writefln("Up: %d", i);
		yield();
	}
	writefln("Done!");
}