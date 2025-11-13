%include 'in_out.asm'

SECTION .data
msg: DB 'Номер варианта 6. Выражение x^3/2+1. Введите x ',0
rem: DB 'Ваш ответ: ',0

SECTION .bss
a: RESB 80
x: RESB 80

SECTION .text
GLOBAL _start
_start:

mov eax, msg
call sprintLF

mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, `eax=x`

mov ebx,eax
mul eax
mul ebx
xor edx,edx
mov ebx,2
div ebx
xor ebx,ebx
add eax,1
mov [a],eax

mov eax, rem
call sprint
mov eax, [a]
call iprintLF
call quit



