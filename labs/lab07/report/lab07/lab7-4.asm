%include 'in_out.asm'
section .data
	msg1 db 'Введите x: ',0h
	msg2 db 'Введите a: ',0h
	msg3 db "Итого: ",0h

section .bss
	x: resb 80
	a: resb 80
	itog: resb 80

section .text
	global _start
_start:
; ---------- Вывод сообщения 'Введите a: '
	mov eax,msg2
	call sprint
; ---------- Ввод 'a'
	mov ecx,a
	mov edx,80
	call sread
; ---------- Преобразование 'a' из символа в число
	mov eax,a
	call atoi ; Вызов подпрограммы перевода символа в число
	mov [a],eax
; ---------- Вывод сообщения 'Введите x: '
	mov eax,msg1
	call sprint
; ---------- Ввод 'x'
	mov ecx,x
	mov edx,80
	call sread
; ---------- Преобразование 'x' из символа в число
	mov eax,x
	call atoi ; Вызов подпрограммы перевода символа в число
	mov [x],eax ; запись преобразованного числа в 'x'
	cmp eax,[a]
	je check_A
	mov eax,[x]
	mov ebx,5
	mul ebx
	mov [itog],eax
	jmp fin
check_A:
	mov ecx,[a]
	add ecx,[x]
	mov [itog],ecx
; ---------- Вывод результата
fin:
	mov eax, msg3
	call sprint
	mov eax,[itog]
	call iprintLF
	call quit ; Выход

