# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fnieto <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/03/09 20:50:44 by fnieto            #+#    #+#              #
#    Updated: 2016/05/05 23:02:45 by fnieto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=lift_test

CC=gcc

CFLAGS= -Wall -Wextra -Werror

RM=rm -f

SRC=

LIB=-L ../libfts.a
INCL=-I ../includes -I .

OBJ=$(SRC:.c=.o)

$(NAME): $(OBJ) $(PARENT).h
	@echo "Compiling for " $(UNAME)
	@make -C ..
	@echo "[>>libfts<<]"
	@$(CC) -o $(NAME) $(OBJ) $(LIB) $(CFLAGS)
	@echo "[.o] >> [$(NAME)]"

%.o: %.c
	@-$(CC) $(INCL) -c $< -o $@ $(CFLAGS)
	@echo "$< >> $@"

all: $(NAME)

announce_name:
	@echo "Making $(NAME)"

norm:
	@norminette $(SRC) $(PARENT).h

clean:
	@make -C libft/ clean
	@$(RM) $(OBJ)
	@echo "[.o] >> /dev/null"

fclean: clean
	@make -C libft/ fclean
	@$(RM) $(NAME)
	@echo "[rt] >> /dev/null"

re: fclean all

.PHONY: clean fclean all norm re
