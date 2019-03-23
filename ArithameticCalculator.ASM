.model small
print macro p
lea dx,p
mov ah,09h
int 21h
endm
.data
sl db 0
aa db 0
ab db 0
q db 0
r db 0
rr db 0
msgme db 10,13, "1.Addition  2.Subtraction 3.Multiplication 4.division 5.exit $"
msgs db 10,13, "Enter your choice$"
msg1 db 10,13, "Enter 1st number:$"
msg2 db 10,13, "Enter 2nd number:$"
msgad db 10,13, "Sum:$"
msgsu db 10,13, "Differenc:$"
msgmu db 10,13, "Product:$"
msgqu db   10,13, "Qutient:$"
msgre db 10,13, "Reminder:$"
.code
mov ax,@data
mov ds,ax

menue:print msgme
print msgs
mov ah,01h
int 21h

mov sl,al
cmp sl,'5'
je et
print msg1
mov ah,01h
int 21h
sub al,30h
mov aa,al
print msg2
mov ah,01h
int 21h
sub al,30h
mov ab,al
cmp sl,'1'
je addition
cmp sl,'2'
je subtraction
cmp sl,'3'
je multiplication
cmp sl,'4'
je division

et:jmp exit
addition:print msgad
mov al,aa
add al,ab
jmp result
subtraction:print msgsu
mov al,aa
sub al,ab
jmp result
multiplication:print msgmu
mov al,aa
mul ab
jmp result
division:print msgqu
mov q,'0'
mov al,aa
mov ah,00h
mov bl,ab
div bl
mov r,ah
jmp result
re:print msgre
inc q
mov al,r
result:
mov ah,00h
mov cl,0ah
div cl
mov rr,ah
mov dl,al
add dl,30h
mov ah,02h
int 21h
mov dl,rr
add dl,30h
mov ah,02h
int 21h
cmp q,'0'
je re
jmp menue
exit:mov ah,4ch
int 21h
end
