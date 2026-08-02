#ifndef _STDIO_H
#define _STDIO_H

#include <stddef.h>

#define EOF (-1)

#ifdef __cplusplus
extern "C" {
#endif
int printf(const char* format, ...);
int putchar(int c);
int puts(const char*);
#ifdef __cplusplus
}
#endif
#endif
