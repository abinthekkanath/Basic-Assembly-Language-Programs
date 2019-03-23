.model small
print macro p
lea dx,p
mov ah,09h
int 21h
endm

input macro i
mov ah,01h
int 21h
sub al,30h
mov cl,0ah
mov ah,00h
mul cl
mov cl,al
mov ah,01h
int 21h
sub al,30h
add al,cl
mov i,al
endm

output macro o
mov al,o
mov cl,0ah
mov ah,00h
div cl
mov bh,ah
mov dl,al
add dl,30h
mov ah,02h
int 21h
mov dl,bh
add dl,30h
mov ah,02h
int 21h
endm
.data
n db 0
space db 10,13, " $"
l db 0
sm db 0
msg2 db 10,13, "enter the no:$"
msg1 db 10,13, "enter limit:$"
msg3 db 10,13, "largest no:$"
msg4 db 10,13, "smallest no:$"
ar db 10 dup(" ")
.code
mov ax,@data
mov ds,ax

print msg1
input n
mov bl,n
mov bh,00h
mov si,00h
print msg2
repeat:
input ar[si]
inc si
print space
cmp si,bx
jnz repeat
mov l,00h
mov sm,00h
mov si,00h
large:mov al,ar[si]
cmp al,l
jl op1
mov al,ar[si]
mov l,al
op1:inc si
cmp si,bx
jnz large
print msg3
output l

mov al,00h
mov bl,n
mov bh,00h
mov si,00h

mov al,ar[00]

mov sm,al
mov si,01h
small:mov al,ar[si]
cmp al,sm
jg op2
mov al,ar[si]
mov sm,al
op2:inc si
mov bl,n
mov bh,00h

cmp si,bx
jnz small
mov al,sm
print msg4
output sm

mov ah,4ch
int 21h
end
