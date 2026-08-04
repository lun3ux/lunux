#ifndef _STRING_H
#define _STRING_H 1

#include <cdefs.h>
#include <stddef.h>
const char* strchr(const char* str, char chr);
extern unsigned char* memcpy(unsigned char* dest, const unsigned char* src, int count);
extern unsigned char *memset(unsigned char* dest, unsigned char val, int count);
extern unsigned short *memsetw(unsigned short* dest, unsigned short val, int count);
extern size_t strlen(const char* str);
#endif
