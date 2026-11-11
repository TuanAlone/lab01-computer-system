# Listing 2 - addresses and offsets
.data
scores: .word 40, 55, 70, 85, 100
 
.text
.globl main
main:
    la   $s0, scores      # $s0 = address of scores[0]
    lw   $t0, 0($s0)      # (1)
    lw $t1, 20($s0)      # (2)
    lw   $t2, 16($s0)     # (3)
    addi $s1, $s0, 8      # (4) $s1 = $s0 + 8
    lw   $t3, 0($s1)      # (5)
    lw   $t4, -4($s1)     # (6)
    li   $v0, 10
    syscall
