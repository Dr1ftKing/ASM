;nasm -f win messageBox.asm
;golink messageBox.obj user32.dll kernel32.dll

global  start
NULL  equ 0		; NULL equates 0
MB_OK  equ 0	; MB_OK equates 0

; extern declares a symbol not defined in the module being assembled

extern MessageBoxA ;from user32		; Function MessageBoxA is from user32.dll
extern ExitProcess ;from kernel32		; Function ExitProcess is from kernel32.dll
section .data			; Declare initialized data section 
hello: db  'Hello, Windows!',0	; hello is a character string. 0 is null terminator for a string
title: db  'My First Win32',0		; title is a character string. 0 is null terminator for a string
section .text	; Declare code/text section
start:		; entry point, i.e. the main(.) function
  push MB_OK	; Push MB_OK onto the stack
  push title		; Push title (an address) onto the stack
  push hello		; Push hello (an address) onto the stack
  push NULL	; Push NULL onto the stack
  call MessageBoxA	; Call MessageBoxA(NULL, hello, title, MB_OK)
  push 0		; Push 0 onto the stack
  call ExitProcess		; Call ExitProcess(0)
