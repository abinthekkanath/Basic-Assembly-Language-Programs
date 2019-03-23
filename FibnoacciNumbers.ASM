.model small
.stack
print macro p
lea dx,p
mov ah,09h
int 21h
endm

input macro v
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
mov v,al
endm

output macro o
mov al,o
mov cl,0ah
mov ah,00h
div cl
mov cl,ah
add al,30h
mov dl,al
mov ah,02h
int 21h
add cl,30h
mov dl,cl
mov ah,02h
int 21h
endm

.data
n db 0
space db 10,13, " $"
f1 db 0
f2 db 0
se db 0
msg1 db 10,13, "Enter the limit:$"
msg2 db 10,13, "The Fibnaci numbers:$"

.code
mov ax,@data
mov ds,ax
print msg1
input n
mov si,02h
mov bl,n
mov bh,00h
mov f1,00h
mov f2,01h
mov se,00h
print msg2
output f1
print space
output f2
print space
repeat:
mov al,f1
mov dl,f2
add al,dl
mov se,al
output se
mov al,f2
mov f1,al
mov al,se
mov f2,al
print space
inc si
cmp si,bx
jnz repeat

exit:mov ah,4ch
int 21h
end

