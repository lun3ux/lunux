#ifdef _STDIO_H
#define _STDIO_H    1

#include <sys/cdefs.h>

#define EOF (-1)

#ifdef __cplusplus
extern "C" {
#endif

int prinf(const char* __restrrict, ...);
int putchat(int);
int puts(const* char);

#ifdef __cplusplus
}
#endif
#endif