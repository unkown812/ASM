.MODEL SMALL
.STACK 100H

.DATA
X DW ?
Y DW ?
DX1 DW ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, 0013H
    INT 10H

    MOV Y, 50

L1:
    MOV AX, Y
    SUB AX, 50
    SHR AX, 1
    ADD AX, 50
    MOV X, AX

    MOV AH, 0CH
    MOV AL, 0FH
    MOV BH, 0
    MOV CX, X
    MOV DX, Y
    INT 10H

    MOV AX, Y
    SUB AX, 50
    SHR AX, 1
    MOV DX1, AX
    MOV AX, 150
    SUB AX, DX1
    MOV X, AX

    MOV AH, 0CH
    MOV AL, 0FH
    MOV BH, 0
    MOV CX, X
    MOV DX, Y
    INT 10H

    INC Y
    CMP Y, 151
    JNE L1

    MOV X, 50

L2:
    MOV AH, 0CH
    MOV AL, 0FH
    MOV BH, 0
    MOV CX, X
    MOV DX, 150
    INT 10H

    INC X
    CMP X, 151
    JNE L2

    MOV AH, 00H
    INT 16H

    MOV AX, 0003H
    INT 10H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN