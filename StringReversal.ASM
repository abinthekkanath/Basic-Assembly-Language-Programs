 .model small
 print macro p
 lea dx,p
 mov ah,09h
 int 21h
 endm
 .data
 msg db 10,13, "Enter string:$"
 a db 20 dup(" ")
 .code
 mov ax,@data
 mov ds,ax
 print msg
 l2:mov ah,01h
 int 21h
 cmp al,0Dh
 je l1
 mov a[si],al
 inc si
 jmp l2
 l1:dec si
l3:mov dl,a[si]
mov ah,02h
int 21h
dec si
cmp si,-1
jnz l3
mov ah,4ch
int 21h
end
