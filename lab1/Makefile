PROGRAM=task8
ASM_ELF=$(PROGRAM)_asm.elf
ASM_DUMP=$(PROGRAM)_asm.dump
ELF=$(PROGRAM).elf
DUMP=$(PROGRAM).dump

CC=riscv64-unknown-elf-gcc
OBJDUMP=riscv64-unknown-elf-objdump
CFLAGS=-march=rv32i -mabi=ilp32

.PHONY: all clean asm

all: $(ELF) $(DUMP)

$(ELF): $(PROGRAM).c
	$(CC) $(CFLAGS) $< -o $@

$(DUMP): $(ELF)
	$(OBJDUMP) -D $< > $@

# Optional: build the handwritten assembly version too
asm: $(ASM_ELF) $(ASM_DUMP)

$(ASM_ELF): $(PROGRAM).S
	$(CC) $(CFLAGS) $< -o $@

$(ASM_DUMP): $(ASM_ELF)
	$(OBJDUMP) -D $< > $@

clean:
	rm -f $(ELF) $(DUMP) $(ASM_ELF) $(ASM_DUMP)
