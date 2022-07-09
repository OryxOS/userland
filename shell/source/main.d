import au.types;

import system.io;

import syscalls.oryx;

// Command buffer - null terminated
private __gshared char[64] buffer = '\0';
private __gshared usize pos;

extern (C) void _main() {
	clear_console();
	writefln("Welcome to OryxOS's shell\n");
	show_cursor(true);
	put_promt();

	// Get keystrokes and handle commands
	while (1) {
		immutable auto stroke = get_keystroke();

		if (stroke != '\0') {
			put_chr(stroke, colours[1]);
		}
		/*
		if (stroke == '\0')
			continue;

		switch (stroke) {
		case '\n':
			put_chr('\n', colours[1]);
			
			//handleCommand(fromCString(&cmdBuffer[0]));

			put_promt();
			buffer = '\0';
			pos = 0;
			break;

		case '\b':
			if (pos != 0) {
				put_chr('\b', colours[0]);
				buffer[pos--] = '\0';
			}
			break;

		default:
			buffer[pos++] = stroke;
			put_chr(stroke, colours[1]);
			break;
		}
		*/

		//yield();
	}
}

private void put_promt() {
	put_str("shell", colours[2]);
	put_str("@OryxOS > ");
}


/*
module shell;

/* OryxOS Kernel Shell
 * This is just a simple shell in ring 0 that is
 * nice for testing parts of the kernel
 * /

import memory.heap;
import au.types;
import au.string;
import io.console;

import io.framebuffer;

version (X86_64) {
	import arch.amd64.memory;
	import arch.amd64.drivers.legacy.keyboard;
}

// Command buffer - null terminated
private __gshared char[64] cmdBuffer = '\0';
private __gshared usize   bufferPos;

void shellMain() {
	clearConsole();

	writefln("OryxOS in-kernel shell");
	
	putStr("\n\n");
	putPromt();

	showCursor(true);

	// stroke loop
	while (1) {
		asm { hlt; }
		immutable auto stroke = getKeystroke();

		if (stroke == '\0')
			continue;

		switch (stroke) {
		case '\n':
			putChr('\n');
			
			handleCommand(fromCString(&cmdBuffer[0]));

			putPromt();
			cmdBuffer = '\0';
			bufferPos = 0;
			break;

		case '\b':
			if (bufferPos != 0) {
				putChr('\b');
				cmdBuffer[bufferPos--] = '\0';
			}
			break;

		default:
			cmdBuffer[bufferPos++] = stroke;
			putChr(stroke);
			break;
		}
	}
}

private void handleCommand(string command) {
	switch (command) {
	case "help":
		writefln("Commands:
		help               - show this dialog
		clear              - clear the screen
		theme-[light|dark] - changes the console's theme
		\nTests:
		test-scroll        - scroll through 100 lines
		test-panic         - display the panic screen (Fatal)
		test-int           - calls interrupt 3 (Fatal)
		test-mm            - allocate a 4kb page of memory
		test-alloc         - test the kernel allocator");
		break;

	case "clear":
		clearConsole();
		break;
	
	case "theme-dark":
		setTheme(true);
		clearConsole();
		break;

	case "theme-light":
		setTheme(false);
		clearConsole();
		break;

	case "test-scroll":
		foreach(i; 0..100)
			writefln("%d", i);
		break;

	case "test-panic":
		showCursor(false);
		panic("Console called panic");
		break;

	case "test-int":
		showCursor(false);
		version (X86_64) asm { int 3; }
		break;
	
	case "test-mm":
		auto test = new_page();
		if (test.isOkay) {
			writefln("Page allocated: %h", test.unwrap_result());
		} else {
			writefln("Allocation failed: %d", test.unwrap_error());
		}
		break;

	case "test-alloc":
		// Test 1
		writefln("Test 1: Allocation and Deleting of 1000 4 byte objects");
		auto objects = newArr!(uint)(1000);
		auto result  = delArr!(uint)(objects);

		if (objects != null && result == true)
			writefln("\t\tPassed");
		else
			writefln("\t\tFailed");

		// Test 2.1
		alias BoolList = LinkedList!(bool);
		writefln("Test 2.1: Linked Lists: Allocation, Addition and Removal of elements");
		
		BoolList bools = BoolList(7, true);

		bools.append(false);
		bools.remove(3);

		if (bools[0] == true && bools[6] == false)
			writefln("\t\tPassed");
		else
			writefln("\t\tFailed");

		// Test 2.2
		writefln("Test 2.2: Linked Lists: Allocation and Destruction");
		BoolList booleans = BoolList(16, true);

		booleans.removeAll();

		writefln("\t\tPassed");
		break;
		
	default:
		writefln("Error, command \"%s\" is not valid", command);
		return;
	}
}

private void putPromt() {
	putStr("Test-Suite", theme[2]);
	putStr("@OryxOS > ");
} */