BIN = boot.bin

all: $(BIN)

$(BIN): boot.o
	ld -Tboot.ld $^ -o $@

boot.o: boot.s
	as -32 $^ -o $@

run: $(BIN)
	qemu-system-x86_64 $(BIN) -full-screen

# smallest Ventoy-supported image (64 was figured out by trial and error)
boot.img: $(BIN)
	dd if=/dev/zero of=$@ bs=512 count=64
	dd if=$< of=$@ conv=notrunc

clean:
	$(RM) *.o $(BIN) boot.img

.PHONY: run clean
