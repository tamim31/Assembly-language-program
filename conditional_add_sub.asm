
data segment
     a db 0dh,0ah," first number $"
     b db 0dh,0ah," second number $"  
     c db 0dh,0ah,"result is $"
     data ends

code segment
    assume CS:code,DS:Data
    
    start:
    
    mov ax,Data
    mov DS,ax
    
    mov dx,offset a
    mov ah,09
    int 21h 
    
    mov ah,01h
    int 21h
    call AsciitoHex
    mov bl,al 
    
    
    
    mov dx,offset b
    mov ah,09
    int 21h 
    
    mov ah,01h
    int 21h
    call AsciitoHex
    mov cl,al
              
              
              
     
     mov dx,offset c
    mov ah,09
    int 21h 
    
    cmp bl,cl
    jng add1 ;edit
     
    call sub1   ;edit
    ret
    
    
      add1: 
   
  mov al,bl 
  add al,cl 
  
  call AsciiConv
  mov dl,al 
  
     mov ah,02
     int 21h
  
   ret
   
   
      sub1:
       
       
     xor ax,ax
     mov al,bl
     sub al,cl 
     call AsciiConv
     mov dl,al
     mov ah,02
     int 21h
     ret
  
     
    
    
  AsciiConv proc 
  cmp al,0ah
  jc skip
  add al,07h
  skip: add al,30h
  ret
  endp

 AsciitoHex proc 
  cmp al,41h 
  jc skippy
  sub al,07h
  skippy: sub al,30h
  ret
 endp 
 
 
    
    
    
    
 code ends
end start



