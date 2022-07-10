import au.types;
import au.string;

import system.io;

import syscalls.oryx;

// Command buffer - null terminated
private __gshared char[64] buffer = '\0';
private __gshared usize pos = 0;

extern (C) void _main() {
	clear_console();
	writefln("Welcome to OryxOS's shell\n");
	show_cursor(true);
	put_promt();

	pos = 0;

	// Get keystrokes and handle commands
	while (1) {
		immutable auto stroke = get_keystroke();

		if (stroke == '\0')
			continue;
		
		switch (stroke) {
		
		// Sometimes causes a page fault
		case '\n':
			put_chr('\n', colours[1]);
			
			handle_command(from_c_string(&buffer[0]));

			put_promt();
			buffer = '\0';
			pos = 0;
			break;
			
		/* Causes a gpf
		case '\b':
			if (pos != 0) {
				put_chr('\b', colours[0]);
				buffer[pos--] = '\0';
			}
			break;
		*/

		default:
			buffer[pos++] = stroke;
			put_chr(stroke, colours[1]);
			break;
		}

		//yield();
	}
}

private void handle_command(string command) {
	switch (command) {
		case "help":
			writefln("OryxOS shell");
			writefln("We have no commands");
			break;

		default:
			writefln("Error");
	}
}

private void put_promt() {
	put_str("shell", colours[2]);
	put_str("@OryxOS > ");
}