import au.types;

import system.io;

import syscalls.oryx;

extern (C) void _main() {
	for (usize i = 10; i > 0; i--) {
		writefln("Down: %d", i);
		yield();
	}
	writefln("Done!");
}