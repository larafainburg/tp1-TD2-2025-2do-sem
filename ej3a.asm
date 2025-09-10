
main:
	SET R7, 0xFF	;stack
	SET R0, p	;p (puntero)
	SET R1, 0x10	;size
	SET R4, 0x00	;count
	CALL |R7|, cantPares

halt:
	JMP halt

cantPares:
;Escribir la funcion cantPares que toma un array de enteros positivos en memoria y cuenta
;cuantos elementos pares tiene.
	; R0 = p (puntero al array)
	; R1 = size
	; R4 = count (arranca en 0)
	PUSH [R7], R0
	PUSH [R7], R2
	PUSH [R7], R3
	PUSH [R7], R5
	PUSH [R7], R6

	SET R2, 0        ; i = 0
	SET R6, 1
loop:
	CMP R2, R1          ; ¿i == size?
	JZ fin           ; si ya recorrimos todo --> salta a fin

	MOV R3, R0          
	ADD R3, R2          ; R3 = p + i (dirección del elemento)
	LOAD R5, [R3]      	; R5 = p[i]

	AND R5, R6 ; me quedo con el bit menos significativo (que me dice si es par o impar)
	JZ par        ; si es 1 → impar
	; si no saltó, quiere decir que es impar
	ADD R2, R6       ;i++
	JMP loop
par:
	ADD R4, R6 ;sumamos uno a R4 porque el elemento es par
	ADD R2, R6 ;i++
	JMP loop

fin:
	POP [R7], R6
	POP [R7], R5
	POP [R7], R3
	POP [R7], R2
	POP [R7], R0
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
