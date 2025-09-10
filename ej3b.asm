main:
    SET R7, 0xFF      ; stack pointer
    SET R0, p         ; puntero al array
    SET R1, 0x10      ; tamaño = 16 elementos
    CALL |R7|, modArray

halt:
    JMP halt       

modArray:
    SET R2, 0         ; i = 0
    SET R3, 0x03      ; creamos una constante para usar de mascara (3)
    SET R5, 0x01      ; constante 1

loop:
    CMP R2, R1
    JZ fin             ; si i == tamaño salta a fin 

    ; calculalamos la direccion de memoria donde poner el valor 
    MOV R6, R0
    ADD R6, R2

    ; cargamos el valor en la direc de memoria 
    LOAD R4, [R6]

    ; chequueamos si es múltiplo de 4 fijandonos en los dos ultimos bits menos significativos 
    MOV R6, R4
    AND R6, R3 ;usamos la constante que creamos antes para ver los ultimos dos bits menos significativo  
    JZ esMultiplo  

    ; si no saltó es porque el numero no es multiplo de 4
    MOV R6, R4
    SHL R4, 2 ; multiplicamos por 5
    ADD R4, R6
    SUB R4, R5 ;restamos uno 

    ; guardamos en la direccion de memoria
    MOV R6, R0
    ADD R6, R2
    STR [R6], R4

    ADD R2, R5
    JMP loop

esMultiplo:
    SHR R4, 2
    SUB R4, R5

    ; guardamos en la direccion de memoria
    MOV R6, R0
    ADD R6, R2
    STR [R6], R4

    ADD R2, R5
    JMP loop

fin:
    RET |R7|          

p:
DB 0x01
DB 0x02
DB 0x04
DB 0x08
DB 0x03
DB 0x03
DB 0xA1
DB 0xC0
DB 0xFF
DB 0x40
DB 0x55
DB 0xCC
DB 0xBD
DB 0x45
DB 0x9A
DB 0xEE
