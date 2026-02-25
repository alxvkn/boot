.code16gcc
# .org 0x7c00
.text
.globl _start

_start:
    cli
    xor %ax, %ax
    mov %ax, %ds
    mov %ax, %es
    mov %ax, %ss
    mov $0x7c00, %sp

    mov $message, %si
    call print_string

    jmp .
print_string:
    mov $0x00, %bx
    mov $0x0e, %ah
print_char:
    mov (%si), %al
    cmp $0x00, %al
    je print_done
    int $0x10
    inc %si
    jmp print_char
print_done:
    ret

message:
    .ascii "hi hi\r\n"
    .byte 0

.org 510
.word 0xaa55
