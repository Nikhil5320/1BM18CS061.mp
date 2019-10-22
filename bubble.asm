.model small
.data
a db 06,01,04,02,00,05
.code
mov ax,@data
mov ds,ax
mov dl,05

outer:mov si,offset a
      mov cl,dl
   inner:mov al,[si]
         cmp al,[si+1]
         ja l
         inc si
         dec cl
         cmp cl,0
         ja inner
         jmp outer_check
       l:xchg ax,[si+1]
         xchg ax,[si]
         inc si
         dec cl
         cmp cl,0
         ja inner
outer_check:dec dl
            cmp dl,0
            ja outer
mov si,offset a
mov cl,06
l1:mov ah,02h
   mov dl,[si]
   int 21h
   inc si
   dec cl
   cmp cl,0
   ja l1
mov ah,4ch
int 21h
end


