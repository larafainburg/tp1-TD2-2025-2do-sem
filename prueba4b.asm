main:
    SET R0, 0x01   
    NEGHIGHNIBBLE R0, R0 ;--> pone en R0 el registro oxF1

    SET R1, 0x3A   
    NEGHIGHNIBBLE R1, R1 ;--> pone en R1 el registro 0xCA

    SET R2, 0x7F   
    NEGHIGHNIBBLE R2, R2 ;--> Pone en R2 el registro 0x8F

    
halt:
    JMP halt
