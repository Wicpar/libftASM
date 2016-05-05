# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/04/30 19:43:25 by fnieto            #+#    #+#              #
#    Updated: 2016/05/05 22:25:17 by fnieto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=libfts.a

CC=nasm

CFLAGS=-Wall -Wextra -Werror -O4

RM=rm -f

SRC=

OBJ=$(SRC:.c=.o)

INCL=includes/

$(NAME): $(OBJ) $(INCL)/libfts.h
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)

%.o: %.c
	@-$(CC) -I includes -c $< -o $@ $(CFLAGS)
	@echo "$< >> $@"

all: $(NAME)

clean:
		$(RM) $(OBJ)

fclean: clean
		$(RM) $(NAME)

re: fclean all

.PHONY: clean fclean
