data segment
     a db 0dh,0ah,"enter input $"
    b db 0dh,0ah,"output $"  
    data ends
code segment
    assume CS:code,DS:Data
    
    start:
    
    mov ax,Data
    mov DS,ax
    
    mov dx,offset a
    mov ah,09   ;to print a string on the screen or other output device.
    int 21h
    
    mov ah,01
    int 21h
               
    cmp al,60h ;60 take boro na mane upper case ace,lower case nite
               ;hole 20h add korbo
    JNG ad
    
    sub al,20h ;60 take boro mane lower case ace,upper case a nite hole
                ; 20 sub korte hobe
    mov bl,al
    
    result:
    mov dx,offset b
    mov ah,09
    int 21h
    
    mov dl,bl
    
    mov ah,02 ;to write a single character to the console or other output device.
    int 21h 
    
    ret 
    
    
    
    ad:
    add al,20h
    mov bl,al
      
    mov dx,offset b
    mov ah,09
    int 21h  
    
    mov dl,bl
    
    mov ah,02
    int 21h
    ret 
    
    mov ah,4ch
    int 21h
    code ends
end start