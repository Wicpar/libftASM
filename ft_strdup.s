; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/03/16 15:52:12 by fnieto            #+#    #+#              ;
;    Updated: 2017/03/16 15:52:13 by fnieto           ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strdup
extern _ft_memcpy
extern _ft_strlen
extern _malloc

_ft_strdup:
	test rdi, rdi
	jz .end
	push rdi
	call _ft_strlen
	inc rax
	push rax
	mov rdi, rax
	call _malloc
	pop rdx
	pop rsi
	mov rdi, rax
	call _ft_memcpy
.end:
	ret
