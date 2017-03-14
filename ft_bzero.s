; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_bzero.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2016/05/05 23:03:18 by fnieto            #+#    #+#              ;
;    Updated: 2016/05/08 13:58:13 by fnieto           ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_bzero

%define DQMASK (~15)

section .data align=128

mask: db -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

section .text align=128

_ft_bzero:
	push rdx
	test rdi, rdi
	jz .end
	test rsi, rsi
	jz .end
	vpxor xmm0, xmm0, xmm0
	test rsi, DQMASK; look if too small for an xmm operation
	jnz .base
	lea rdx, [rel mask]
	sub rdx, rsi
	movdqu xmm1, [16 + rdx]; sample mask
	maskmovdqu xmm0, xmm1
	jmp .end
.base:
	mov rdx, rdi
	sub rsi, 16
	movdqu [rdi], xmm0
	and rdx, 15
	movdqu [rdi + rsi], xmm0
	add rsi, rdx
	and rdi, DQMASK
	shr rsi, 4
	add rdi, 16
	test rsi, 3
	jz .skip2
	test rsi, 1
	jz .skip1
	movdqa [rdi], xmm0
	add rdi, 16
.skip1:
	test rsi, 2
	jz .skip2
	movdqa [rdi], xmm0
	movdqa [rdi + 16], xmm0
	add rdi, 32
.skip2:
	shr rsi, 2
	jz .end
.loopey:
	movdqa [rdi], xmm0
	movdqa [rdi + 16], xmm0
	movdqa [rdi + 32], xmm0
	movdqa [rdi + 48], xmm0
	
	add rdi, 64
	dec rsi
	jnz .loopey
.end:
	pop rdx
	ret
