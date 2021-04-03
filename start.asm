org 0x8000

jmp BOOT

[SECTION  .s16]
[BITS  16]
BOOT:
mov cx, len
mov bp, msg
call SHOW_STRING
call SHOW_STRING
call SHOW_STRING

jmp $

PRINT_ERROR:
     mov   bp, err;
     mov   cx, een;
     call  SHOW_STRING
     ret

PRINT_SUCCESS:
     mov   bp, suc;
     mov   cx, cen;
     call  SHOW_STRING
     ret

SHOW_STRING:  ;show string, if you want to call me,
              ;please use bp to transfer string address for parameter
              ;cx is length of your string @author frank
     mov   ax, 0x1301
     mov   bx, 0x000c ;color is bl
     int   0x10
     mov   dh,[line]
     add   dh,1
     mov   [line],dh
     ret


[SECTION .data]
msg:  DB     "this is a operating system by frank", 0
len   equ     $ - msg
err:  DB     "this is a error", 0
een   equ     $ - err
suc:  DB     "operating succeed", 0
cen   equ     $ - suc
line: DB      0x0
SegCode32Len   equ  $ - msg
