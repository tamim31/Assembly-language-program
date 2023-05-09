
 .model small
.stack

.data

 
 .code
 
 main proc 
   
    
  
    
    mov ah,01
    int 21h

    

cmp al,40h
jg cap

cmp al,40h
jle ext  

 


cap: 
  cmp al,5ah
  jle capital
  
  cmp al,5ah
  jg sm
  ret

sm: 
  cmp al,60h
  jg sm1
  
  cmp al,60h
  jle ext
  ret
  
sm1:
   cmp al,7ah
   jg ext 
   
   cmp al,7ah
   jle small
   ret  
   
   

capital:
     add al,32
     mov dl,al 
      
     mov ah,02h 
     
     int 21h
     ret
small:       
     sub al,32
     mov dl,al 
       
     mov ah,02h  
       
     int 21h
     ret
    
ext:     

    
    mov ah,09h  
   
    int 21h 
     
    ret
    
    
code ends
