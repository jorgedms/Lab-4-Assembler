
@ Apagado de pines 7, 8, 9, 10, 11 y 14
.globl Apagado
Apagado:
	push{lr}
	mov r0,#7
	mov r1,#0
	bl SetGpio
	
	mov r0,#8
	mov r1,#0
	bl SetGpio
	
	mov r0,#9
	mov r1,#0
	bl SetGpio
	
	mov r0,#10
	mov r1,#0
	bl SetGpio
	
	mov r0,#11
	mov r1,#0
	bl SetGpio
	
	mov r0,#14
	mov r1,#0
	bl SetGpio
	
	/* Delay de 0.5s */
	ldr r0,=500000
	bl Wait
	pop{pc}
	

.globl Asignacion
Asignacion:

	push{lr}
	@@ colocar los puertos del 7 al 11 y 14 como salidas

	@ puerto 7 como salida
	mov r0,#7
	mov r1,#1
	bl SetGpioFunction

	@ puerto 8 como salida
	mov r0,#8
	mov r1,#1
	bl SetGpioFunction

	@ puerto 9 como salida
	mov r0,#9
	mov r1,#1
	bl SetGpioFunction
		
	@ puerto 10 como salida
	mov r0,#10
	mov r1,#1
	bl SetGpioFunction

	@ puerto 11 como salida
	mov r0,#11
	mov r1,#1
	bl SetGpioFunction

	@ puerto 14 como salida
	mov r0,#14
	mov r1,#1
	bl SetGpioFunction
	pop{pc}

.globl EncendidoT
EncendidoT:

	push{lr}
	mov r0,#7
	mov r1,#1
	bl SetGpio
	
	mov r0,#8
	mov r1,#1
	bl SetGpio
	
	mov r0,#9
	mov r1,#1
	bl SetGpio
	
	mov r0,#10
	mov r1,#1
	bl SetGpio
	
	mov r0,#11
	mov r1,#1
	bl SetGpio
	
	mov r0,#14
	mov r1,#1
	bl SetGpio
	
	/* Delay de 0.5s */
	ldr r0,=500000
	bl Wait	
	pop{pc}