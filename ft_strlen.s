; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/03/16 15:52:16 by fnieto            #+#    #+#              ;
;    Updated: 2017/03/16 15:52:17 by fnieto           ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strlen

_ft_strlen:
	xor rax, rax
	test rdi, rdi
	jz .end
	mov rcx, -1
	cld
	repne scasb
	mov rax, -2
	sub rax, rcx
.end:
	ret
