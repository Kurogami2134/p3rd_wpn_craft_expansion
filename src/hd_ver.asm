.psp

.relativeinclude on

PSP_O_RDONLY    equ         0x00000001
sceIoRead       equ         0x089656A0
sceIoClose      equ         0x089656B0
sceIoOpen       equ         0x089656D0

wpn_types       equ         0x0A196DE4
wpn_index       equ         0x0A25E84E
craftadd        equ         0x089A2DB8

HOOK            equ         0x0A0DA448
LOAD_ADD        equ         0x09D84AD0

FILE            equ         "007AP"
crafts_dir      equ         "ms0:/P3rdHDML/crafts/"

.include        "craftexpand.asm"
