;Rossetti Jacopo
;3INA
;16/02/2021

TITLE ciclo while do 
.MODEL SMALL    
    
.DATA 
    LETTERE DB 'ZYXWVUTSRQPONMLKJIHGFEDCBA$'

.CODE                                                                                                

.STARTUP
    LEA SI,LETTERE
    MOV CX,0
INIZIO:    
    MOV BX,[SI]
    CMP BX,24h 
    JE STAMPA
    PUSH BX
    INC SI 
    INC CX
    JMP INIZIO
STAMPA:
    POP BX
    MOV AH,02h
    MOV DX,BX
    INT 21h
    INC SI
    LOOP STAMPA
           
FINE:
; exit to operating system. 
    mov AH, 4ch     ; numero del servizio  
    INT 21h         ; interruzione SW di MSDOS
END

