# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    runmain.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fnieto <fnieto@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/05/06 00:18:40 by fnieto            #+#    #+#              #
#    Updated: 2017/03/29 22:14:10 by fnieto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

make
gcc -I includes -O0 -c main.c -o main.o
gcc -I includes libfts.a main.o -o test
rm main.o
time ./test $1
#rm test
