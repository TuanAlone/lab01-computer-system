# Listing 4 - the index of the element is held in a register
# Register plan:  $s0 = address of scores[0]   $s1 = i
.data
scores: .word 62, 77, 84, 91, 98
msg:    .asciiz "scores[i] = "
total:  .asciiz "Total: "
nl:     .asciiz "\n"

.text
.globl main
main:
    la   $s0, scores

    addi $s1, $zero, 0          # k = 0
    li   $t0, 62                # V = 62
    sll  $t1, $s1, 2            # $t1 = k * 4 (byte offset)
    add  $t1, $t1, $s0          # $t1 = address of scores[k]
    sw   $t0, 0($t1)            # store V into scores[k]

    lw   $t2, 0($s0)            # load scores[0]
    lw   $t3, 4($s0)            # load scores[1]
    lw   $t4, 8($s0)            # load scores[2]
    lw   $t5, 12($s0)           # load scores[3]
    lw   $t6, 16($s0)           # load scores[4]

    # Calculate total sum
    add  $t7, $t2, $t3          # $t7 = scores[0] + scores[1]
    add  $t7, $t7, $t4          # $t7 += scores[2]
    add  $t7, $t7, $t5          # $t7 += scores[3]
    add  $t7, $t7, $t6          # $t7 += scores[4]


    li   $v0, 4
    la   $a0, total
    syscall

    # Print total sum value
    li   $v0, 1
    add  $a0, $t7, $zero
    syscall

    # Print newline
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 10
    syscall
