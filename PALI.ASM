.model small
.data
str1 db 'Manage'
len dw $-str1
str2 db 9 dup('$')
msg1 db 'Entered String is a Palindrome$'
msg2 db 'Entered String is not a Palindrome$'
.code
mov ax,@data
mov ds,ax
mov es,ax
mov si,offset str1
mov bx,len
add si,bx
dec si
std
mov di,offset str2
mov cx,len
l:movsb
  add di,02
  loop l
cld
mov si,offset str1
mov di,offset str2
mov cx,len
l1:  cmpsb
     jnz l2
     loop l1
mov dx,offset msg1
mov ah,09h
int 21h
jmp exit
l2:mov dx,offset msg2
   mov ah,09h
   int 21h
exit:mov ah,4ch
     int 21h
     end


