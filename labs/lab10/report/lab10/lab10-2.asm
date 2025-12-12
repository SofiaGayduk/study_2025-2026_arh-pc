%include 'in_out.asm'
SECTION .data
filename db 'name.txt', 0h ; Имя файла
msg db 'Как Вас зовут? ', 0h ; Сообщение
name db 'Меня зовут ', 0h
SECTION .bss
contents resb 255 ; переменная для вводимой строки
SECTION .text
global _start
_start:
mov eax,msg
call sprint

mov ecx, contents
mov edx, 255
call sread

mov ecx, 0777o
mov ebx, filename
mov eax, 8
int 80h

mov ecx, 2
mov ebx, filename
mov eax, 5
int 80h

mov esi, eax
mov eax, name
call slen

mov edx, eax
mov ecx, name
mov ebx, esi
mov eax, 4
int 80h

mov ebx, esi
mov eax, 6
int 80h

mov ecx, 1
mov ebx, filename
mov eax, 5
int 80h

mov edx, 2
mov ecx, 0
mov ebx, eax
mov eax, 19
int 80h

mov edx, 9
mov ecx, contents
mov eax, 4
int 80h

mov ebx, esi
mov eax, 6
int 80h

call quit
