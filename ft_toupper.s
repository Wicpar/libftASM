# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_toupper.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/16 15:52:36 by fnieto            #+#    #+#              #
#    Updated: 2017/03/16 15:52:37 by fnieto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_toupper
extern _ft_isalpha

_ft_toupper:
	mov rsi, rdi
	call _ft_isalpha
	test rax, rax
	jz .end
	and rsi, ~0x20
.end:
	mov rax, rsi
	ret
