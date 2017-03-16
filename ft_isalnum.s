; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalnum.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/03/16 15:53:25 by fnieto            #+#    #+#              ;
;    Updated: 2017/03/16 15:53:26 by fnieto           ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

extern _ft_isalpha
extern _ft_isdigit

global _ft_isalnum

_ft_isalnum:
	push rdi
	call _ft_isdigit
	pop rdi
	test rax, rax
	jnz .end
	call _ft_isalpha
.end:
	ret