#pragma once
#include <stdint.h>
#include <stdio.h>

void createDescriptor(uint32_t base, uint32_t limit, uint16_t flag);
void buildGDT();