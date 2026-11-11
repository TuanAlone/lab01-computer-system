# Listing 0 - quick check
.data
x:    .word 7
msg:  .asciiz "Value read from memory: "
nl:   .asciiz "\n"
 
.text
.globl main
main:
    li   $v0, 4
    la   $a0, msg
    syscall
    la   $t0, x
    lw   $a0, 0($t0)
    li   $v0, 1
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    li   $v0, 10
    syscall
