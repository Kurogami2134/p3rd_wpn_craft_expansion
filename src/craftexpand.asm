.psp

; max weapons: 297 per type

.createfile "../bin/"+FILE, LOAD_ADD - 8
.word LOAD_ADD
.word @main_end - @path
@path:
    .ascii      crafts_dir
@path_end:
    .word       0
.align 4
@strings:                           ; weapon type files
    .asciiz     "gs"
    .byte       0
    .asciiz     "sns"
    .asciiz     "hmr"
    .asciiz     "lnc"
    .asciiz     "hbg"
    .word       0
    .asciiz     "lbg"
    .asciiz     "ls"
    .byte       0
    .asciiz     "sax"
    .asciiz     "gl"
    .byte       0
    .asciiz     "bow"
    .asciiz     "db"
    .byte       0
    .asciiz     "hh"
    .byte       0
@main:
    ; Original code, replaced by hook
    sw          v0, 0x10(sp)
    sw          zero, 0x14(sp)
    
    addiu       sp, sp, -0x19
    ; save registers
    sw          v0, 0x5(sp)
    sw          v1, 0x1(sp)
    sw          ra, 0x9(sp)
    sw          a0, 0xD(sp)
    sw          a1, 0x11(sp)
    sw          a2, 0x15(sp)
    
    li          t7, wpn_index
    lb          t6, 0x0(t7)         ; load selected weapon to t6
    li          t7, wpn_types
    addu        t7, t7, t6
    lb          t6, 0x0(t7)         ; load weapon type - 0x5
    
    sll         t6, t6, 0x2
    li          t7, @strings
    addu        t7, t7, t6
    lw          t6, 0x0(t7)
    li          t7, @path_end
    sw          t6, 0x0(t7)         ; add weapon type to path
    la          a0, @path
    li          a1, PSP_O_RDONLY
    jal         sceIoOpen           ; open fiile
    li          a2, 0x1FF
    sb          v0, 0x0(sp)
    move        a0, v0
    li          a1, craftadd
    jal         sceIoRead           ; load craft array
    li          a2, 0xFFFF
    jal         sceIoClose          ; close file
    lb          a0, 0x0(sp)
    
    ; restore registers
    lw          v0, 0x5(sp)
    lw          v1, 0x1(sp)
    lw          ra, 0x9(sp)
    lw          a0, 0xD(sp)
    lw          a1, 0x11(sp)
    lw          a2, 0x15(sp)
@@ret:
    j           HOOK + 8
    addiu       sp, sp, 0x19
@main_end:
.word HOOK
.word 8
    j           @main
    nop
.word -1
.word 0
.close