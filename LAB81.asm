.model tiny
.code
org 100h  

start:
jmp main

         
resident_data: 
                           
filename          db "screen.txt",0

file_error_string db "file error", 0dh, 0ah, '$'   

filebuf           db 80*25    dup(?)     	


print macro out_str
    mov ah,9
    mov dx,offset out_str
    int 21h
endm   

	
proc screenshot far
        cli 
        pusha
        push    ds
        push    es
        mov     ax, cs
        mov     ds, ax
        mov     es, ax 
        mov     ah, 3ch   
        mov     dx, offset filename
        xor     cx, cx
        int     21h
        jc      file_error
        push    ax
        push    ds
        mov     ax, 0b800h
        mov     ds, ax
        mov     cx, 25
        mov     di,offset filebuf
        xor     si, si
loop1:    
        push    cx
        mov     cx, 80
loop2:    
        movsb
        inc     si
        loop    loop2
        pop     cx
        loop    loop1
        pop     ds
        mov     ah, 40h
        pop     bx
        mov     cx, 80*25
        mov     dx,offset filebuf
        int     21h
        jc      file_error
        mov     ah, 3eh
        int     21h
        jc      file_error
        jmp 	screenshot_end
file_error:
      
        print file_error_string
         
screenshot_end:
        pop 	es
        pop 	ds
        popa
        sti
        db  0eah
        old_handler dd 0    
        iret
     
endp screenshot       

main:   

        mov     ah, 35h
        mov     al, 05h
        int     21h   
        
        mov     word ptr old_handler,   bx  
        mov     word ptr old_handler+2, es
        
        mov     ah, 25h
        mov     al, 05h
        mov     dx, offset screenshot
        int     21h
        mov 	ax, 3100h
        mov 	dx, (main-start+10fh)/16
        int     21h
end main     