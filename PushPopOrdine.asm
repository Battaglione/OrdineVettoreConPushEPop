;Rossetti Jacopo
;3INA
;16/02/2021

TITLE ciclo while do 
.MODEL SMALL    
    
.DATA 
    LETTERE DW 'ZYXWVUTSRQPONMLKJIHGFEDCBA$'
    CONT    DW 0

.CODE                                                                                                

.STARTUP
    LEA SI,LETTERE
INIZIO:    
    MOV BX,[SI]
    CMP BX,'$' 
    JE RESET
    PUSH BX
    INC SI 
    INC CONT 
    JMP INIZIO
RESET:
    MOV CX,CONT
    JMP STAMPA
STAMPA:
    POP BX
    MOV DX,BX
    MOV AH,02h
    INT 21h
    INC SI
    LOOP STAMPA
    JMP FINE
           
FINE:
; exit to operating system. 
    mov AH, 4ch     ; numero del servizio  
    INT 21h         ; interruzione SW di MSDOS
END

