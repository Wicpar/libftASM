# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isprint.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/16 15:51:52 by fnieto            #+#    #+#              #
#    Updated: 2017/03/16 15:51:53 by fnieto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_isprint

_ft_isprint:
	cmp rdi, ' '
	jb .no
	cmp rdi, '~'
	jg .no
	mov rax, 1
	ret
.no:
	xor rax, rax
	ret
