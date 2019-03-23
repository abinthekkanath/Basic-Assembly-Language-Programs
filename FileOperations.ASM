.model small
.stack
print macro p
lea dx,p
mov ah,09h
int 21h
endm
.data
fname db "file.txt",0h
handle dw ?
err db 10,13, "ERROR$"
buff dw 100 dup("$")
nwln db 10,13, "$"
msgme db 10,13, "1.Create 2.write 3.Read 4.Delete 5.Exit$"
msgc db 10,13, "Enter choice$"
msgcr db 10,13, "File Created$"
msgde db 10,13, "File Deleted$"
msgwr db 10,13, "Enter Data:$"
readbuff db 10 dup("$")
.code
mov ax,@data
mov ds,ax
menu:print msgme
print msgc
mov ah,01h
int 21h
print nwln
cmp al,31h
je create
cmp al,32h
je write
cmp al,33h
je read
cmp al,34h
je delte
cmp al,35h
je ext
create:mov ah,3ch
lea dx,fname
mov cl,1
int 21h
mov handle,ax
jc openerr
print msgcr
jmp menu
openerr:print err
jmp menu
delte:jmp delete
ext:jmp exit
write:print msgwr
print nwln
mov ah,0ah
lea dx,buff
int 21h
mov si,offset buff+1
mov ah,40h
mov bx,handle
mov cl,[si]
mov dx,offset buff+2
int 21h
mov ah,3eh
mov bx,handle
int 21h
jmp menu
read:mov ah,3dh
mov al,0
lea dx,fname
int 21h
mov handle,ax
mov ah,3fh
mov bx,handle
add cx,2
lea dx,readbuff
int 21h
jc readerr
cmp ax,cx
jl disp
jmp read
readerr:
print err
jmp menu
disp:print readbuff
mov ah,3eh
mov bx,handle
int 21h
jmp menu
delete:lea dx,fname
mov ah,41h
int 21h
print msgde
jmp menu
exit:mov ah,4ch
int 21h
end
cmp al
