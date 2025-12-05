%include 'in_out.asm'
SECTION .data
msg1 db "Функция: f(x)=4x-3",0
msg2 db "Результат: ",0
msg3 db "Номер варианта 6",0
SECTION .text
global _start
_start:
pop ecx ; Извлекаем из стека в `ecx` количество аргументов (первое значение в с>
pop edx ; Извлекаем из стека в `edx` имя программы (второе значение в стеке)
sub ecx,1 ; Уменьшаем `ecx` на 1 (количество аргументов без названия программы)
mov esi, 1 ; Используем `esi` для хранения промежуточных значений функций
mov edi,0 ; Сумма функций
next:
cmp ecx,0h ; проверяем, есть ли еще аргументы
jz _end ; если аргументов нет выходим из цикла (переход на метку `_end`)
pop eax ; иначе извлекаем следующий аргумент из стека
call atoi ; преобразуем символ в число

call _calcul

loop next ; переход к обработке следующего аргумента
_end:
mov eax, msg3 ; вывод сообщения "Номер варианта 6"
mov eax, msg1 ; вывод сообщения "Функция: f(x)=4x-3 "
call sprintLF
mov eax, msg2 ; вывод сообщения "Результат: "
call sprint
mov eax, edi ; записываем сумму в регистр `eax`
call iprintLF ; печать результата
call quit ; завершение программы

_calcul:
mov eax,eax
mov ebx, 4
mul ebx
sub eax,3
add edi,eax

ret
