 .model small
 print macro p
 lea dx,p
 mov ah,09h
 int 21h
 endm
 .data
 msg1 db 10,13, "Enter string:$"
 msg2 db 10,13, "not Palindrome$"
 msg3 db 10,13, "palindrome$"
 ar db 20 dup(" ")
 .code 
 mov ax,@data
 mov ds,ax
 mov si,1
 mov di,1
 print msg1
 l2:mov ah,01h
 int 21h
 cmp al,0dh
 je l1
 mov ar[si],al
 inc si
 jmp l2
 l1:dec si
 l4:mov bh,ar[di]
 cmp bh,ar[si]
 jnz l6
 dec si
 inc di
 cmp si,0
 je l3
 jmp l4
 l3:print msg3
 jmp l5
 l6:print msg2
l5:mov ah,4ch
int 21h
end
