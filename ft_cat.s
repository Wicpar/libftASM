# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_cat.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/16 15:51:05 by fnieto            #+#    #+#              #
#    Updated: 2017/03/16 15:51:07 by fnieto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_cat

section .data align=128

buf: resb 512
.len: equ $ - buf

section .text align=128

_ft_cat:
	push rbp
	mov rbp, rsp
.read:
	push rdi
	mov rax, 0x2000003
	lea rsi, [rel buf]
	mov rdx, buf.len
	syscall
	jc .err
	test rax, rax
	jz .end
	mov rdi, [rsp]
	mov rdx, rax
	lea rsi, [rel buf]
	mov rax, 0x2000004
	syscall
	jc .err
	jmp .read
.err:
	mov rax, 1
.end:
	mov rsp, rbp
	pop rbp
	ret
