/*
 * fib.s
 *
 *  Created on: Nov 4, 2020
 *      Author: ayo_o
 */



 .text
 .global main
 .extern printf

//main function has value of n
//n is stored in x0

 main:
	mov x1, #1
 	mov x2, xzr
 	mov x0, #14
 	mov x20, #1
	.global Fibonacci

//does the fibonacci progression

Fibonacci:
	//using stack pointers to store values
 	sub SP, SP, #32
 	stur x30, [SP, #24]
 	stur x0, [SP, #16]
	stur x1, [SP, #8]
	stur x2, [SP, #0]
	subs xzr, x0, x20

	b.gt L1
	add x7, xzr, x20
	mov x0, x7
	add SP, SP, #32
	b print_string

//Goes to L1 unitl end of recursion

L1:
	sub x0, x0, #1
	add x10, x1, x2
	mov x2, x1
	mov x1, x10
	BL Fibonacci

//loading values with stack pointers

	ldur x2, [SP, #0]
	ldur x1, [SP, #8]
	ldur x0, [SP, #16]
	ldur x30, [SP, #24]
	add SP, SP, #32
	add x7, x1, x7
	br x30

//prints out the nth term of fibonacci sequence
print_string:
	ldr x0, =string
	bl printf
	br x30
	.data

//ending
string:
	.asciz "%d\n"
	.end
