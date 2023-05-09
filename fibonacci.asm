.model small
.data

msg_1 db 10,13,'nth number: $'
msg_2 db 10,13,'fibonacci series is: 0 1 $'
num dw ?
a dw 0h
b dw 01h

.code
mov AX,@data
mov DS,AX

lea DX,msg_1
call printf
call   rr   

mov cx,num		
sub cx,02h		

lea DX,msg_2
call printf

loop1:				
		mov AX,a		
		add AX,b		
		mov a,AX		
		mov DI,CX			
		mov DX,AX			
		call print_8bit		
		mov AX,a			
		XCHG AX,b			
		mov a,AX
		mov CX,DI		
loop loop1

mov AH,4Ch
int 21h


   
   
   
   
   print_8bit proc near	
	mov ax,0000h
	mov al,dl
	mov bx,0010d
	mov CX,0000h
	
	Loop_push:
		mov DX,0000h
		div BX
		push DX
		inc CX
		cmp AX,0000h
	JNE Loop_push
	
	Loop_pop:
		pop DX
		add dx,0030h	
		mov ah,02h		
		int 21h
	loop Loop_pop
	
	mov dl,' '	
	mov ah,02h
	int 21h
	
	ret	




    
    rr:	
	mov AH,01h		
	int 21h
	sub AL,30h
	mov BL,AL		
	mov AH,01h		
	int 21h
	sub AL,30h
	mov AH,BL
	AAD				
	mov num,AX
	ret


printf proc near
	mov AH,09h
	int 21h
	ret
printf endp

end