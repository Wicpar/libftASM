# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_tolower.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/16 15:52:19 by fnieto            #+#    #+#              #
#    Updated: 2017/03/16 15:52:21 by fnieto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_tolower
extern _ft_isalpha

_ft_tolower:
	mov rsi, rdi
	call _ft_isalpha
	test rax, rax
	jz .end
	or rsi, 0x20
.end
	mov rax, rsi
	ret
