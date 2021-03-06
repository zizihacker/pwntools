<% from pwnlib.shellcraft import common %>
<%docstring>Returns code to switch from i386 to amd64 mode.</%docstring>
<% helper, end = common.label("helper"), common.label("end") %>
[bits 32]
    push 0x33 /*  This is the segment we want to go to */
    call $+4
${helper}:
    db 0xc0
    add dword [esp], ${end} - ${helper}
    jmp far [esp]
${end}:
[bits 64]
