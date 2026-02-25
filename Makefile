BIN = boot.bin

all: $(BIN)

$(BIN): boot.o
	ld -Tboot.ld $^ -o $@

boot.o: boot.s
	as -32 $^ -o $@

clean:
	$(RM) *.o $(BIN)

run: $(BIN)
	qemu-system-x86_64 $(BIN) -full-screen

.PHONY: run clean
