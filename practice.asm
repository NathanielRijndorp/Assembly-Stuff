section .data
  inputNumber:     db 'Please enter first number:', 0xa    ; 
  inputNumberLen:  equ $-inputNumber             ; 
  inputNumber2:    db 'Please enter second number:', 0xa
  inputNumberLen2: equ $-inputNumber2
  inputNumber3:    db 'Please enter third number:', 0xa
  inputNumberLen3: equ $-inputNumber3
  greatestNum:     db 'Largest number is '
  greatestNumLen:  equ $-greatestNum
  smallestNum:     db 0xa, 'Smallest number is '
  smallestNumLen:  equ $-smallestNum
  isEqual:         db 0xa, 'Numbers are equal'
  isEqualLen:      equ $-isEqual
  isNotEqual:      db 0xa, 'Numbers are not equal'
  isNotEqualLen:   equ $-isNotEqual
section .bss
  num1 resb 1
  num2 resb 1
  num3 resb 1
  
section .text
  global _start

_start:
  ; Print enter first number
  mov edx, inputNumberLen
  mov ecx, inputNumber
  mov ebx, 1
  mov eax, 4
  int 80h
  ; Get num1
  mov edx, 2 
  mov ecx, num1
  mov ebx, 0
  mov eax, 3 
  int 80h
  
  ; Print enter second number
  mov edx, inputNumberLen2
  mov ecx, inputNumber2
  mov ebx, 1
  mov eax, 4
  int 80h
  ; Get num2
  mov edx, 2 
  mov ecx, num2
  mov ebx, 0
  mov eax, 3 
  int 80h
  
  ; Print enter third number
  mov edx, inputNumberLen3
  mov ecx, inputNumber3
  mov ebx, 1
  mov eax, 4
  int 80h
  ; Get num3
  mov edx, 2 
  mov ecx, num3
  mov ebx, 0
  mov eax, 3 
  int 80h
  
  ; Compare the numbers to find the largest
  movzx eax, byte [num1]
  movzx ebx, byte [num2]
  cmp eax, ebx
  jg compare_with_num3
  jl compare_num2_and_num3
  
compare_with_num3:
  ; Compare num1 and num3
  movzx eax, byte [num3]
  cmp al, byte [num1]
  jg print_num3_greatest
  jmp print_num1_greatest
  
compare_num2_and_num3:
  ; Compare num2 and num3
  movzx eax, byte [num3]
  cmp al, byte [num2]
  jg print_num3_greatest
  jmp print_num2_greatest
  
print_num1_greatest:
  ; Print num1 as the largest number
  mov edx, greatestNumLen
  mov ecx, greatestNum
  mov ebx, 1
  mov eax, 4
  int 80h
  ; Print num1
  mov edx, 1
  mov ecx, num1
  mov ebx, 1
  mov eax, 4
  int 80h
  jmp print_smallest_number
  
print_num2_greatest:
  ; Print num2 as the largest number
  mov edx, greatestNumLen
  mov ecx, greatestNum
  mov ebx, 1
  mov eax, 4
  int 80h
  ; Print num2
  mov edx, 1
  mov ecx, num2
  mov ebx, 1
  mov eax, 4
  int 80h
  jmp print_smallest_number
  
print_num3_greatest:
  ; Print num3 as the largest number
  mov edx, greatestNumLen
  mov ecx, greatestNum
  mov ebx, 1
  mov eax, 4
  int 80h
  ; Print num3
  mov edx, 1
  mov ecx, num3
  mov ebx, 1
  mov eax, 4
  int 80h
  jmp print_smallest_number

print_smallest_number:
  ; Compare the numbers to find the smallest
  movzx eax, byte [num1]
  movzx ebx, byte [num2]
  cmp eax, ebx
  jg check_smallest_num2
  jl check_smallest_num1

check_smallest_num1:
  ; Compare num1 with num3
  movzx eax, byte [num3]
  cmp al, byte [num1]
  jg print_num1_smallest
  jmp print_num3_smallest

check_smallest_num2:
  ; Compare num2 with num3
  movzx eax, byte [num3]
  cmp al, byte [num2]
  jg print_num2_smallest
  jmp print_num3_smallest



print_num1_smallest:
  ; Print num1 as the smallest number
  mov edx, smallestNumLen
  mov ecx, smallestNum
  mov ebx, 1
  mov eax, 4
  int 80h
  ; Print num1
  mov edx, 1
  mov ecx, num1
  mov ebx, 1
  mov eax, 4
  int 80h
  jmp print_is_equal
  
print_num2_smallest:
  ; Print num2 as the smallest number
  mov edx, smallestNumLen
  mov ecx, smallestNum
  mov ebx, 1
  mov eax, 4
  int 80h
  ; Print num2
  mov edx, 1
  mov ecx, num2
  mov ebx, 1
  mov eax, 4
  int 80h
  jmp print_is_equal
  
print_num3_smallest:
  ; Print num3 as the smallest number
  mov edx, smallestNumLen
  mov ecx, smallestNum
  mov ebx, 1
  mov eax, 4
  int 80h
  ; Print num3
  mov edx, 1
  mov ecx, num3
  mov ebx, 1
  mov eax, 4
  int 80h
  jmp print_is_equal
  

print_is_equal:
  ; Compare all three numbers for equality
  movzx eax, byte [num1]
  movzx ebx, byte [num2]
  cmp eax, ebx
  jne not_all_equal
  movzx eax, byte [num1]
  movzx ebx, byte [num3]
  cmp eax, ebx
  jne not_all_equal
  movzx eax, byte [num2]
  movzx ebx, byte [num3]
  cmp eax, ebx
  jne not_all_equal
  ; All three numbers are equal
  mov edx, isEqualLen
  mov ecx, isEqual
  mov ebx, 1
  mov eax, 4
  int 80h
  jmp exit_program

not_all_equal:
  mov edx, isNotEqualLen
  mov ecx, isNotEqual
  mov ebx, 1
  mov eax, 4
  int 80h
  jmp exit_program
  
exit_program:
  ; Exit the program
  mov eax, 1
  xor ebx, ebx
  int 80h
