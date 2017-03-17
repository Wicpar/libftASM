/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libfts.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fnieto <fnieto@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/11/25 14:16:24 by fnieto            #+#    #+#             */
/*   Updated: 2017/03/17 18:09:59 by fnieto           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTS_H
# define LIBFTS_H
# include <string.h>

void		ft_bzero(void *ptr, size_t len);
int			ft_isalnum(int c);
int			ft_isalpha(int c);
int			ft_isascii(int c);
int			ft_isdigit(int c);
int			ft_isprint(int c);
void		*ft_memset(void *ptr, int c, size_t len);
void		*ft_memcpy(void *dest, void *src, size_t len);
char		*ft_strcat(char *dest, const char *src);
int			ft_strlen(const char *str);
int			ft_puts(const char *str);
char		*ft_strdup(const char *str);
void		ft_cat(int fd);

#endif
