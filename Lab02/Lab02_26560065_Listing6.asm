# Listing 6 - one word, four bytes
.data
w: .word 0x41424344
 
.text
.globl main
main:
    la   $s0, w
    lb   $t0, 0($s0)      # byte at offset 0
    lb   $t1, 1($s0)      # byte at offset 1
    lb   $t2, 2($s0)      # byte at offset 2
    lb   $t3, 3($s0)      # byte at offset 3
    lw   $t4, 0($s0)      # the whole word
    li   $v0, 10
    syscall
