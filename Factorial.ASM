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
.data
n db 0
space db 10,13, " $"
fl db 0
fr db 0
fa db 0
msg1 db 10,13, "enter the no:$"
msg2 db 10,13, "Factorial:$"
ar dw 20 dup("$")
.code
mov ax,@data
mov ds,ax

print msg1
input n
mov bl,n
mov bh,00h
print msg2
mov al,01h
mov ah,00h
mov dx,00h
repeat:
mul bx
dec bx
cmp bx,0001h
jne repeat
mov si,01h
mov cl,0ah
mov ch,00h
lop:mov dx,00h
div cx
mov ar[si],dx
inc si
cmp ax,00h
jne lop
print msg2
mov dx,00h
lop2:mov dx,ar[si]
add dx,30h
mov ah,02h
int 21h
dec si
cmp si,00h
jnz lop2
exit:mov ah,4ch
int 21h
end
