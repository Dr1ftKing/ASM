;nasm -f win exitProcess.asm
;golink /console exitProcess.obj msvcrt.dll kernel32.dll

global start
extern printf  ;from msvcrt. MSVCRT. DLL is the C standard library for the Visual C++ (MSVC) compile
extern scanf  ;from msvcrt
extern ExitProcess  ;from kernel32
section .bss		; Uninitialized data segment
name:  resb 100	; allocate 100 bytes
section  .data	; data section
prompt:  db 'Enter your name: ',0		; declare string prompt
frmt:  db '%s',0		; declare string frmt
greet:  db 'Hello, %s!',0ah,0	; declare string greet
section  .text	; Declaring text (code) section
start:	; Entry point
  push  prompt	; push prompt (an address) onto stack
  call  printf		; call printf(prompt)
  add  esp,4	; esp+=4
  push  name	; push name onto stack
  push  frmt		; push frmt onto stack
  call  scanf		; scanf(frmt, name)
  add  esp,8	; esp+=8
  push  name	; push name onto stack
  push  greet	; push greet onto stack
  call  printf		; printf(greet, name)
  add  esp,8	; esp+=8
  push  0		; push 0 onto stack
  call  ExitProcess		; ExitProcess(0)
