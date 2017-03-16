# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_puts.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/16 15:52:05 by fnieto            #+#    #+#              #
#    Updated: 2017/03/16 15:52:06 by fnieto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_puts
extern _ft_strlen
extern _write


section .data align=128

nl:		db 10
.len: 	equ $ - nl

section .text align=128

_ft_puts:
	push rdi
	call _ft_strlen
	push rax
	mov rax, 0x2000004
	mov rdi, 1
	pop rdx
	pop rsi
	syscall
	cmp rax, ~0
	je .end
	mov rax, 0x2000004
	mov rdi, 1
	lea rsi, [rel nl]
	mov rdx, 1
	syscall
.end:
	ret

