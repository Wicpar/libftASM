# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    runmain.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fnieto <fnieto@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/05/06 00:18:40 by fnieto            #+#    #+#              #
#    Updated: 2017/02/19 19:15:36 by fnieto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

gcc -I includes -O0 -c main.c -o main.o
gcc -I includes libfts.a main.o -o test
rm main.o
time ./test
rm test
