; helloWorld.asm
;
; This is a Win32 console program that writes "Hello, World" on one line and
; then exits.  It needs to be linked with a C library.
; nasm -f win helloworld.asm
; gcc -m32 helloworld.obj  -o helloWorld.exe
; ----------------------------------------------------------------------------
	; if one module declares a symbol as EXTERN and refers to it,
	; some other module must actually define the symbol and declare it as GLOBAL
	global  _main ; declare entry point
	; extern declares a symbol not defined in the module being assembled,
	; but in some other module and needs to be referred to by this one
	extern  _printf
	section .text
_main:  ; _main function
	push    message  ; push message (an address) onto stack
	call    _printf  ; call _printf (external) function
	add     esp, 4  ; esp+=4
	ret
message:  ; A label points to a string in the code section!
	db  'Hello, World', 10, 0  ; hello world string. 10 is the Line Feed character. 0 is the null terminator 
