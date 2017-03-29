/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fnieto <fnieto@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/05/06 00:11:31 by fnieto            #+#    #+#             */
/*   Updated: 2017/03/29 22:14:38 by fnieto           ###   ########.fr       */
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

static long min(long a, long b) {
	return a > b ? b : a;
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
		ret = 9223372036854775807;\
		while (i-- > 0)\
		{\
			a = rdtsc();\
			fn(__VA_ARGS__);\
			b = rdtsc();\
			ret = min(b - a, ret);\
		}\
	}\

void	print_mem(char * mem, size_t len)
{
	len++;
	while (--len)
		printf("%i ", *mem++);
	printf("\n");
}

int		main(int ac, char **av)
{
	char	*ptr;
	int		len;
	int		iter;
	int		i;
	uint64_t	a;
	uint64_t	b;
	long	diff;
	long	offset;
	long	padding;

	padding = 16;
	offset = 3;
	len = 15;
	iter = 10;

	i = -1;
	diff = 0;
	while (++i < 16000) {
		int j = -1;
		long tmpa = 9223372036854775807;
		long tmpb = 9223372036854775807;
		while (++j < iter) {
			char * mem1 = malloc(i + padding + offset) + offset;
			char * mem2 = malloc(i + padding + offset) + offset;
			memset(mem1 - offset, 1, i + padding + offset);
			memset(mem2 - offset, 1, i + padding + offset);
			long ft;
			long base;
			TEST(bzero, base, mem2, i);
			TEST(ft_bzero, ft, mem1, i);
			if (memcmp(mem1 - offset, mem2 - offset, i + padding + offset)) {
				print_mem(mem1 - offset, i + padding + offset);
			}
			tmpa = min(ft, tmpa);
			tmpb = min(base, tmpb);
			free(mem1 - offset);
			free(mem2 - offset);
		}
		diff += tmpa - tmpb;
	}
	printf("\nrelative ticks: %li\n", diff);

	ptr = malloc(len + padding + offset) + offset;

	diff = 0;
	printf("\n\nbzero(%i):\n", len);
	memset(ptr - offset, 1, len + padding + offset);
	TESTITER(bzero, diff, iter, ptr, len);
	print_mem(ptr - offset, len + padding + offset);
	printf("solved in %li ticks\n", diff);
	
	diff = 0;
	printf("\n\nft_bzero(%i):\n", len);
	memset(ptr - offset, 1, len + padding + offset);
	TESTITER(ft_bzero, diff, iter, ptr, len);
	print_mem(ptr - offset, len + padding + offset);
	printf("solved in %li ticks\n", diff);

	len = 0;
	printf("\n\nft_bzero(%i):\n", len);
	TESTITER(ft_bzero, diff, iter, ptr, len);
	printf("solved in %li ticks\n", diff);

	printf("\n\nbzero(%i):\n", len);
	TESTITER(bzero, diff, iter, ptr, len);
	printf("solved in %li ticks\n", diff);

	const char *lolo = "Montpellier, first mentioned in a document of 985, was founded under a local feudal dynasty, the Guilhem, who combined two hamlets and built a castle and walls around the united settlement. The two surviving towers of the city walls, the Tour des Pins and the Tour de la Babotte, were built later, around the year 1200.\n";
	char *test = ft_strdup(lolo);
	printf("%s", test);
	free(test);
	free(ptr - offset);
	int fd = ac > 1 ? open(av[1], O_RDONLY) : 0;
	ft_cat(fd);
	close(fd);
}
