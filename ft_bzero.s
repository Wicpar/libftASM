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

		section .text

_ft_bzero:

		cmp		rsi, 0
		je		end
		cmp		rdi, 0
		je		end
		mov		rcx, rsi
		sub		rsi, 1
		add		rdi, rsi
		xor		rax, rax
		mov		rbx, rcx
		shr		rcx, 3

;q:

		sub		rdi, 7
		std
		rep		stosq

;d:

		add		rdi, 4
		test	rbx, 0b100
		jz		w
		stosd

w:

		add		rdi, 2
		test	rbx, 0b10
		jz		b
		stosw

b:

		inc		rdi
		test	rbx, 0b1
		jz		end
		stosb

end:

		ret
