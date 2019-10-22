                                                                              l3:mov ah,09h
                                                                               mov dx,offset msg1
                                                                               int 21h
                                                                               jmp finish
                                                                               exit:mov ah,09h
                                                                               mov dx,offset msg2
                                                                               int 21h
                                                                               finish:mov ah,4ch
                                                                               int 21                                        
.model small                                                                              end
.data
a dw 0001,0002,0003,0004,0005,0006,0007
first dw 0000
last dw 0006
key dw 0008
msg1 db 'key is found$'
msg2 db 'key is not found$'
.code
mov ax,@data
mov ds,ax
mov bx,first
mov cx,last
mov dx,key
l:mov si,offset a
  mov ax,bx
  add ax,cx
  shr ax,01
  add si,ax
  add si,ax
  cmp [si],dx
  ja l1
  jb l2
  je l3
  l1:dec ax
     dec ax
     mov cx,ax
     cmp bx,cx
     jbe l
     jmp exit
  l2:inc ax
     inc ax
     mov bx,ax
     cmp bx,cx
     jbe l
     jmp exit
  l3:mov ah,09h
     mov dx,offset msg1
     int 21h
     jmp finish
exit:mov ah,09h
     mov dx,offset msg2
     int 21h
finish:mov ah,4ch
       int 21h
       end
