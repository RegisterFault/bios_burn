	.global _start
	.intel_syntax noprefix
	.code16
_start:
	xor ax, ax
	xor cx, cx
	mov cl, dl
	and dx, 0x000f
	and cl, 0xf0
	shr cl, 4
	lea bx, ascii
	add bx, cx
	mov AH, 0x0E
	mov al, [bx]
	int 0x10
	lea bx, ascii
	add bx, dx
	mov al, [bx]
	int 0x10
	jmp main
//bx=address of string
print:
	push ax
	mov AL, [bx]
ploop:
	mov AH, 0x0E
	int 0x10
	inc bx
	mov al, [bx]
	cmp al, 0
	jnz ploop
	pop ax
	ret

main:
	lea bx, hello
	call print
loop:
	jmp loop
hello:
	.asciz "hello, world"
ascii:
	.asciz "0123456789abcdef"


.space 510-(.-_start)
.word 0xaa55
