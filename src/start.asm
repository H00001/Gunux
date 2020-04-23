org  0x7c00;
jmp  init
init:
    mov  ax, 0
    mov  ss, ax
    mov  ds, ax
    mov  es, ax
    mov  si, msg
    mov  es, ax

putloop:
    mov  ah, 0x13
    mov  bp, 0
    mov  dh, 0
    mov  dx, 0
    mov  cx, 28
    mov  al, 1
    int 0x10
loop:
    mov  ah, 0x0e
    mov  al, [si]
    add  si, 1
    cmp  al, 0
    je  fin
    int 0x10
    jmp  loop

fin:
    HLT
    jmp  fin

msg:
    db    "gun os v1.1"
    db    0x0a
    db    0
