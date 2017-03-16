# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memset.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/16 15:52:00 by fnieto            #+#    #+#              #
#    Updated: 2017/03/16 15:52:01 by fnieto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_memset


%define DQMASK (~15)

section .data align=128

mask: db -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

section .text align=128

_ft_memset:
	push rdi
	test rdi, rdi
	jz .end
	test rdx, rdx
	jz .end
	movq xmm0, rsi
	pxor xmm1, xmm1
	pshufb xmm0, xmm1
	test rdx, DQMASK; look if too small for an xmm operation
	jnz .base
	lea rcx, [rel mask]
	sub rcx, rdx
	movdqu xmm1, [16 + rcx]; sample mask
	maskmovdqu xmm0, xmm1
	jmp .end
.base:
	mov rcx, rdi
	sub rdx, 16
	movdqu [rdi], xmm0
	and rcx, 15
	movdqu [rdi + rdx], xmm0
	add rdx, rcx
	and rdi, DQMASK
	shr rdx, 4
	add rdi, 16
	test rdx, 3
	jz .skip2
	test rdx, 1
	jz .skip1
	movdqa [rdi], xmm0
	add rdi, 16
.skip1:
	test rdx, 2
	jz .skip2
	movdqa [rdi], xmm0
	movdqa [rdi + 16], xmm0
	add rdi, 32
.skip2:
	shr rdx, 2
	jz .end
.loopey:
	movdqa [rdi], xmm0
	movdqa [rdi + 16], xmm0
	movdqa [rdi + 32], xmm0
	movdqa [rdi + 48], xmm0
	add rdi, 64
	dec rdx
	jnz .loopey
.end:
	pop rax
	ret