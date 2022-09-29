#include "ft_boolean.h"

void	ft_putstr(char *str)
{
	while (*str)
		write(1, str++, 1);
}

t_bool	ft_is_even(int nbr)
{
	if (EVEN(nbr))
		return (TRUE);
	else
		return (FALSE);
}

int	main()
{
	if (ft_is_even(3) == TRUE)
		ft_putstr(EVEN_MSG);
	if (ft_is_even(2) == FALSE)
		ft_putstr(ODD_MSG);

	return (SUCCESS);
}
