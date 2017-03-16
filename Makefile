# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fnieto <fnieto@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/04/30 19:43:25 by fnieto            #+#    #+#              #
#    Updated: 2017/03/16 16:37:17 by fnieto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=libfts.a

CC=~/.brew/Cellar/nasm/2.12.01/bin/nasm

CFLAGS=-f macho64

RM=rm -f

SRC=ft_bzero.s\
	ft_cat.s\
	ft_isalnum.s\
	ft_isalpha.s\
	ft_isascii.s\
	ft_isdigit.s\
	ft_isprint.s\
	ft_memcpy.s\
	ft_memset.s\
	ft_puts.s\
	ft_strcat.s\
	ft_strdup.s\
	ft_strlen.s\
	ft_tolower.s\
	ft_toupper.s\

OBJ=$(SRC:.s=.o)

INCL=includes/

$(NAME): $(OBJ) $(INCL)/libfts.h
	@ar rc $(NAME) $(OBJ)
	@echo "[.o] >> $(NAME)"
	@ranlib $(NAME)

%.o: %.s
	$(CC) -I $(INCL) $(CFLAGS) $< -o $@
	@echo "$< >> $@"

all: $(NAME)

clean:
		$(RM) $(OBJ)

fclean: clean
		$(RM) $(NAME)

re: fclean all

.PHONY: clean fclean
