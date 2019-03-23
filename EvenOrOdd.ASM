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

.data
n db 0
space db 10,13, " $"
l db 0
se db 0
msg1 db 10,13, "Enter the number$"
msg2 db 10,13, "odd$"
msg3 db 10,13, "Even$"
.code
mov ax,@data
mov ds,ax
mov se,00h
print msg1
input l
mov cl,02h
mov al,l
mov ah,00h
div cl
cmp ah,se
je l1
print msg2
jmp exit
l1:print msg3
exit:mov ah,4ch
int 21h
end

