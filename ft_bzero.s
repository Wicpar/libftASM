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

%define DQMASK ((~0) * 16)

section .text align=128

_ft_bzero:

	prefetchnta [rdi]

	test rdi, rdi
	jz end
	test rsi, rsi
	jz end
	test rsi, DQMASK
	jz q

	mov rdx, rsi
	vpxor xmm0, xmm0, xmm0
	and rdx, 16 - 1
	movdqu oword[rdi], xmm0
	shr rsi, 4
	add rdi, rdx
	test rsi, 3
	jz preloopey

	test rsi, 2
	jz skip2

	movdqu oword[rdi], xmm0
	movdqu oword[rdi + 16], xmm0
	add rdi, 32

skip2:
	test rsi, 1
	jz preloopey
	movdqu oword[rdi], xmm0
	add rdi, 16

preloopey:
	shr rsi, 2
	jz end
	prefetchnta [rdi + 512]
loopey:
	movdqu oword[rdi], xmm0
	movdqu oword[rdi + 16], xmm0
	movdqu oword[rdi + 32], xmm0
	movdqu oword[rdi + 48], xmm0
	prefetchnta [rdi + 512]
	add rdi, 64
	dec rsi
	jnz loopey
	jmp end
q:
	test rsi, 8
	jz d
	mov qword[rdi], 0
	add rdi, 8
d:
	test rsi, 4
	jz w
	mov dword[rdi], 0
	add rdi, 4
w:
	test rsi, 2
	jz b
	mov word[rdi], 0
	add rdi, 2
b:
	test rsi, 1
	jz end
	mov byte[rdi], 0
end:
	ret
