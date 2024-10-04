/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipex.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abdsayed <abdsayed@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/04 17:45:57 by abdsayed          #+#    #+#             */
/*   Updated: 2024/10/04 18:55:29 by abdsayed         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

void	forking(t_pipex *pipex)
{
	firstfork(pipex);
	pipex->i = 3;
	lastfork(pipex);
	close(pipex->pipes[0]);
	close(pipex->pipes[1]);
	return ;
}

int	main(int ac, char **av, char **env)
{
	t_pipex	pipex;

	initialize(&pipex, av, env);
	if (ac != 5)
		exitfree("Error Invalid Number of Arguments", &pipex, 1);
	pipex.path = get_path_variable(env);
	if (pipex.path == NULL)
		pipex.bole = 1;
	forking(&pipex);
	waitpid(pipex.pid1, NULL, 0) ;
	waitpid(pipex.pid2, NULL, 0);
	exitfree(NULL, &pipex, 0);
	return (0);
}
