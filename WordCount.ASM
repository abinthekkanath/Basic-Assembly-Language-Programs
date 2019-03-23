    .model small
print macro  p
lea dx,p
mov ah,09h
int 21h
endm
.data
msg1 db 10,13, "Enter String:$"
msg2 db 10,13, "Number of words:$"
ar  db 100 dup("$")
.code
mov ax,@data
mov ds,ax
print msg1
mov ah,3fh
lea dx,ar
mov ah,0ah
int 21h
mov si,00h
mov bh,00h
mov bl,01h
l1:cmp ar[si],0dh
jz l3
cmp ar[si]," "
jz l2
inc si
jmp l1
l2:inc bl
inc si
jmp l1
l3:print msg2
mov dl,bl
add dl,30h
mov ah,02h
int 21h
mov dl,cl
add dl,30h
mov ah,02h
mov ah,4ch
int 21h
end
