boot.bin: boot.s
	as -o boot.o boot.s
	ld -Ttext 0x7C00 --oformat binary boot.o -o boot.bin

image:	boot.bin
	dd if=/dev/zero of=zeroes.bin bs=10M count=1
	cat boot.bin zeroes.bin > disk.img
	rm zeroes.bin

run:	image
	qemu-system-i386 -drive file=disk.img,format=raw

clean:
	rm boot.bin disk.img boot.o
