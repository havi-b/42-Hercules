/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   eurystheus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: havi <havi@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/22 18:52:58 by hbhuiyan          #+#    #+#             */
/*   Updated: 2019/04/22 23:10:51 by havi             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

// #include <stdio.h>
// #include <unistd.h>

// int main()
// {
//     while (1)
//     {
//         fork(2);
//         printf("Another Mare Released!");
//     }
// }


#include <stdio.h>
#include <string.h>
#include <unistd.h>

int        main(int argc, char **argv)
{
	while (1)
	{
		sleep(2);
		fork();
		printf("Another Mare Released!\n");
	}
	return (0);
}