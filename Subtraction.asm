  .model small
.stack

.data

 a db db 10,13,'first input is $'
 b db db 10,13,'second input is $'
 c db db 10,13,'subtraction is $'
 .code
 
 main proc
    mov ax,@data
    mov ds,ax
     
     ;1st input
    mov ah,9
    lea dx,a 
    int 21h
    
    mov ah,01
    int 21h 
    
    ;ascii to hex  
      call t1
      mov bl,al
      rol bl,4
      
      mov ah,01
      int 21h
      call t1
      add bl,al 
      
     ;second input 
     
     mov ah,9
    lea dx,b 
    int 21h
    
    mov ah,01
    int 21h
    
    ;ascii to hex  
      call t1
      mov cl,al
      rol cl,4
      
      mov ah,01
      int 21h
      call t1
      add cl,al 
      
       ;sub 1st r 2nd input
      sub bl,cl
    
   
 
      ;cl result ta copy kore raklam
  mov cl,bl
      
      and bl,0F0h
      ror bl,4
       call t2
        
        
        ;result
        mov ah,9
    lea dx,c 
    int 21h
    
    
    
   
       mov dl,bl
       mov ah,02
       int 21h  
       
       mov bl,cl
       and bl,0Fh
       call t2
       
       mov dl,bl
       mov ah,02
       int 21h
       
       mov ah,4ch
       int 21h
     
     
     t2 proc
        cmp bl,0ah
        jc z2
        add bl,07h
        z2: add bl,30h
        ret
        endp
    
    t1 proc
        cmp al,40h
        jc z1
        sub al,07h
        z1: sub al,30h
        ret
        endp 
    
















