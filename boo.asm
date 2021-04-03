%include "pm.inc"

org   0x7c00

jmp   LABEL_BEGIN

[SECTION .gdt]
LABEL_GDT:          Descriptor        0,            0,                   0
LABEL_DESC_VIDEO:   Descriptor     0B8000h,         0ffffh,           DA_DRW
LABEL_DESC_5M:      Descriptor     0500000h,        0ffffh,           DA_DRW
LABLE_GLOBAL:       Descriptor     0800000h,        0ffffffh,         DA_DRW

GdtLen     equ    $ - LABEL_GDT
GdtPtr     dw     GdtLen - 1
           dd     0
START      equ    0x8000
SelectorVideo     equ   LABEL_DESC_VIDEO  -  LABEL_GDT
Selector5M        equ   LABEL_DESC_5M - LABEL_GDT
SelectorGLOBAL    equ   LABLE_GLOBAL - LABEL_GDT

[SECTION  .s16]
[BITS  16]
LABEL_BEGIN:
     mov   ax, cs
     mov   ds, ax
     mov   es, ax
     mov   ss, ax
     call  READ_FLOPPY
     jmp   START

READ_FLOPPY:
     mov ax,0
     mov es,ax
     mov bx,0x8000
     mov al,1
     mov ch,0
     mov cl,2
     mov dl,0
     mov dh,0
     mov ah,2
     int 13h
     ret