/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fnieto <fnieto@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/05/06 00:11:31 by fnieto            #+#    #+#             */
/*   Updated: 2017/02/19 20:42:20 by fnieto           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libc.h>
#include "libfts.h"

static inline uint64_t rdtsc(void)
{
    uint32_t eax, edx;
    asm volatile("rdtsc\n\t": "=a" (eax), "=d" (edx));
    return (uint64_t)eax | (uint64_t)edx << 32;
}

#define TEST(fn, ret, ...) \
	{\
		long a;\
		long b;\
		a = rdtsc();\
		fn(__VA_ARGS__);\
		b = rdtsc();\
		ret = b - a;\
	}\

#define TESTITER(fn, ret, iter, ...)\
	{\
		long a;\
		long b;\
		long i = iter;\
		ret = 0;\
		while (i-- > 0)\
		{\
			a = rdtsc();\
			fn(__VA_ARGS__);\
			b = rdtsc();\
			ret += b - a;\
		}\
	}\

int		main(int ac, char **av)
{
	char	*ptr;
	int		len;
	int		iter;
	int		i;
	uint64_t	a;
	uint64_t	b;
	long	diff;

	len = 1000000;
	iter = 1;
	ptr = malloc(len);

	printf("ft_bzero(2000):\n");
	memset(ptr, 1, len);
	TESTITER(ft_bzero, diff, iter, ptr, len);
	printf("solved in %li ticks\n", diff);

	printf("\n\nbzero(2000):\n");
	memset(ptr, 1, len);
	TESTITER(bzero, diff, iter, ptr, len);
	printf("solved in %li ticks\n", diff);

	len = 0;
	printf("\n\nft_bzero(0):\n");
	TESTITER(ft_bzero, diff, iter, ptr, len);
	printf("solved in %li ticks\n", diff);

	printf("\n\nbzero(0):\n");
	TESTITER(bzero, diff, iter, ptr, len);
	printf("solved in %li ticks\n", diff);

	free(ptr);
}
