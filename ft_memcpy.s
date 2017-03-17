; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/03/16 15:51:56 by fnieto            #+#    #+#              ;
;    Updated: 2017/03/16 15:51:57 by fnieto           ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_memcpy

%define DQMASK (~15)

section .data align=128

mask: db -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

section .text align=128

_ft_memcpy:
	push rdi
	test rdi, rdi
	jz .end
	test rsi, rsi
	jz .end
	test rdx, rdx
	jz .end
	test rdx, DQMASK; look if too small for an xmm operation
	jnz .base
	movdqu xmm0, [rsi]
	lea rcx, [rel mask]
	sub rcx, rdx
	movdqu xmm1, [16 + rcx]; sample mask
	maskmovdqu xmm0, xmm1
	jmp .end
.base:
	sub rdx, 16
	movdqu xmm0, [rsi]
	mov rcx, rdi
	movdqu xmm1, [rsi + rdx]
	add rsi, 16
	movdqu [rdi], xmm0
	and rcx, 15
	movdqu [rdi + rdx], xmm1
	add rdx, rcx
	add rsi, rcx
	and rdi, DQMASK
	shr rdx, 4
	add rdi, 16
	test rdx, 3
	jz .skip2
	test rdx, 1
	jz .skip1
	movdqu xmm0, [rsi]
	add rsi, 16
	movdqa [rdi], xmm0
	add rdi, 16
.skip1:
	test rdx, 2
	jz .skip2
	movdqu xmm0, [rsi]
	movdqu xmm1, [rsi + 16]
	add rsi, 32
	movdqa [rdi], xmm0
	movdqa [rdi + 16], xmm1
	add rdi, 32
.skip2:
	shr rdx, 2
	jz .end
.loopey:
	movdqu xmm0, [rsi]
	movdqu xmm1, [rsi + 16]
	movdqu xmm2, [rsi + 32]
	movdqu xmm3, [rsi + 48]
	add rsi, 64
	movdqa [rdi], xmm0
	movdqa [rdi + 16], xmm1
	movdqa [rdi + 32], xmm2
	movdqa [rdi + 48], xmm3
	add rdi, 64
	dec rdx
	jnz .loopey
.end:
	pop rax
	ret