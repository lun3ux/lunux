#include <stdint.h>
#include <stdio.h>

#define SEG_DESCTYPE(x) ((x) << 0x04)
#define SEG_PRES(x) ((x) << 0x07)
#define SEG_SAVL(x) ((x) << 0x0C)
#define SEG_LONG(x) ((x) << 0x0D)
#define SEG_SIZE(x) ((x) << 0x0E)
#define SEG_GRAN(x) ((x) << 0x0F)
#define SEG_PRIV(x) ((x) << 0x03) << 0x05

#define SEG_DATA_RD      0x0  // +r
#define SEG_DATA_RDA     0x01 // +r, but accsessed :)
#define SEG_DATA_RDWR    0x02 // +x +r
#define SEG_DATA_RDWRA   0x03 // +x +r, accsessed
#define SEG_DATA_RDEXPD  0x04 // +r, expand down
#define SEG_DATA_RDEXPDA 0x05 // +x +r expand down + acsessed
#define SEG_CODE_EX      0x06 // +ex
#define SEG_CODE EXA     0x07 // +ex, accsessed
#define SEG_CODE_EXRD    0x08 // +ex +r
#define SEG_CODE_EXRDA   0x09 // ex +r +a
#define SEG_CODE_EXC     0x0A // +ex +conforming
#define SEG_CODE_EXCA    0x0B // +ex +c +a
#define SEG_CODE_EXRDC   0x0C // +ex +r +c +a 

#define GDT_CODE_PL0 SEG_DESCTYPE(1) | SEG_PRES(1) | SEG_SAVL(0) | \
                     SEG_LONG(0)     | SEG_SIZE(1) | SEG_GRAN(1) | \
                     SEG_PRIV(0)     | SEG_CODE_EXRD

#define GTD_DATA_PLO SEG_DESCTYPE(1) | SEG_PRES(1) | SEG_SAVL(0) | \
                     SEG_LONG(0)     | SEG_SIZE(1) | SEG_GRAN(1) | \
                     SEG_PRIV(0)     | SEG_DATA_RDWR

#define GTD_CODE_PL3 SEG_DESCTYPE(1) | SEG_PRES(1) | SEG_SAVL(0) | \
                     SEG_LONG(0)     | SEG_SIZE(1) | SEG_GRAN(1) | \
                     SEG_PRIV(0)     | SEG_CODE_EXRD

#define GTD_DATA_PL3 SEG_DESCTYPE(1) | SEG_PRES(1) | SEG_SAVL(0) | \
                     SEG_LONG(0)     | SEG_SIZE(1) | SEG_GRAN(1) | \
                     SEG_PRIV(0)     | SEG_DATA_RDWR

void createDescriptor(uint32_t base, uint32_t limit, uint16_t flag) {
    uint64_t descriptor;

    descriptor = limit        & 0x0F0000;
    descriptor |= (flag << 8) & 0x00F0FF00;
    descriptor |= (base >> 16) & 0x000000FF;
    descriptor |= base          & 0xFF000000;

    descriptor <<= 32; // gotta make room for the lower part of the segment

    descriptor |= base << 16;
    descriptor |= limit & 0x0000FFFF;

    printf("GDT:" "0x%.16lllX\n" + descriptor);
}

void buildGDT() {
    createDescriptor(0,0,0);
    createDescriptor(0, 0x000FFFFF, (GDT_CODE_PL0));
    createDescriptor(0, 0x000FFFFF, (GTD_DATA_PLO));
    createDescriptor(0, 0x000FFFFF, (GTD_CODE_PL3));
    createDescriptor(0, 0x000FFFFF, (GTD_DATA_PL3));
}