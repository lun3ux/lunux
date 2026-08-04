#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <tty.h>
#include <vga.h>
#include <gdt.h>

void printlogo(void)
{
	terminal_writestring(".---.                                                    ");
	terminal_println();
	terminal_writestring("|   |              _..._                                 ");
	terminal_println();
	terminal_writestring("|   |            .'     '.                               ");
	terminal_println();
	terminal_writestring("|   |           .   .-.   .                              ");
	terminal_println();
	terminal_writestring("|   |           |  '   '  |            ____     _____    ");
	terminal_println();
	terminal_writestring("|   |   _    _  |  |   |  |   _    _  `.   \  .'    /    ");
	terminal_println();
	terminal_writestring("|   |  | '  / | |  |   |  |  | '  / |   `.  `'    .'     ");
	terminal_println();
	terminal_writestring("|   | .' | .' | |  |   |  | .' | .' |     '.    .'       ");
	terminal_println();
	terminal_writestring("|   | /  | /  | |  |   |  | /  | /  |     .'     `.      ");
	terminal_println();
	terminal_writestring("'---'|   `'.  | |  |   |  ||   `'.  |   .'  .'`.   `.    ");
	terminal_println();
	terminal_writestring("     '   .'|  '/|  |   |  |'   .'|  '/.'   /    `.   `.  ");
	terminal_println();
	terminal_writestring("      `-'  `--' '--'   '--' `-'  `--''----'       '----' ");
	terminal_println();

}

void kernel_main(void)
{
	buildGDT();
	terminal_initialize();
	printlogo();
	terminal_writestring("LUNUX A-0.1.2");

}
