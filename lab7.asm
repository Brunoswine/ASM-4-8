.model tiny
.code
.186
org 100h


 
jmp start
 
print macro out_str
    mov ah,9
    mov dx,offset out_str
    int 21h
endm    
 
  
getProgramParams proc
	push ax
	push bx
	push cx
	push dx

	mov error, 0
	xor cx, cx    
	mov cl, es:[80h]
	cmp cl, 0
	je invalidCommandLine
	mov di, 82h
	mov si, offset commandText
getSymbols:
	mov al, es:[di]
	cmp al, 0Dh
	je parametersEnded
	mov [si], al
	inc di
	inc si
	jmp getSymbols

invalidCommandLine:
    mov error, 1
    jmp getParamsExit

parametersEnded:
	inc si
	mov byte ptr [si], 0

getParamsExit:
	pop dx
	pop cx
	pop bx
	pop ax
	ret
getProgramParams endp

atoi	proc

    	push bx
    	push cx
    	push dx
    	push si

    	xor bx, bx
    	xor dx, dx
    	mov error, 0

convert:
        xor ax, ax
    	lodsb
    	cmp al, 0
    	je exit
        cmp al, '-'
    	je invalidInput
        cmp al, '9'
    	jnbe invalidInput
    	cmp al, '0'
    	jb invalidInput
    	sub ax, '0'
    	shl dx, 1
    	add ax, dx
    	shl dx, 2
    	add dx, ax
    	cmp dx, MAX_NUMBER
    	jg invalidInput
    	cmp dx, 0
    	je invalidInput
jmp convert
        jmp exit

invalidInput:
        mov error, 1
exit:
        mov ax, dx
        mov N_times, al
    	pop si
    	pop dx
    	pop cx
    	pop bx

	    ret
atoi	endp

start:
    call getProgramParams
	cmp error, 1
	je invalidCommandLineArgs
    
    lea si, commandText
    call atoi
    
    cmp error, 1
    jne loadProgram

    print invalidNumberMessage

    jmp exitStart

loadProgram:

    print newLine
    
	mov sp, programLength + 100h + 200h

	mov ah, 4Ah

	stackShift = programLength + 100h + 200h
	mov bx, stackShift shr 4 + 1
	int 21h


	; exec parameter block ( load and run )
	mov ax, cs
	mov word ptr EPB + 4, ax		; cmd segment
	mov word ptr EPB + 8, ax		; fcb1 segment
	mov word ptr EPB + 0Ch, ax		; fcb2 segment

	xor cx, cx
	mov cl, N_times

runProgram:
	mov ax, 4B00h
	mov dx,offset programPath
	mov bx,offset EPB
	int 21h
	jc errorDuringLoadingProgram
	loop runProgram

    jmp exitStart

errorDuringLoadingProgram:
    
    print error4Bh
   
    jmp exitStart

invalidCommandLineArgs:
    print invalidCmdArgs

exitStart:

	int 20h

.data


newLine db  0Dh,0Ah, '$'
invalidNumberMessage db 'Invalid input: number should contain only digits in the following range [1, 255]', 0Dh,0Ah, '$'
invalidCmdArgs  db      'Command line arguments ERROR. Try again.', 0Dh,0Ah, '$'
error4Bh db 'Error has happened during loading/running program.', 0Dh,0Ah, 'Check your program path and try again', '$'

error db  0
N_times db 0    

programPath db "program.exe"

EPB	         dw	0000
	         dw offset commandLine, 0
	         dw 005Ch, 0, 006Ch, 0
commandLine     db   0
commandText		db 	125 dup(0)
MAX_NUMBER		equ		255
programLength	equ		$ - start
                                     
                                     
end start
