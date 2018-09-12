.Model Small
.Stack 100h
.data 
    not1 db 10,13, 'Nhap so nhi phan(16 bit) thu nhat: $'
    not2 db 10,13, 'Nhap so nhi phan(16 bit) thu hai: $'
    not3 db 10,13, 'Tong cua 2 so nhi phan la: $'   
    not4 db 10,13, 'nhap lai: $'
    x1 dw 0
    x2 dw 0
.code
Main Proc
    mov ax, @data
    mov ds, ax    

;nhap so nhi phan thu nhat 

nhap1:      
    ;hien thi not1 ra man hinh
    mov ah,9 
    lea dx,not1
    int 21h
    xor bx,bx ; bx = 0

;nhap so thu 1
    mov ah,1
lap1:
    int 21h
    cmp al,13 ; so sanh voi enter
    je nhap2  ;neu enter nhay den nhap2 de nhap so thu 2
    cmp al,49 
    jg thoat   ;nhay den thoat neu so nhap vao lon hon 1
    cmp al,48
    jl thoat   ;nhay den thoat neu so nhap vao nho hon 0
    sub al,30h
    shl bx,1 ;dich sang trai
    or bl,al
    mov x1,bx
    jmp lap1

;nhap so nhi phan thu 2

nhap2:     
;hien thi not2
    mov ah,9    
    lea dx, not2
    int 21h
    xor bx,bx ; bx = 0
    
;nhap so thu 2
    mov ah,1 
lap2: 
    int 21h
    cmp al,13 
    je dung
    cmp al,49
    jg thoat
    cmp al,48
    jl thoat
    sub al,30h
    shl bx,1
    or bl,al
    mov x2,bx
    jmp lap2  

dung:
    mov cx,16
    mov ah,09
    lea dx,not3
    int 21h
    ;tinh tong 2 so
    mov ax,x1
    mov bx,x2
    add bx,ax
    mov ah,2   
    
;hien thi ket qua ra man hinh  

output:
    xor dl,dl
    rol bx,1 ; xoay vong de hien thi ket qua trong thanh bx ra man hinh
    adc dl,30h
    int 21h
    loop output
    mov ah,4ch  
    int 21h
              
thoat:
    mov ah,09
    lea dx,not4
    int 21h
    jmp nhap1

Main EndP 
end main



    
    