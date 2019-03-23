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
l db 0
se db 0
msg1 db 10,13, "Enter the limit$"
msg2 db 10,13, "Enter the nos:$"
msg3 db 10,13, "Enter the number to be searched:$"
msg4 db 10,13, "Found in position:$"
msg5 db 10,13, "Not Found$"
ar db 10 dup("$")
.code
mov ax,@data
mov ds,ax
print msg1
input l
mov bl,l
mov bh,00h
mov si,00h
print msg2
repeat:input ar[si]
inc si
print space
cmp si,bx
jnz repeat
print msg3
input se
mov si,00h
mov cl,00h

search:mov al,ar[si]
cmp al,se
jz display
inc si
inc cl
cmp si,bx
jnz search
jmp disp
display:print msg4
output cl
jmp exit

disp:print msg5
jmp exit
exit:mov ah,4ch
int 21h
end

