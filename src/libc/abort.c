#include <stdio.h>
#include <stdlib.h>

__attribute__((__noreturn__))
void abort(void) {
#if defined (__is_libk)
    printf("Kernel Panic: Aport()\n");
    asm volitile ("hlt");
#else
    printf("Abort()\n");
    exit(1);
#endif
    while (1) {  }
    __builtin_unreachable();
}