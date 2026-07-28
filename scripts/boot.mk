ASM := nasm
SRC := boot.asm
TARGET := build/boot.bin

all: $(TARGET)


$(TARGET): $(SRC)
	mkdir -p build
	rm -f build/*
	$(ASM) -f bin $(SRC) -o $(TARGET)

.PHONY: clean
clean:
	rm -f $(TARGET)