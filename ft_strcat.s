; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcat.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2016/05/06 01:02:08 by fnieto            #+#    #+#              ;
;    Updated: 2016/05/08 14:01:20 by fnieto           ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

		global _ft_strcat

		section .text

_ft_strcat:

		push	rdi
		cmp		rsi, 0
		je		end
		cmp		rdi, 0
		je		end
		xor		rax, rax
		mov		rcx, -1
		cld
repne	scasb
		dec		rdi
		push	rdi
		mov		rdi, rsi
		mov		rcx, -1
repne	scasb
		mov		rbx, -1
		sub		rbx, rcx
		mov		rcx, rbx
		pop		rdi
		shr		rcx, 3
rep		movsq
		test	rbx, 0b100
		jz		w
		movsd
w:		test	rbx, 0b10
		jz		b
		movsw
b:		test	rbx, 0b1
		jz		end
		movsb

end:
		pop		rax
		ret
