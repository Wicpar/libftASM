# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_cat.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/16 15:51:05 by fnieto            #+#    #+#              #
#    Updated: 2017/03/29 22:49:46 by fnieto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_cat

section .bss align=128

buf: resb 512
.len: equ $ - buf

section .text align=128

_ft_cat:
	push rdi
.read:
	mov rdi, [rsp]
	mov rax, 0x2000003
	lea rsi, [rel buf]
	mov rdx, buf.len
	syscall
	jc .err
	test rax, rax
	jz .end
	mov rdx, rax
	mov rdi, 1
	lea rsi, [rel buf]
	mov rax, 0x2000004
	syscall
	jc .err
	jmp .read
.err:
	mov rax, 1
.end:
	pop rdi
	ret
