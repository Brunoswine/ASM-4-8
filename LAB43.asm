.model small
.stack 100h
.data  
                                                     ; 77 -grey font grey symbol
border equ 7123h                                                  ;55-purple
empty equ 0020h 
;heart equ 0C03h                                                    ;11- blue
bonus equ 0E6Fh  
wall equ  7720h

pacman equ 0E40h ; 01101110 - yellow font and symbol ; 00001110 - only yellow symbol 
enemy1 equ 0B01h ; 00001011 - only blue symbol
enemy2 equ 0C02h ; 00001100 - only red symbol 
scared_enemy1 equ 0F01h
scared_enemy2 equ 0F02h
local_enemy1 dw ?    
local_enemy2 dw ?

enemy_1_next_place dw ?                             
enemy_2_next_place dw ?                        
                        
yellow_arrow equ 0E3Eh
yellow_hyphen equ 0E2Dh 
yellow_P equ 0E50h
yellow_R equ 0E52h
yellow_E equ 0E45h
yellow_S equ 0E53h
yellow_N equ 0E4Eh
yellow_T equ 0E54h
yellow_O equ 0E4Fh
yellow_A equ 0E41h
yellow_C equ 0E43h
yellow_I equ 0E49h
yellow_X equ 0E58h 

yellow_U equ 0E55h
yellow_G equ 0E47h
yellow_M equ 0E4Dh
yellow_V equ 0E56h
yellow_W equ 0E57h
yellow_Y equ 0E59h    


 




;greeting dw 80 dup (border)
;         dw border, 78 dup (empty), border
;         dw border, 78 dup (empty), border
;         dw border, 78 dup (empty), border
;         dw border, 19 dup (empty), 5 dup (border), 2 dup (empty), 5 dup (border), 2 dup (empty), 5 dup (border), 2 dup (empty), border, 3 dup (empty), border, 2 dup (empty), 5 dup (border), 2 dup (empty), border, 3 dup (empty), border, 19 dup (empty), border   
;         dw border, 19 dup (empty), border, 3 dup (empty), border, 2 dup (empty), border, 3 dup (empty), border, 2 dup (empty), border, 6 dup (empty), 2 dup (border), empty, 2 dup (border), 2 dup (empty), border, 3 dup (empty), border, 2 dup (empty), 2 dup (border), 2 dup (empty), border, 19 dup (empty), border
;         dw border, 19 dup (empty), 5 dup (border), 2 dup (empty), 5 dup (border), 2 dup (empty), border, 6 dup (empty), border, empty, border, empty, border, 2 dup (empty), 5 dup (border), 2 dup (empty), border, empty, border, empty, border, 19 dup (empty), border
;         dw border, 19 dup (empty), border, 6 dup (empty), border, 3 dup (empty), border, 2 dup (empty), border, 6 dup (empty), border, 3 dup (empty), border, 2 dup (empty), border, 3 dup (empty), border, 2 dup (empty), border, 2 dup (empty), 2 dup (border), 19 dup (empty), border
;         dw border, 19 dup (empty), border, 6 dup (empty), border, 3 dup (empty), border, 2 dup (empty), 5 dup (border), 2 dup (empty), border, 3 dup (empty), border, 2 dup (empty), border, 3 dup (empty), border, 2 dup (empty), border, 3 dup (empty), border, 19 dup (empty), border
;         dw border, 78 dup (empty), border
;         dw border, 78 dup (empty), border
;         dw border, 78 dup (empty), border
;         dw border, 78 dup (empty), border
;         dw border, 78 dup (empty), border
;         dw border, 78 dup (empty), border
;         dw border, 78 dup (empty), border
;         dw border, 78 dup (empty), border
;         dw border, 36 dup (empty), yellow_hyphen, yellow_arrow, empty, yellow_P, yellow_R, yellow_E, yellow_S, yellow_S, empty, yellow_E, yellow_N, yellow_T, yellow_E, yellow_R, empty, yellow_T, yellow_O, empty, yellow_S, yellow_T, yellow_A, yellow_R, yellow_T, 19 dup (empty), border ;"-> PRESS ENTER TO START"
;         dw border, 39 dup (empty), yellow_hyphen, yellow_arrow, empty, yellow_P, yellow_R, yellow_E, yellow_S, yellow_S, empty, yellow_E, yellow_S, yellow_C, empty, yellow_T, yellow_O, empty, yellow_E, yellow_X, yellow_I, yellow_T, 19 dup (empty), border  ;"-> PRESS ESC TO EXIT"
;         dw border, 78 dup (empty), border
;         dw border, 78 dup (empty), border
;         dw border, 78 dup (empty), border
;         dw border, 78 dup (empty), border
;         dw border, 78 dup (empty), border
;         dw 80 dup (border)



scene dw 80 dup (border), ; 1723h - blue border, 4823h - red border, empty - empty space, 0EFAh - food   
      dw border, empty, 8 dup (0EFAh),10 dup (empty), 16 dup (0EFAh), 8 dup (empty), 16 dup (0EFAh), 10 dup (empty), 8 dup (0EFAh), empty, border
      dw border, empty, 7 dup (border), empty, 10 dup (border), bonus, 15 dup (border), empty, 6 dup (border), empty, 15 dup (border), bonus, 10 dup (border), empty, 7 dup (border), empty, border
      dw border, empty, 7 dup (border), empty, border, 8 dup (empty), border,  empty, border, 13 dup (empty), border, empty, border, 4 dup (empty), border, empty, border, 13 dup (empty), border, empty, border, 8 dup (empty), border, empty, 7 dup (border), empty, border
      dw border, empty ,7 dup (0EFAh), empty, border, 8 dup (empty), border,  empty, border, 13 dup (empty), border, empty, border, 4 dup (empty), border, empty, border, 13 dup (empty), border, empty, border, 8 dup (empty), border, empty ,7 dup (0EFAh), empty, border
      dw border, empty, 7 dup (border), empty, border, 8 dup (empty), border,  empty, 15 dup (border), empty, border, 4 dup (empty), border, empty, 15 dup (border), empty, border, 8 dup (empty), border, empty, 7 dup (border), empty, border
      dw border, empty, 7 dup (border), empty, border, 8 dup (empty), border,  empty, 15 dup (0EFAh), empty, border, 4 dup (empty), border, empty, 15 dup (0EFAh), empty, border, 8 dup (empty), border, empty, 7 dup (border), empty, border
      dw border, empty ,7 dup (0EFAh), empty, border, 8 dup (empty), border,  empty, 15 dup (border), empty, border, 4 dup (empty), border, empty,15 dup (border), empty, border, 8 dup (empty), border, empty ,7 dup (0EFAh), empty, border
      dw 9 dup (border), empty, border, 8 dup (empty), border, 0EFAh, border, 13 dup (empty), border, empty, border, 4 dup (empty), border, empty, border, 13 dup (empty), border, 0EFAh, border, 8 dup (empty), border, empty, 9 dup (border)
      dw border, 7 dup (empty), border, empty, border, 8 dup (empty), border, 0EFAh, border, 12 dup (empty), 2 dup (border), empty, 6 dup (border), empty, 2 dup (border), 12 dup (empty), border, 0EFAh, border, 8 dup (empty), border, empty, border, 7 dup (empty), border
      dw border, 7 dup (empty), border, empty, border, 8 dup (empty), border, 0EFAh, border, 12 dup (empty), border, 10 dup (0EFAh), border, 12 dup (empty), border, 0EFAh, border, 8 dup (empty), border, empty, border, 7 dup (empty), border
      dw 9 dup (border), empty, 10 dup (border), 0EFAh, 14 dup (border), empty, 3 dup (border), 2 dup (empty), 3 dup (border), empty, 14 dup (border), 0EFAh, 10 dup (border), empty, 9 dup (border)
      dw 20 dup (empty), 0EFAh, 15 dup (empty), border, 6 dup (empty), border, 15 dup (empty), 0EFAh, 20 dup (empty)
      dw 9 dup (border), empty, 10 dup (border), 0EFAh, 14 dup (border), empty, 8 dup (border), empty, 14 dup (border), 0EFAh, 10 dup (border), empty, 9 dup (border)
      dw border, 7 dup (empty), border, empty, border, 8 dup (empty), border, 0EFAh, border, 12 dup (empty), border, empty, 8 dup (0EFAh), empty, border, 12 dup (empty), border, 0EFAh, border, 8 dup (empty), border, empty, border, 7 dup (empty), border
      dw border, 7 dup (empty), border, empty, border, 8 dup (empty), border, 0EFAh, border, 12 dup (empty), border, empty, 8 dup (border), empty, border, 12 dup (empty), border, 0EFAh, border, 8 dup (empty), border, empty, border, 7 dup (empty), border
      dw 9 dup (border), empty, border, 8 dup (empty), border, 0EFAh, border, 12 dup (empty), border, empty, border, "PAAACAMAAANA", border, empty, border, 12 dup (empty), border, 0EFAh, border, 8 dup (empty), border, empty, 9 dup (border)
      dw border, empty ,7 dup (0EFAh), empty, border, 8 dup (empty), border, empty, 14 dup (border), empty, 8 dup (border), empty, 14 dup (border), empty, border, 8 dup (empty), border, empty ,7 dup (0EFAh), empty, border
      dw border, empty, 7 dup (border), empty, border, 8 dup (empty), border, empty, 38 dup (0EFAh), empty, border, 8 dup (empty), border, empty, 7 dup (border), empty, border
      dw border, empty, 7 dup (border), empty, border, 8 dup (empty), border, empty, 38 dup (border), empty, border, 8 dup (empty), border, empty, 7 dup (border), empty, border
      dw border, empty ,7 dup (0EFAh), empty, border, 8 dup (empty), border, empty, border, empty, "SACAOARAEA:A", empty, 4 dup (0F30h), 13 dup (empty),"AATAEAMAPATASA:A", empty, 0F33h, empty, border, empty, border, 8 dup (empty), border, empty ,7 dup (0EFAh), empty, border
      dw border, empty, 7 dup (border), empty, border, 8 dup (empty), border, empty, border, 36 dup (empty), border, empty, border, 8 dup (empty), border, empty, 7 dup (border), empty, border
      dw border, empty, 7 dup (border), empty, 10 dup (border), bonus, 38 dup (border), bonus, 10 dup (border), empty, 7 dup (border), empty, border
      dw border, empty, 76 dup (0EFAh), empty, border
      dw 80 dup (border)   
      
game_string dw yellow_G, yellow_A, yellow_M, yellow_E
over_string dw yellow_O, yellow_V, yellow_E, yellow_R
victory_string dw yellow_V, yellow_I, yellow_C, yellow_T, yellow_O, yellow_R, yellow_Y
pause_string dw yellow_P, yellow_A, yellow_U, yellow_S, yellow_E
empty_string dw 5 dup (empty)     

score dw ? 
bonus_counter dw ?   

bonus_enabled_enemy1 db ? 
bonus_enabled_enemy2 db ? 

amount_of_attempts db ?

position dw ? ; instead of X, Y 
start_position equ 
enemyPosition1 dw ?
enemyPosition2 dw ? 
enemy_start_position1 equ 7CCh
enemy_start_position2 equ 7D2h

input db ?  

pacman_left_flag db ?
pacman_right_flag db ?
pacman_up_flag db ?
pacman_down_flag db ? 

enemy_1_direction_flag db ? ; 1 - left, 2 - right, 3 - up, 4 - down
enemy_1_get_out_counter db ?


enemy_2_direction_flag db ? ; 1 - left, 2 - right, 3 - up, 4 - down
enemy_2_get_out_counter db ?

      

.code
random proc near
; take last 4 bits of system timer
    ;mov al, byte ptr ds:006Ch  
    mov ah, 00h
    int 1Ah 
    mov al, 0
    test dl, 2
    jz end_random
    mov al, 1
end_random:
    ret
random endp




 
setup proc near  
    mov ax, 0
    mov pacman_left_flag, al
    mov pacman_right_flag, al
    mov pacman_up_flag, al
    mov pacman_down_flag, al
    mov enemy_1_direction_flag, al
    mov enemy_2_direction_flag, al
    mov score, ax 
    mov bonus_counter, ax
    mov bonus_enabled_enemy1, al
    mov bonus_enabled_enemy2, al 
    push 0b800h
    pop es
    mov ax, 0B90h ; PACMAN start position
    mov position, ax
    mov ax, enemy_start_position1 ; ENEMY1 start position
    mov enemyPosition1, ax
    mov ax, enemy_start_position2 ; ENEMY2 start position
    mov enemyPosition2, ax
    xor di, di
    mov di, position
    mov es:[di], pacman   
    mov di, enemyPosition1
    mov es:[di], enemy1 
    
    mov di, enemyPosition1
    ;mov es:[di-2], scared_enemy1 
    
     
    
    
    
    
    
     
    mov di, enemyPosition2
    mov es:[di], enemy2 
    mov ax, 1
    mov enemy_2_direction_flag, al  
    mov ax, 2
    ;mov ax, 1  
    mov enemy_1_direction_flag, al
    ;mov enemy_1_right_flag, al
    ;mov enemy_2_left_flag, al   
    mov ax, 3
    mov amount_of_attempts, al 
    mov enemy_1_get_out_counter, al
    mov enemy_2_get_out_counter, al
    mov ax, empty
    mov enemy_1_next_place, ax
    mov enemy_2_next_place, ax 
    ret    
setup endp     
 
 

draw_scene proc near
    mov ax, 0003h
    int 10h
    cld
    push 0b800h
    pop es 
    mov si, offset scene      
    mov cx, 7D0h        
    xor di, di             
    rep movsw            
    ret   
draw_scene endp 

;draw_greeting proc near
;    mov ax, 0003h
;    int 10h
;    cld
;    push 0b800h
;    pop es 
;    mov si, offset greeting
;    mov cx, 7D0h        
;    xor di, di             
;    rep movsw
;greeting_input:
;    mov ah, 8
;    int 21h    
;    cmp al, 1Bh ; ESC
;    je end_program
;    cmp al, 0Dh ; Enter
;    je end_draw_greeting
;    jmp greeting_input     
;end_draw_greeting:      
;    ret
;draw_greeting endp    


move proc near 
;=================sleep    
    mov cx, 0E000h
    sleep_external: 
    push cx
    mov cx, 0004h
    sleep: 
    loop sleep 
    pop cx
    loop sleep_external 
;=================sleep
    mov ax, position
    cmp ax, enemyPosition1
    je check_bonus1
    cmp ax, enemyPosition2
    je check_bonus2       
    xor ax, ax
    mov ah, 01h
    int 16h 
    mov input, al
    push ax
    mov ah, 0Ch   
    xor dx, dx
    int 21h  
    pop ax    
    mov di, position  
    ;cmp es:[di+2], border 
    mov al, input
    cmp al, 1Bh ; ESC
    je end_program
    cmp al, 20h ; space -> pause
    jne continue 
;===============pause 
pause:

    mov cx, 3
    mov di, 532h 
print_pause:
    push cx    
    mov si, offset pause_string
    mov cx, 5h                    
    rep movsw
    add di, 28h 
    mov si, offset pause_string
    mov cx, 5h                    
    rep movsw 
    add di, 64h
    pop cx  
    loop print_pause
   
    mov ah, 8
    int 21h
    cmp al, 20h
    je pause
    cmp al, 1Bh ; ESC
    je end_program 
    mov cx, 3
    mov di, 532h 
print_empty:    
    push cx    
    mov si, offset empty_string
    mov cx, 5h                    
    rep movsw
    add di, 28h 
    mov si, offset empty_string
    mov cx, 5h                    
    rep movsw 
    add di, 64h
    pop cx  
    loop print_empty
       
;====================
continue:    
    
    ;cmp al, "w" ; direction up
;    je pacman_move_up 
;    cmp al, "s" ; direction down 
;    je pacman_move_down 
;    cmp al, "a" ; direction left
;    je pacman_move_left 
;    cmp al, "d" ; direction right   
    cmp ah, 48h ; direction up
    je pacman_move_up 
    cmp ah, 50h ; direction down 
    je pacman_move_down 
    cmp ah, 4Bh ; direction left
    je pacman_move_left 
    cmp ah, 4Dh ; direction right
    je pacman_move_right 
check_pacman_direction_flags:    
    cmp pacman_left_flag, 1
    je pacman_move_left
    cmp pacman_right_flag, 1
    je pacman_move_right
    cmp pacman_up_flag, 1
    je pacman_move_up
    cmp pacman_down_flag, 1
    je pacman_move_down 
    jmp end_move_proc
pacman_move_left:
    cmp pacman_left_flag, 0
    jne continue_move_left
    mov di, position; can remove
    cmp es:[di-2], border
    je check_pacman_direction_flags        
continue_move_left:    
    mov al, 1
    mov pacman_left_flag, al
    dec al
    mov pacman_right_flag, al
    mov pacman_up_flag, al
    mov pacman_down_flag, al 
    mov di, position
    cmp di, 780h
    je from_left_to_right   
    cmp es:[di-2], border
    je end_move_proc 
    cmp es:[di-2], 0EFAh ; if next - food
    jne check_bonus_left
    inc score  
check_bonus_left:
        
    cmp es:[di-2], bonus
    jne left_same_score 
    push di
    mov di, enemyPosition1
    mov es:[di], scared_enemy1
    mov di, enemyPosition2
    mov es:[di], scared_enemy2
    pop di
    mov ax, 0A0h
    mov bonus_counter, ax
    cmp bonus_enabled_enemy1, 1
    je continue_check_bonus_left
    inc bonus_enabled_enemy1    
continue_check_bonus_left:    
    cmp bonus_enabled_enemy2, 1
    je left_same_score
    inc bonus_enabled_enemy2  
left_same_score:
    mov es:[di], empty ; PACMAN went away
    mov es:[di-2], 0E40h ; PACMAN
    sub di, 2 
    mov position, di
    ;jmp move_left
    jmp end_move_proc
from_left_to_right:
    mov es:[di], empty ; PACMAN went away
    mov es:[di+158], 0E40h ; PACMAN  
    add di, 158 
    mov position, di
    jmp end_move_proc
pacman_move_right:
    cmp pacman_right_flag, 0
    jne continue_move_right
    mov di, position; can remove
    cmp es:[di+2], border
    je check_pacman_direction_flags
continue_move_right:
    mov al, 1
    mov pacman_right_flag, al
    dec al
    mov pacman_left_flag, al
    mov pacman_up_flag, al
    mov pacman_down_flag, al  
    mov di, position 
    cmp di, 81Eh
    je from_right_to_left   
    cmp es:[di+2], border
    je end_move_proc 
    cmp es:[di+2], 0EFAh ; if next - food
    jne check_bonus_right
    inc score 
check_bonus_right:
    cmp es:[di+2], bonus
    jne right_same_score
    push di
    mov di, enemyPosition1
    mov es:[di], scared_enemy1
    mov di, enemyPosition2
    mov es:[di], scared_enemy2
    pop di
    mov ax, 0A0h
    mov bonus_counter, ax
    cmp bonus_enabled_enemy1, 1
    je continue_check_bonus_right
    inc bonus_enabled_enemy1    
continue_check_bonus_right:    
    cmp bonus_enabled_enemy2, 1
    je right_same_score
    inc bonus_enabled_enemy2   
right_same_score:    
    mov es:[di], empty ; PACMAN went away
    mov es:[di+2], 0E40h ; PACMAN
    add di, 2 
    mov position, di
    ;jmp move_right
    jmp end_move_proc
from_right_to_left:
    mov es:[di], empty ; PACMAN went away
    mov es:[di-158], 0E40h ; PACMAN  
    sub di, 158 
    mov position, di
    jmp end_move_proc
pacman_move_up:
    cmp pacman_up_flag, 0
    jne continue_move_up
    mov di, position; can remove
    cmp es:[di-160], border
    je check_pacman_direction_flags 
continue_move_up:    
    mov al, 1
    mov pacman_up_flag, al
    dec al
    mov pacman_right_flag, al
    mov pacman_left_flag, al
    mov pacman_down_flag, al 
    mov di, position  
    cmp es:[di-160], border
    je end_move_proc
    cmp es:[di-160], 0EFAh ; if next - food
    jne check_bonus_up
    inc score
check_bonus_up:    
    cmp es:[di-160], bonus
    jne up_same_score
    push di
    mov di, enemyPosition1
    mov es:[di], scared_enemy1
    mov di, enemyPosition2
    mov es:[di], scared_enemy2
    pop di
    mov ax, 0A0h
    mov bonus_counter, ax
    cmp bonus_enabled_enemy1, 1
    je continue_check_bonus_up
    inc bonus_enabled_enemy1    
continue_check_bonus_up:    
    cmp bonus_enabled_enemy2, 1
    je up_same_score
    inc bonus_enabled_enemy2 
up_same_score:
    mov es:[di], empty ; PACMAN went away
    mov es:[di-160], 0E40h ; PACMAN
    sub di, 160 
    mov position, di
    ;jmp move_up
    jmp end_move_proc
pacman_move_down:
    cmp pacman_down_flag, 0
    jne continue_move_down 
    mov di, position; can remove
    cmp es:[di+160], border
    
    je check_pacman_direction_flags
    
    cmp di, 68Eh
    je check_pacman_direction_flags
    cmp di, 690h
    je check_pacman_direction_flags 
continue_move_down:
    mov al, 1
    mov pacman_down_flag, al
    dec al
    mov pacman_right_flag, al
    mov pacman_up_flag, al
    mov pacman_left_flag, al 
    mov di, position  
    cmp es:[di+160], border
    je end_move_proc 
    cmp es:[di+160], 0EFAh ; if next - food
    jne check_bonus_down
    inc score 
check_bonus_down:    
    cmp es:[di+160], bonus
    jne down_same_score
    push di
    mov di, enemyPosition1
    mov es:[di], scared_enemy1
    mov di, enemyPosition2
    mov es:[di], scared_enemy2
    pop di
    mov ax, 0A0h
    mov bonus_counter, ax
    cmp bonus_enabled_enemy1, 1
    je continue_check_bonus_down
    inc bonus_enabled_enemy1    
continue_check_bonus_down:    
    cmp bonus_enabled_enemy2, 1
    je down_same_score
    inc bonus_enabled_enemy2   
down_same_score:
    mov es:[di], empty ; PACMAN went away
    mov es:[di+160], 0E40h ; PACMAN
    add di, 160 
    mov position, di
    ;jmp move_down
end_move_proc: 
    mov ax, position
    cmp ax, enemyPosition1
    je check_bonus1
    cmp ax, enemyPosition2
    je check_bonus2   
    ret
check_bonus1:
    cmp bonus_enabled_enemy1, 0
    je check_attemts
    mov di, position
    mov es:[di], pacman
    mov di, enemyPosition1
    mov ax, enemy_1_next_place
    mov es:[di], ax
    mov di, enemy_start_position1
    mov enemyPosition1, di
    mov es:[di], enemy1
    mov ax, empty
    mov enemy_1_next_place, ax
    mov ax, 3
    mov enemy_1_get_out_counter, al
    dec bonus_enabled_enemy1
    mov al, 0
    cmp bonus_enabled_enemy2, al
    jne end_check_bonus
    mov ax, 0
    mov bonus_counter, ax
    jmp end_check_bonus
check_bonus2:
    cmp bonus_enabled_enemy2, 0
    je check_attemts
    mov di, position
    mov es:[di], pacman
    mov di, enemyPosition2 
    mov ax, enemy_2_next_place
    mov es:[di], ax
    mov di, enemy_start_position2 
    mov enemyPosition2, di
    mov es:[di], enemy2 
    mov ax, empty
    mov enemy_2_next_place, ax
    mov ax, 3
    mov enemy_2_get_out_counter, al
    dec bonus_enabled_enemy2
    mov al, 0
    cmp bonus_enabled_enemy1, al
    jne end_check_bonus 
    mov ax, 0
    mov bonus_counter, ax
    jmp end_check_bonus
check_attemts:    
    ;cmp amount_of_attempts, 0
    ;je lose
    
    
    mov di, 0B90h ; PACMAN start position
    mov position, di
    mov es:[di], pacman
    
    mov di, enemyPosition1
    mov ax, enemy_1_next_place
    mov es:[di], ax
    mov di, enemy_start_position1
    mov enemyPosition1, di
    mov es:[di], enemy1
    mov ax, empty
    mov enemy_1_next_place, ax
    mov ax, 3
    mov enemy_1_get_out_counter, al 
    
    mov di, enemyPosition2 
    mov ax, enemy_2_next_place
    mov es:[di], ax
    mov di, enemy_start_position2
    mov enemyPosition2, di
    mov es:[di], enemy2
    mov ax, empty
    mov enemy_2_next_place, ax
    mov ax, 3
    mov enemy_2_get_out_counter, al
    
    dec amount_of_attempts 
    mov di, 0CF0h
    cmp amount_of_attempts, 2
    jne check_attemts_1
    mov es:[di], 0F32h
    jmp end_check_bonus 
check_attemts_1:
    cmp amount_of_attempts, 1
    jne check_attemts_0
    mov es:[di], 0F31h
    jmp end_check_bonus
check_attemts_0:
    mov es:[di], 0F30h
    jmp lose   
end_check_bonus:             
move endp
    
  
 
enemy_1 proc near    
    cmp bonus_enabled_enemy1, 0
    jne make_scared_enemy1_proc1
    mov ax, enemy1
    mov local_enemy1, ax
    jmp not_scared_enemy1_proc1
    make_scared_enemy1_proc1:
    mov ax, scared_enemy1
    mov local_enemy1, ax
not_scared_enemy1_proc1:

    cmp bonus_enabled_enemy2, 0
    jne make_scared_enemy2_proc1
    mov ax, enemy2
    mov local_enemy2, ax
    jmp not_scared_enemy2_proc1
make_scared_enemy2_proc1:
    mov ax, scared_enemy2
    mov local_enemy2, ax
not_scared_enemy2_proc1:
        
    mov di, enemyPosition1 
    cmp enemy_1_get_out_counter, 0
    ja enemy_1_get_out             
check_enemy_1_direction_flags:
    cmp enemy_1_direction_flag, 1
    je enemy_1_move_left   
    cmp enemy_1_direction_flag, 2 
    je enemy_1_move_right
    cmp enemy_1_direction_flag, 3
    je enemy_1_move_up
    cmp enemy_1_direction_flag, 4
    je enemy_1_move_down
enemy_1_move_left:
    cmp di, 780h
    je enemy_1_from_left_to_right
     
    cmp es:[di-2], border
    jne not_change_enemy1_direction_flag_left
    mov al, 4
    mov enemy_1_direction_flag, al
    cmp es:[di-160], border 
    je end_enemy_proc
    mov al, 3
    mov enemy_1_direction_flag, al
    cmp es:[di+160], border
    je end_enemy_proc
     
    jmp change_enemy1_direction_flag_left
not_change_enemy1_direction_flag_left:
         
    mov ax, enemy_1_next_place 
    mov es:[di], ax ; enemy1 went away
    mov ax, es:[di-2]
    cmp ax, local_enemy2
    jne enemy2_not_near_left
    mov ax, enemy_2_next_place 
enemy2_not_near_left:          
    cmp ax, pacman
    jne enemy1_not_near_pacman_left
    mov ax, empty
enemy1_not_near_pacman_left:
    mov enemy_1_next_place, ax
    mov ax, local_enemy1          
    mov es:[di-2], ax ; enemy1     
    sub di, 2 
    mov enemyPosition1, di 
    
    cmp enemy_1_get_out_counter, 0
    jne not_crossroads_left1
    cmp di, 68Eh
    je not_crossroads_left1
    cmp di, 690h
    je not_crossroads_left1 
     
    cmp es:[di-160], empty
    je check_change_enemy1_direction_flag_left
    cmp es:[di+160], empty
    je check_change_enemy1_direction_flag_left 


    jmp not_crossroads_left1:
check_change_enemy1_direction_flag_left:
    call random
    cmp al, 1
    je change_enemy1_direction_flag_left

    
not_crossroads_left1:     
    
    
    jmp end_enemy_proc
enemy_1_from_left_to_right:
    
    mov ax, enemy_1_next_place
    mov ax, es:[di+158]
    cmp ax, local_enemy2
    jne enemy2_not_near_left_to_right
    mov ax, enemy_2_next_place 
enemy2_not_near_left_to_right:
    cmp ax, pacman
    jne enemy1_not_near_pacman_left_to_right
    mov ax, empty
enemy1_not_near_pacman_left_to_right:
    mov enemy_1_next_place, ax 
    mov es:[di], ax ; enemy1 went away 
    mov ax, local_enemy1
    mov es:[di+158], ax ; enemy1  
    add di, 158 
    mov enemyPosition1, di
    jmp end_enemy_proc


change_enemy1_direction_flag_left:    
    call random
    cmp al, 1
    jne assign_4_left1 
    


    
    mov bx, border
    cmp es:[di-160], bx
    je assign_4_left1
    
assign_3_left1:     
    
    mov al, 3 
    mov enemy_1_direction_flag, al
    jmp end_enemy_proc
assign_4_left1:    
    
    
    mov bx, border
    cmp es:[di-160], bx
    je assign_3_left1
    mov al, 4
    mov enemy_1_direction_flag, al     
    jmp end_enemy_proc
 
 
 
   
enemy_1_move_right: 
    cmp di, 81Eh
    je enemy_1_from_right_to_left
    cmp es:[di+2], border
    jne not_change_enemy1_direction_flag_right
    mov al, 4
    mov enemy_1_direction_flag, al
    cmp es:[di-160], border 
    je end_enemy_proc
    mov al, 3
    mov enemy_1_direction_flag, al
    cmp es:[di+160], border
    je end_enemy_proc
     
    jmp change_enemy1_direction_flag_right
not_change_enemy1_direction_flag_right:
    
    
    
    
    mov ax, enemy_1_next_place 
    mov es:[di], ax ; enemy1 went away
    mov ax, es:[di+2]
    cmp ax, local_enemy2
    jne enemy2_not_near_right
    mov ax, enemy_2_next_place 
enemy2_not_near_right:
    cmp ax, pacman
    jne enemy1_not_near_pacman_right
    mov ax, empty
enemy1_not_near_pacman_right:  
    mov enemy_1_next_place, ax
    mov ax, local_enemy1
    mov es:[di+2], ax ; enemy1
    add di, 2 
    mov enemyPosition1, di
    
    
    cmp enemy_1_get_out_counter, 0
    jne not_crossroads_right1
    cmp di, 68Eh
    je not_crossroads_right1 
    cmp di, 690h
    je not_crossroads_right1
    
    cmp es:[di-160], empty
    je change_enemy1_direction_flag_right
    cmp es:[di+160], empty
    je change_enemy1_direction_flag_right
    
    
    jmp not_crossroads_right1:
check_change_enemy1_direction_flag_right:
    call random
    cmp al, 1
    je change_enemy1_direction_flag_right
     
    
not_crossroads_right1:
    
    
    
    jmp end_enemy_proc 
enemy_1_from_right_to_left: 
    mov ax, enemy_1_next_place 
    mov es:[di], ax ; enemy1 went away
    mov ax, es:[di-158]
    cmp ax, local_enemy2
    jne enemy2_not_near_right_to_left
    mov ax, enemy_2_next_place 
enemy2_not_near_right_to_left:
    cmp ax, pacman
    jne enemy1_not_near_pacman_right_to_left
    mov ax, empty
enemy1_not_near_pacman_right_to_left:
    mov enemy_1_next_place, ax
    mov ax, local_enemy1 
    mov es:[di-158], ax ; enemy1  
    sub di, 158 
    mov enemyPosition1, di
    jmp end_enemy_proc
    
    
    
    change_enemy1_direction_flag_right:    
    call random
    cmp al, 1
    jne assign_4_right1 
    
    
    mov bx, border
    cmp es:[di-160], bx
    je assign_4_right1
    
assign_3_right1:
    mov al, 3
    mov enemy_1_direction_flag, al
    jmp end_enemy_proc
assign_4_right1:    
      
    
    mov bx, border
    cmp es:[di+160], bx
    je assign_3_right1
    
    mov al, 4 
    mov enemy_1_direction_flag, al     
    jmp end_enemy_proc
    
 
        
enemy_1_move_up: 
    cmp es:[di-160], border
    jne not_change_enemy1_direction_flag_up
    mov al, 2
    mov enemy_1_direction_flag, al
    cmp es:[di-2], border 
    je end_enemy_proc
    mov al, 1
    mov enemy_1_direction_flag, al
    cmp es:[di+2], border
    je end_enemy_proc
     
    jmp change_enemy1_direction_flag_up
not_change_enemy1_direction_flag_up:
    
      
    
    mov ax, enemy_1_next_place
    mov es:[di], ax ; enemy1 went away 
    mov ax, es:[di-160]
    cmp ax, local_enemy2
    jne enemy2_not_near_up
    mov ax, enemy_2_next_place 
enemy2_not_near_up:
    cmp ax, pacman
    jne enemy1_not_near_pacman_up
    mov ax, empty
enemy1_not_near_pacman_up:  
    mov enemy_1_next_place, ax
    mov ax, local_enemy1
    mov es:[di-160], ax ; enemy1
    sub di, 160 
    mov enemyPosition1, di 
    
    cmp enemy_1_get_out_counter, 0
    jne not_crossroads_up1
    cmp di, 68Eh
    je not_crossroads_up1
    cmp di, 690h
    je not_crossroads_up1
    
    cmp es:[di-2], empty
    je check_change_enemy1_direction_flag_up
    cmp es:[di+2], empty
    je check_change_enemy1_direction_flag_up 
      
      
    jmp not_crossroads_up1:
check_change_enemy1_direction_flag_up:
    call random
    cmp al, 1
    je change_enemy1_direction_flag_up  
      
      
      
not_crossroads_up1:  
    
    
    jmp end_enemy_proc
    
    
    
    change_enemy1_direction_flag_up:    
    call random
    cmp al, 1
    jne assign_2_up1 
    
    
    mov bx, border
    cmp es:[di-2], bx
    je assign_2_up1
    
assign_1_up1:
    
    
    mov al, 1 
    mov enemy_1_direction_flag, al
    jmp end_enemy_proc
assign_2_up1:    
      
    
    mov bx, border
    cmp es:[di+2], bx
    je assign_1_up1
    mov al, 2
    mov enemy_1_direction_flag, al     
    jmp end_enemy_proc
  
    
    
enemy_1_move_down: 
    cmp es:[di+160], border
    jne not_change_enemy1_direction_flag_down
    mov al, 2
    mov enemy_1_direction_flag, al
    cmp es:[di-2], border 
    je end_enemy_proc
    mov al, 1
    mov enemy_1_direction_flag, al
    cmp es:[di+2], border
    je end_enemy_proc
     
    jmp change_enemy1_direction_flag_down
not_change_enemy1_direction_flag_down:  
    cmp di, 68Eh
    je change_enemy1_direction_flag_down 
    cmp di, 690h
    je change_enemy1_direction_flag_down 
    mov ax, enemy_1_next_place 
    mov es:[di], ax ; enemy1 went away
    mov ax, es:[di+160]
    cmp ax, local_enemy2
    jne enemy2_not_near_down
    mov ax, enemy_2_next_place 
enemy2_not_near_down:
    cmp ax, pacman
    jne enemy1_not_near_pacman_down
    mov ax, empty
enemy1_not_near_pacman_down:  
    mov enemy_1_next_place, ax
    mov ax, local_enemy1
    mov es:[di+160], ax ; enemy1
    add di, 160 
    mov enemyPosition1, di 
    
    cmp enemy_1_get_out_counter, 0
    jne not_crossroads_down1
    cmp di, 68Eh
    je not_crossroads_down1
    cmp di, 690h
    je not_crossroads_down1
    
    cmp es:[di-2], empty
    je check_change_enemy1_direction_flag_down
    cmp es:[di+2], empty
    je check_change_enemy1_direction_flag_down 
            
            
    jmp not_crossroads_down1:
check_change_enemy1_direction_flag_down:
    call random
    cmp al, 1
    je change_enemy1_direction_flag_down         
            
            
            
            
not_crossroads_down1:  
    
    
    jmp end_enemy_proc
    
    change_enemy1_direction_flag_down:    
    call random
    cmp al, 1
    jne assign_2_down1 
     
    
    mov bx, border
    cmp es:[di-2], bx
    je assign_2_down1
    
assign_1_down1:
    
    mov al, 1
    mov enemy_1_direction_flag, al
    jmp end_enemy_proc
assign_2_down1:    
    
    
    mov bx, border
    cmp es:[di+2], bx
    je assign_1_down1
    
    mov al, 2 
    mov enemy_1_direction_flag, al     
    jmp end_enemy_proc
       
    
change_enemy1_direction_flag: 
;LOGIC with flags
    call random   
jmp end_enemy_proc           
enemy_1_get_out:
    cmp enemy_1_get_out_counter, 3
    je enemy_1_get_out1  
    cmp enemy_1_get_out_counter, 2 
    je enemy_1_get_out2
    cmp enemy_1_get_out_counter, 1
    je enemy_1_get_out3
enemy_1_get_out1:
    dec enemy_1_get_out_counter
    jmp enemy_1_move_right
enemy_1_get_out2: 
    dec enemy_1_get_out_counter
    jmp enemy_1_move_up
enemy_1_get_out3:
    dec enemy_1_get_out_counter  
    jmp enemy_1_move_up
end_enemy_proc:  
    ret
enemy_1 endp    
 




enemy_2 proc near
    cmp bonus_enabled_enemy1, 0
    jne make_scared_enemy1_proc2
    mov ax, enemy1
    mov local_enemy1, ax
    jmp not_scared_enemy1_proc2
make_scared_enemy1_proc2:
    mov ax, scared_enemy1
    mov local_enemy1, ax
not_scared_enemy1_proc2:  
    cmp bonus_enabled_enemy2, 0
    jne make_scared_enemy2_proc2
    mov ax, enemy2
    mov local_enemy2, ax
    jmp not_scared_enemy2_proc2
make_scared_enemy2_proc2:
    mov ax, scared_enemy2
    mov local_enemy2, ax
not_scared_enemy2_proc2:
 
    mov di, enemyPosition2 
    cmp enemy_2_get_out_counter, 0
    ja enemy_2_get_out      
check_enemy_2_direction_flags:
    cmp enemy_2_direction_flag, 1
    je enemy_2_move_left   
    cmp enemy_2_direction_flag, 2 
    je enemy_2_move_right
    cmp enemy_2_direction_flag, 3
    je enemy_2_move_up
    cmp enemy_2_direction_flag, 4
    je enemy_2_move_down
enemy_2_move_left:
    cmp di, 780h
    je enemy_2_from_left_to_right 
    cmp es:[di-2], border
    jne not_change_enemy2_direction_flag_left
    mov al, 4
    mov enemy_2_direction_flag, al
    cmp es:[di-160], border 
    je end_enemy2_proc
    mov al, 3
    mov enemy_2_direction_flag, al
    cmp es:[di+160], border
    je end_enemy2_proc
     
    jmp change_enemy2_direction_flag_left
not_change_enemy2_direction_flag_left:
    
    mov ax, enemy_2_next_place 
    mov es:[di], ax ; enemy2 went away
    mov ax, es:[di-2]
    cmp ax, local_enemy1
    jne enemy1_not_near_left
    mov ax, enemy_1_next_place 
enemy1_not_near_left:
    cmp ax, pacman
    jne enemy2_not_near_pacman_left
    mov ax, empty
enemy2_not_near_pacman_left:
    mov enemy_2_next_place, ax
    mov ax, local_enemy2     
    mov es:[di-2], ax  
    
    sub di, 2 
    mov enemyPosition2, di
    
    
    cmp enemy_2_get_out_counter, 0
    jne not_crossroads_left2
    cmp di, 68Eh
    je not_crossroads_left2
    cmp di, 690h
    je not_crossroads_left2 
     
    cmp es:[di-160], empty
    je check_change_enemy2_direction_flag_left
    cmp es:[di+160], empty
    je check_change_enemy2_direction_flag_left
    
     
    jmp not_crossroads_left2:
check_change_enemy2_direction_flag_left:
    call random
    cmp al, 1
    je change_enemy2_direction_flag_left 
    

    
not_crossroads_left2: 
    
    
    jmp end_enemy2_proc 
    
    
    change_enemy2_direction_flag_left:    
    call random
    cmp al, 1
    jne assign_4_left2 
    
    
    mov bx, border
    cmp es:[di-160], bx
    je assign_4_left2
    
assign_3_left2:
    
    mov al, 3 
    mov enemy_2_direction_flag, al
    jmp end_enemy2_proc
assign_4_left2:    
    
    
    mov bx, border
    cmp es:[di+160], bx
    je assign_3_left2
    
    mov al, 4
    mov enemy_2_direction_flag, al     
    jmp end_enemy2_proc
    
    
    
enemy_2_from_left_to_right: 
    mov ax, enemy_2_next_place 
    mov es:[di], ax ; enemy2 went away  
    
    mov ax, es:[di+158]
    cmp ax, local_enemy1
    jne enemy1_not_near_left_to_right
    mov ax, enemy_1_next_place 
enemy1_not_near_left_to_right:
    cmp ax, pacman
    jne enemy2_not_near_pacman_left_to_right
    mov ax, empty
enemy2_not_near_pacman_left_to_right:
    mov enemy_2_next_place, ax
    mov ax, local_enemy2
    mov es:[di+158], ax  
    add di, 158 
    mov enemyPosition2, di
    jmp end_enemy2_proc    
enemy_2_move_right: 
    cmp di, 81Eh
    je enemy_2_from_right_to_left  
    
    cmp es:[di+2], border
    jne not_change_enemy2_direction_flag_right
    mov al, 4
    mov enemy_2_direction_flag, al
    cmp es:[di-160], border 
    je end_enemy2_proc
    mov al, 3
    mov enemy_2_direction_flag, al
    cmp es:[di+160], border
    je end_enemy2_proc
     
    jmp change_enemy2_direction_flag_right
not_change_enemy2_direction_flag_right:  

    mov ax, enemy_2_next_place 
    mov es:[di], ax ; enemy2 went away
    mov ax, es:[di+2]
    cmp ax, local_enemy1
    jne enemy1_not_near_right
    mov ax, enemy_1_next_place 
enemy1_not_near_right:
    cmp ax, pacman
    jne enemy2_not_near_pacman_right
    mov ax, empty
enemy2_not_near_pacman_right:
    mov enemy_2_next_place, ax
    mov ax, local_enemy2
    mov es:[di+2], ax
    add di, 2 
    mov enemyPosition2, di   
    
    cmp enemy_2_get_out_counter, 0
    jne not_crossroads_right2
    cmp di, 68Eh
    je not_crossroads_right2
    cmp di, 690h
    je not_crossroads_right2 
     
    cmp es:[di-160], empty
    je check_change_enemy2_direction_flag_right
    cmp es:[di+160], empty
    je check_change_enemy2_direction_flag_right 
     
     
    jmp not_crossroads_right2:
check_change_enemy2_direction_flag_right:
    call random
    cmp al, 1
    je change_enemy2_direction_flag_right 
   
not_crossroads_right2: 
   
    jmp end_enemy2_proc 
    
    
    change_enemy2_direction_flag_right:    
    call random
    cmp al, 1
    jne assign_4_right2 
    
    
    mov bx, border
    cmp es:[di-160], bx
    je assign_4_right2
    
assign_3_right2:
    
    
    mov al, 3 
    mov enemy_2_direction_flag, al
    jmp end_enemy2_proc
assign_4_right2:    
     
    
    mov bx, border
    cmp es:[di+160], bx
    je assign_3_right2
    
    mov al, 4 
    mov enemy_2_direction_flag, al     
    jmp end_enemy2_proc
        
enemy_2_from_right_to_left: 
    mov ax, enemy_2_next_place 
    mov es:[di], ax
    
    mov ax, es:[di-158]
    cmp ax, local_enemy1
    jne enemy1_not_near_right_to_left
    mov ax, enemy_1_next_place 
enemy1_not_near_right_to_left:
    cmp ax, pacman
    jne enemy2_not_near_pacman_right_to_left
    mov ax, empty
enemy2_not_near_pacman_right_to_left:
    mov enemy_2_next_place, ax
    mov ax, local_enemy2
    mov es:[di-158], ax  
    sub di, 158 
    mov enemyPosition2, di
    jmp end_enemy2_proc    
enemy_2_move_up: 
    cmp es:[di-160], border
    jne not_change_enemy2_direction_flag_up
    mov al, 2
    mov enemy_2_direction_flag, al
    cmp es:[di-2], border 
    je end_enemy2_proc
    mov al, 1
    mov enemy_2_direction_flag, al
    cmp es:[di+2], border
    je end_enemy2_proc
     
    jmp change_enemy2_direction_flag_up
not_change_enemy2_direction_flag_up: 
    mov ax, enemy_2_next_place
    mov es:[di], ax ; enemy2 went away 
    mov ax, es:[di-160]
    cmp ax, local_enemy1
    jne enemy1_not_near_up
    mov ax, enemy_1_next_place 
enemy1_not_near_up:
    cmp ax, pacman
    jne enemy2_not_near_pacman_up
    mov ax, empty
enemy2_not_near_pacman_up:
    mov enemy_2_next_place, ax
    mov ax, local_enemy2
    mov es:[di-160], ax
    sub di, 160 
    mov enemyPosition2, di  
    
    cmp enemy_2_get_out_counter, 0
    jne not_crossroads_up2
    cmp di, 68Eh
    je not_crossroads_up2
    cmp di, 690h
    je not_crossroads_up2 
     
    cmp es:[di-2], empty
    je check_change_enemy2_direction_flag_up
    cmp es:[di+2], empty
    je check_change_enemy2_direction_flag_up 
       
    
    jmp not_crossroads_up2:
check_change_enemy2_direction_flag_up:
    call random
    cmp al, 1
    je change_enemy2_direction_flag_up  
             
not_crossroads_up2: 
 
    jmp end_enemy2_proc 
        
    change_enemy2_direction_flag_up:    
    call random
    cmp al, 1
    jne assign_2_up2 
    
    
    mov bx, border
    cmp es:[di-2], bx
    je assign_2_up2
    
assign_1_up2:
    
    
    mov al, 1
    mov enemy_2_direction_flag, al
    jmp end_enemy2_proc
assign_2_up2:    
      
    
    mov bx, border
    cmp es:[di+2], bx
    je assign_1_up2
    
    
    mov al, 2
    mov enemy_2_direction_flag, al     
    jmp end_enemy2_proc   
    
    
enemy_2_move_down: 
    cmp es:[di+160], border
    jne not_change_enemy2_direction_flag_down
    mov al, 2
    mov enemy_2_direction_flag, al
    cmp es:[di-2], border 
    je end_enemy2_proc
    mov al, 1
    mov enemy_2_direction_flag, al
    cmp es:[di+2], border
    je end_enemy2_proc
     
    jmp change_enemy2_direction_flag_down
not_change_enemy2_direction_flag_down:
    cmp di, 68Eh
    je change_enemy2_direction_flag_down 
    cmp di, 690h
    je change_enemy2_direction_flag_down 
    mov ax, enemy_2_next_place 
    mov es:[di], ax ; enemy2 went away
    mov ax, es:[di+160]
    cmp ax, local_enemy1
    jne enemy1_not_near_down
    mov ax, enemy_1_next_place 
enemy1_not_near_down: 
    cmp ax, pacman
    jne enemy2_not_near_pacman_down
    mov ax, empty
enemy2_not_near_pacman_down:   
    mov enemy_2_next_place, ax
    mov ax, local_enemy2
    mov es:[di+160], ax
    add di, 160 
    mov enemyPosition2, di  
    
    cmp enemy_2_get_out_counter, 0
    jne not_crossroads_down2
    cmp di, 68Eh
    je not_crossroads_down2
    cmp di, 690h
    je not_crossroads_down2 
     
    cmp es:[di-2], empty
    je check_change_enemy2_direction_flag_down
    cmp es:[di+2], empty
    je check_change_enemy2_direction_flag_down 
 
 
 
    jmp not_crossroads_down2:
check_change_enemy2_direction_flag_down:
    call random
    cmp al, 1
    je change_enemy2_direction_flag_down 

not_crossroads_down2:
    
    jmp end_enemy2_proc 
    
    
    change_enemy2_direction_flag_down:    
    call random
    cmp al, 1
    jne assign_2_down2 
      
    
    mov bx, border
    cmp es:[di-160], bx
    je assign_2_down2
    
assign_1_down2:
    
    mov al, 1
    mov enemy_2_direction_flag, al
    jmp end_enemy2_proc
assign_2_down2:    
      
    
    mov bx, border
    cmp es:[di-160], bx
    je assign_1_down2

    mov al, 2 
    mov enemy_2_direction_flag, al     
    jmp end_enemy2_proc
    
    
change_enemy2_direction_flag: 
;LOGIC with flags

    call random   

jmp end_enemy2_proc   
        
enemy_2_get_out:
    cmp enemy_2_get_out_counter, 3
    je enemy_2_get_out1  
    cmp enemy_2_get_out_counter, 2 
    je enemy_2_get_out2
    cmp enemy_2_get_out_counter, 1
    je enemy_2_get_out3
enemy_2_get_out1:
    dec enemy_2_get_out_counter
    jmp enemy_2_move_left
enemy_2_get_out2: 
    dec enemy_2_get_out_counter
    jmp enemy_2_move_up
enemy_2_get_out3:
    dec enemy_2_get_out_counter  
    jmp enemy_2_move_up
end_enemy2_proc:  
    ret
enemy_2 endp 



print_score proc near
    push 0B800h ; check!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
    pop es
    ;================= 
    xor di, di
    add di, 0CBCh
    mov ax, score
    mov bx, score
    cmp bx, 0 
    jne not_zero
    
    mov es:[di], 0E30h 
    jmp end_print_array
not_zero:       
    mov si, 0       
    xor dx, dx 
    push bx 
    mov bx, 10
    mov cx, 5
size:
    cmp ax, 10
    jl incr
    div bx 
    xor dx, dx
    inc si
    loop size 
incr: 
    pop bx      
    inc si 
    push ax
    xor dx, dx
    mov ax, 4
    sub ax, si
    mov cx, ax
of:
    inc di
    inc di    
    loop of
    pop ax        
number:     
    mov ax, bx 
    mov cx, si 
    dec cx 
    push bx
    mov bx, 10
division:
     cmp cx, 0
     je end_division
     div bx
     xor dx, dx 
     loop division 
end_division:     
     push ax
    
     mov dl, al  
     add dl, 30h  
      
     mov es:[di], dl
     inc di
     inc di   
     pop ax  
     mov cx, si  
     dec cx
multi:
    cmp cx, 0
    je end_multi
    mul bx
    loop multi  
end_multi:
   pop bx
   sub bx, ax 
   dec si
   cmp si, 0
   jne number    
end_print_array:
    ret    
print_score endp    




start:
    mov ax, @data
    mov ds, ax 
    ;call random
   ; call draw_greeting  
    ;call print_score ;-> ERROR!!!
    call draw_scene
    ;call print_score 
    call setup
playing:    
    ;call random ; check!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    call move
    cmp bonus_counter, 0
    jne dec_bonus_counter
    

enemy_procedures:    
    call enemy_1
    
    call print_score   ; check!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    call enemy_2 
    cmp score, 301 ; 302!!!!
    je win
    jmp playing 
dec_bonus_counter:    
    dec bonus_counter
    cmp bonus_counter, 0
    je bonus_disable         
    jmp enemy_procedures  
bonus_disable:
    mov al, 0
    mov bonus_enabled_enemy1, al
    mov bonus_enabled_enemy2, al
    jmp enemy_procedures     
    
    
    

win:
    mov cx, 3
    mov di, 532h 
print_win:
    push cx    
    mov si, offset victory_string
    mov cx, 7h                    
    rep movsw
    add di, 20h 
    mov si, offset victory_string
    mov cx, 7h                    
    rep movsw 
    add di, 64h
    pop cx  
    loop print_win   
    jmp endgame 
lose:
    mov cx, 3
    mov di, 532h 
print_game:
    push cx    
    mov si, offset game_string
    mov cx, 4h                    
    rep movsw 
    add di, 152
    pop cx  
    loop print_game  
    
    
    mov cx, 3
    mov di, 566h
print_over:
    push cx
    mov si, offset over_string
    mov cx, 4h                    
    rep movsw
    add di, 152
    pop cx  
    loop print_over         
endgame:

    ;Play again? (Y/N)
    ;je jmp start 
    
    
after_game_input:
    mov ah, 8
    int 21h    
    cmp al, 1Bh ; ESC
    je end_program
    cmp al, 0Dh ; Enter
    je start
    jmp after_game_input
         
end_program:    
    mov ax, 03 ; clear console
    int 10h
    mov ax, 4c00h
    int 21h
    ;mov ax, 0f01h
    ;stosw

end start