.model small
.stack
print macro p
lea dx,p
mov ah,09h
int 21h
endm
.data
cn db 0
pn db 0
space db 10,13, " $"
msg db 10,13, "hjut$"
msg1 db "Enter String:$"
msg2 db "Enter SubString:$"
msg3 db "Substing is Not Found$"
msg4 db "Substing is Found $"
ar db 20 dup("$")
br db 20 dup("$")
.code
mov ax,@data
mov ds,ax
mov si,01h
mov di,00h
mov cn,00h
print msg1
read1:mov ah,01h
int 21h
mov ar[si],al
inc si
cmp al,0dh
jnz read1

mov si,00h
print msg2
read2:mov ah,01h
int 21h
mov br[si],al
inc si
cmp al,0dh
jnz read2

mov si,00h
mov di,00h
jmp lop1
lop1: mov di,00h
inc si
mov bh,ar[si]
cmp bh,0dh
jz disp
mov bh,br[di]
cmp ar[si],bh
jnz lop1
jz lop2
lop2:inc si
inc di
mov bh,br[di]
cmp bh,0dh
jz l1
mov bh,br[di]
cmp ar[si],bh
jz lop2
jmp lop1
 l1:
 add cn,01h
 dec si
 jmp lop1
 disp:
 cmp cn,00h
 jz disp1
 print msg4
 add cn,30h
 mov dl,cn
 mov ah,02h
 int 21h
 jmp exit
 disp1:print msg3
exit:mov ah,4ch
int 21h
end

