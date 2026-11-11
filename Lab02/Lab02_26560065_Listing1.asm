# Listing 1 - varA = varB + varC, with all three variables in memory
.data
varB: .word 25
varC: .word 17
varA: .word 0
 
.text
.globl main
main:
    la   $t0, varB        # $t0 = address of varB
    lw   $t1, 0($t0)      # $t1 = varB
    lw   $t2, 4($t0)      # $t2 = varC
    add  $t3, $t1, $t2    # $t3 = varB + varC
    sw   $t3, 8($t0)      # varA = $t3
    li   $v0, 10
    syscall
