.psp

.relativeinclude on

PSP_O_RDONLY    equ         0x00000001
sceIoRead       equ         0x08960A10
sceIoClose      equ         0x08960A20
sceIoOpen       equ         0x08960A40

wpn_types       equ         0x09D9725C
wpn_index       equ         0x09E5ECCE
craftadd        equ         0x0899D480

HOOK            equ         0x09CD8868
LOAD_ADD        equ         0x09D84AD0

FILE            equ         "0063P"
crafts_dir      equ         "ms0:/P3rdML/crafts/"

.include        "craftexpand.asm"
