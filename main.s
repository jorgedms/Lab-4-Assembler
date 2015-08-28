@--------------------------------------------------------
@Universidad del Valle de Guatemala
@Prelaboratorio 4 Assembler
@Autor: Christopher Aju, 13171
@
@Archivo que realiza una secuencia de encendido de leds
@primera secuencia
@		verde:encendido
@		amarillo:apagado
@		rojo:apagado
@
@segunda secuencia
@		verde:apagado
@		amarillo:encendido
@		rojo:apagado
@
@tercera secuencia
@		verde:apagado
@		amarillo:apagado
@		rojo:encendido
@--------------------------------------------------------

.section .init
.globl _start
_start:

b main
@---------------------------------------------------------------
@Macro para el write
@---------------------------------------------------------------
.macro Write puerto
	mov r0, \puerto
	mov r1, #1
	bl SetGpioFunction
.endm

@------------------------------------------------------------------
@Macro para encendido de 2 leds
@Recibe:
@		puerto1 = puerto a encender
@		puerto2 = puerto a encender
@Funcion:
@		Enciende los pines recibidos y crea un delay de 1 segundo
@------------------------------------------------------------------
.macro Encendido2 puerto1, puerto2
	/*encendido de pines*/
	mov r0, \puerto1	@puerto a encender
	mov r1, #1			@codigo de encendido
	bl SetGpio
	
	mov r0, \puerto2	@puerto a encender
	mov r1, #1			@codigo de encendido
	bl SetGpio
	
	/*delay*/
	ldr r0, =1000000
	bl Wait
.endm

@------------------------------------------------------------------
@Macro para encendido de 1 led
@Recibe:
@		puerto1 = puerto a encender
@Funcion:
@		Enciende el pin que recibe
@------------------------------------------------------------------
.macro Encendido1 puerto1
	/*encender pin*/
	mov r0, \puerto1	@puerto a encender
	mov r1, #1			@codigo de encendido
	bl SetGpio
.endm

@---------------------------------------------------------------
@					fin de seccion de Macros
@---------------------------------------------------------------
.section .text

main:
	mov sp, #0x8000

@ loop infinito
infinito:

@@ colocar los puertos del 7 al 11 y 14 como salidas
bl Asignacion

@@			 7 8 9 10 11 14
@@ secuencia x x 0 0  x  x

Encendido2 9, 10
bl Apagado

@@			 7 8 9 10 11 14
@@ secuencia x 0 x x  0  x

Encendido2 8, 11
bl Apagado

@@			 7 8 9 10 11 14
@@ secuencia 0 x x x  x  0

Encendido2 7, 14
bl Apagado

b infinito