# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/04/30 19:43:25 by fnieto            #+#    #+#              #
#    Updated: 2016/05/08 20:45:12 by fnieto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=libfts.a

CC=~/.brew/Cellar/nasm/2.12.01/bin/nasm

CFLAGS=-f macho64

RM=rm -f

SRC=ft_bzero.s\
	ft_strcat.s\

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
