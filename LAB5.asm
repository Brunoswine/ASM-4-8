;.386 
.model small
.stack 100h

.data
    ;file_name db 'c:\data.txt'
    file_name db 80 dup(0)
    sourceId dw 0
    
    ;temp_file db 'c:\temp.txt'
    temp_file db 80 dup(0)
    tempId dw 0
    
    lench dw 0
    
    string_word db 80 dup('$')
    string_word_length dw 0
    
    
    buffer db ?
    
    
    
    found_msg db 'Found string_word in line!',0dh,0ah,'$'
    n_line_msg db 'New line',0dh,0ah,'$'
    end_file_msg db 'End file!',0dh,0ah,'$'
    enter_string_word db 'Please enter word to search:',0dh,0ah,'$'
    new_line db 0dh,0ah,'$'                                                              
    files_error_msg db 'Error in create or open files!',0dh,0ah,'$'
    files_success_msg db 'Success in open and create files!',0dh,0ah,'$'
    cmd_error_msg db 'Command line arguments ERROR. First argument is the output file, second is input file',0dh,0ah,'$' 
    cmd_success_msg db 'Success copy file name!',0dh,0ah,'$'
    finish_program db 'Finish program!',0dh,0ah,'$'

.code
.386    

print macro out_str
    mov ah,9
    mov dx,offset out_str
    int 21h
endm   

print_symbol macro out_symbol
    mov ah,02h
    mov dl,out_symbol
    int 21h
endm


getTempFile proc
    pusha
    mov di,offset temp_file
    xor ax,ax
    xor cx,cx     
    mov si,80h
    mov cl,es:[si] ;dlina
    cmp cl,0
    je cmdError    
    add si,2
    mov al,es:[si]
    cmp al,' '
    je cmdError
    cmp al,0dh
    je cmdError
       
       
copyFileNameFromCmd:
    mov ds:[di],al
    inc di
    inc si
    mov al,es:[si]
    cmp al,' '
    je NextFileNameGet
    cmp al,0dh
    je cmdError
    jmp copyFileNameFromCmd 

NextFileNameGet:
    mov ds:[di],'$'
    inc si
    mov al,es:[si]
    cmp al,' '
    je cmdError   
    cmp al,0dh
    je cmdError
    mov di,offset file_name 
       
NextFileName:
    mov ds:[di],al
    inc di
    inc si
    mov al,es:[si]
    cmp al,' '
    je cmdError
    cmp al,0dh
    je endCmd
    jmp NextFileName  
          
cmdError:
    print cmd_error_msg
    jmp to_end  
    
endCmd:   
    mov ds:[di],'$'
    print cmd_success_msg
    popa
    ret      
getTempFile endp



enterString proc
    pusha 
    print enter_string_word
    xor ax,ax
    mov ah,0ah
    mov dx,offset string_word
    int 21h
    
    mov si,offset string_word
    inc si
    xor ax,ax
    mov al,[si]
    mov string_word_length,ax 
;    print new_line
    popa
    ret
enterString endp  


 
openFiles proc
    pusha     
    ;;data file;;;
    xor cx,cx
    mov dx,offset file_name
    mov ah,3dh;open exists file
    mov al,00;only read
    int 21h
    jc error_in_filse   
    
    mov sourceId,ax
    ;;;temp file;;;
    mov ah,3ch;create new file
    xor cx,cx
    mov dx,offset temp_file
    int 21h
    jc error_in_filse
    mov tempId,ax
    jmp success_in_files 
    
error_in_filse:
    print files_error_msg     
    jmp to_end
success_in_files:
    print files_success_msg    
    popa
    ret
openFiles endp
main_read_file proc
    pusha 
st:
    mov si,2
skip_endl:;propusk endl    
    mov ah,3fh
    mov bx,sourceId
    mov cx,1
    mov dx,offset buffer
    int 21h
    cmp ax,cx
    jnz end_file_found 
    cmp buffer,0ah
    je skip_endl
    cmp buffer,0dh
    je skip_endl  
    mov lench,0                   
start_check:;nachalo proverki skip spaces
    cmp buffer,' '
    jne x;ne probel
                        ;;read next symbol;;
    mov ah,3fh
    mov bx,sourceId
    mov cx,1
    mov dx,offset buffer
    int 21h      
    cmp ax,cx
    jnz end_file_found    
    inc lench
    jmp start_check
x:                  ;naiden pervii symbol ne probel
    mov bl,buffer
    cmp string_word[si],bl
    jnz bad_symbol
good_symbol:
    ;;read next symbol;;
    mov ah,3fh
    mov bx,sourceId
    mov cx,1
    mov dx,offset buffer
    int 21h     
    cmp ax,cx
    jnz end_file_found     
    inc lench
    inc si
    cmp string_word[si],0dh
    je final_check    
    jmp x    
bad_symbol:
    mov si,2
a:
    cmp buffer,0dh
    je new_line_found            ;read next symbol
    mov ah,3fh
    mov bx,sourceId
    mov cx,1
    mov dx,offset buffer
    int 21h  
    cmp ax,cx
    jnz end_file_found    
    inc lench
    cmp buffer,' '
    je start_check
    jmp a  
final_check:
    cmp buffer,' '
    je found
    cmp buffer,0dh
    je found
    jmp bad_symbol
found:
                        ;print found_msg   
    call write_to_temp
    jmp st       
new_line_found:  
                        ;print n_line_msg
    jmp st     
end_file_found:
    print end_file_msg       
end_main_read_file:         
    popa                                    
    ret
main_read_file endp 

write_to_temp proc
    pusha 
    inc lench        ; lench offset
    mov ah,42h
    mov al,1
    mov bx,sourceId
    mov dx,lench
    neg dx
    mov cx,-1
    int 21h  
    
to_temp:
   
    mov ah,3fh                    ;read from source
    mov bx,sourceId
    mov cx,1
    mov dx,offset buffer  
    int 21h 
    cmp ax,cx
    jnz end_file_found                     ;write to temp
   
    mov ah,40h
    mov bx,tempId
    mov cx,1
    mov dx,offset buffer
    int 21h
    
    cmp buffer,0ah
    je end_write_to_temp
    
    jmp to_temp
end_write_to_temp:            
    popa
    ret
write_to_temp endp



start:
    mov ax,@data
    mov ds,ax
    mov ax,3
    int 10h
    
    call getTempFile
    
    call enterString
    
    call openFiles 
    
    call main_read_file
    
    
to_end: 
   ; print finish_program
    mov ah,4ch
    int 21h
end start