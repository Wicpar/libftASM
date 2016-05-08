/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fnieto <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/05/06 00:11:31 by fnieto            #+#    #+#             */
/*   Updated: 2016/05/08 22:32:45 by fnieto           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libc.h>
#include "libfts.h"

int		main(int ac, char **av)
{
	char	*ptr;
	int		len;
	int		i;
	struct timeval timea;
	struct timeval timeb;
	long	diff;

	len = 2000;
	ptr = malloc(len);
	printf("ft_bzero(2000):\nbefore:\n");
	i = -1;
	memset(ptr, 1, len);
	while (++i < len)
		printf("%i ", ptr[i]);
	printf("\nafter:\n");
	i = -1;
	gettimeofday(&timea, 0);
	while (++i < 1000000)
		ft_bzero(ptr, len);
	gettimeofday(&timeb, 0);
	diff = ((timeb.tv_usec + timeb.tv_sec * 1e6) -
		(timea.tv_usec + timea.tv_sec * 1e6));
	i = -1;
	while (++i < len)
		printf("%i ", ptr[i]);
	free(ptr);
	printf("\nsolved in %lf s\n", diff / 1000000.);

	ptr = malloc(len);
	printf("ft_bzero(2000):\nbefore:\n");
	i = -1;
	memset(ptr, 1, len);
	while (++i < len)
		printf("%i ", ptr[i]);
	printf("\nafter:\n");
	i = -1;
	gettimeofday(&timea, 0);
	while (++i < 1000000)
		bzero(ptr, len);
	gettimeofday(&timeb, 0);
	diff = ((timeb.tv_usec + timeb.tv_sec * 1e6) -
		(timea.tv_usec + timea.tv_sec * 1e6));
	i = -1;
	while (++i < len)
		printf("%i ", ptr[i]);
	free(ptr);
	printf("\nsolved in %lf s\n", diff / 1000000.);

	len = 0;
	ptr = malloc(len);
	printf("ft_bzero(0):\nbefore:\n");
	i = -1;
	while (++i < len)
		printf("%i ", ptr[i]);
	printf("\nafter:\n");
	i = -1;
	gettimeofday(&timea, 0);
	while (++i < 1000000)
		ft_bzero(ptr, len);
	gettimeofday(&timeb, 0);
	diff = ((timeb.tv_usec + timeb.tv_sec * 1e6) -
		(timea.tv_usec + timea.tv_sec * 1e6));
	i = -1;
	while (++i < len)
		printf("%i ", ptr[i]);
	free(ptr);
	printf("\nsolved in %lf s\n", diff / 1000000.);

	len = 10;
	ptr = malloc(len);
	printf("ft_bzero(null):\nbefore:\n");
	i = -1;
	while (++i < len)
		printf("%i ", ptr[i]);
	printf("\nafter:\n");
	i = -1;
	gettimeofday(&timea, 0);
	while (++i < 1000000)
		ft_bzero(0, len);
	gettimeofday(&timeb, 0);
	diff = ((timeb.tv_usec + timeb.tv_sec * 1e6) -
		(timea.tv_usec + timea.tv_sec * 1e6));
	i = -1;
	while (++i < len)
		printf("%i ", ptr[i]);
	free(ptr);
	printf("\nsolved in %lf s\n", diff / 1000000.);

	len = 10;
	ptr = malloc(len);
	printf("ft_strcat(\"\", \"aaa\"):\nbefore:\n");
	i = -1;
	ptr[0] = 0;
	strcpy(ptr, "ba");
	while (++i < len)
		printf("%i ", ptr[i]);
	printf("\nafter:\n");
	i = -1;
	gettimeofday(&timea, 0);
	while (++i < 1000000)
	{
		ptr[2] = 0;
		ft_strcat(ptr, "cba0123");
	}
	gettimeofday(&timeb, 0);
	diff = ((timeb.tv_usec + timeb.tv_sec * 1e6) -
		(timea.tv_usec + timea.tv_sec * 1e6));
	i = -1;
	while (++i < len)
		printf("%i ", ptr[i]);
	printf("\n%s\n", ptr);
	free(ptr);
	printf("solved in %lf s\n", diff / 1000000.);

}
