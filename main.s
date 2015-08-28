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
@---------------------------------------------------------------
@					fin de seccion de Macros
@---------------------------------------------------------------
.section .text

main:
	mov sp, #0x8000