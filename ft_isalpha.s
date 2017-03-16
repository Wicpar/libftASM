# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalpha.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/16 15:51:17 by fnieto            #+#    #+#              #
#    Updated: 2017/03/16 15:51:19 by fnieto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_isalpha

_ft_isalpha:
	and rdi, ~0x20
	jz .no
	cmp rdi, 'A'
	jb .no
	cmp rdi, 'Z'
	ja .no
	mov rax, 1
	ret
.no:
	xor rax, rax
	ret

