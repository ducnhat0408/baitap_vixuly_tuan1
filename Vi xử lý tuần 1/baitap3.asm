.Model Small
.Stack 100h
.Data
   not1 db 'Nhap vao mot chuoi ky tu: $'
   not2 db 10,13,'Chuoi dao nguoc la: $'
.Code
Main Proc
   mov ax,@data
   mov ds,ax 
;hien thi not1
   mov ah,09h
   lea dx,not1
   int 21h
 
   mov cx, 0 ;khoi tao bien dem
   mov ah,01h

Nhapchuoi:
   xor bx,bx ;bx=0
   int 21h
   cmp al,13 ;Neu nguoi dung an Enter thi ket thuc nhap
   je Tieptuc
   mov bl,al
   push bx
   inc cx
   jmp Nhapchuoi
 
Tieptuc:
   mov ah,09h
   lea dx,not2
   int 21h
 
   mov ah,02h
HienChuoi:
   pop bx  ; pop vao bx
   mov dl,bl
   int 21h
   loop HienChuoi
 
;tro ve dos
mov ah,4ch
int 21h
 
Main EndP
End Main