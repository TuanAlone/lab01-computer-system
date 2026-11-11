# Listing 7 - lb and lbu
.data
b1: .byte 0xF0
 
.text
.globl main
main:
    la   $s0, b1
    lb   $t0, 0($s0)
    lbu  $t1, 0($s0)
    li   $v0, 10
    syscall
