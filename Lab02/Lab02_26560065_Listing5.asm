# Listing 5 - the bytes of a string
.data
word1: .asciiz "Hi!"
 
.text
.globl main
main:
    la   $s0, word1       # $s0 = address of the first byte
    lb   $t0, 0($s0)
    lb   $t1, 1($s0)
    lb   $t2, 2($s0)
    lb   $t3, 3($s0)
    li   $v0, 11          # service 11: print one character
    add  $a0, $t1, $zero  # the byte that was loaded into $t1
    syscall
    li   $v0, 10
    syscall
