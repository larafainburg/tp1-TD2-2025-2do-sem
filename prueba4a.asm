start: 
    SET R0, 0x02
    SET R1, 0x08

main: 
    PUSH |R7|, R1
    PUSH |R7|, R0
    ; sin modificar el common
    DB 0x77
    DB 0x50

    ;modificando el common
    ;STRPOP |R7|, 0x50

halt: 
    JMP halt