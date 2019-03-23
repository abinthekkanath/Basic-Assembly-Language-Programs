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
space db 10,13, "$"
msg2 db 10,13, "enter the nos:$"
msg1 db 10,13, "enter limit:$"
msg3 db 10,13, "Sorted array$"
ar db 20 dup(" ")
.code
mov ax,@data
mov ds,ax

print msg1
input n
mov bl,n
mov bh,00h
mov si,00h
print msg2
repeat:input ar[si]
inc si
print space
cmp si,bx
jnz repeat

mov cl,00h
lop1:
mov si,00h
mov di,01h
lop2:
mov al,ar[si]
mov dl,ar[di]
cmp al,dl
jg swap
inc si
inc di
cmp di,bx
jnz lop2
inc cx
cmp cx,bx
jnz lop1
jmp disp
swap:mov n,al
mov al,dl
mov dl,n
mov ar[si],00h
mov ar[di],00h
mov ar[si],al
mov ar[di],dl
inc si
inc di
cmp di,bx
jnz lop1
jmp disp
disp:print msg3
mov si,00h
display:
output ar[si]
inc si
print space
cmp si,bx
jnz display
jmp exit
exit:mov ah,4ch
int 21h
end
