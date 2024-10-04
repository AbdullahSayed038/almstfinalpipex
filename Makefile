CC		:= cc

CFLAGS	:= -Wall -Werror -Wextra

SRC		:= src/

SRCS	:= $(SRC)pipex.c $(SRC)fork.c $(SRC)handle.c $(SRC)utils.c

BONUS_SRCS := $(SRC)pipex_bonus.c $(SRC)fork.c $(SRC)handle.c $(SRC)utils.c $(SRC)here_doc.c

OBJS	:= $(SRCS:.c=.o)

BONUS_OBJS := $(BONUS_SRCS:.c=.o)

LIBFT_DIR = src/libft/

LIBFT = $(LIBFT_DIR)libft.a

NAME	:= pipex
BONUS_NAME := pipex_bonus

all			:	print_art $(NAME)

$(SRC)%.o		:	$(SRC)%.c
	@$(CC) $(CFLAGS) -c $< -o $@

$(LIBFT):
	@make -C $(LIBFT_DIR)

$(NAME)	:	$(OBJS) $(LIBFT)
	@$(CC) $(CFLAGS) $(LIBFT) $^ -o $@

$(BONUS_NAME):	$(BONUS_OBJS) $(LIBFT)
	@$(CC) $(CFLAGS) $(LIBFT) $^ -o $@
	@mv $(BONUS_NAME) $(NAME)

bonus		:	print_art
	@rm -f $(NAME)
	@$(MAKE) $(BONUS_NAME)

clean		:
	@rm -f $(OBJS) $(BONUS_OBJS)
	@make -C $(LIBFT_DIR) clean

fclean		:	clean
	@rm -f $(NAME) $(BONUS_NAME)
	@make -C $(LIBFT_DIR) fclean

re			:	fclean all

print_art	:
	@echo "                                                      "
	@echo "       ███████████                 ██████████        "
	@echo "    ████          ███            ███         ███     "
	@echo "   ██               ██         ██              ██    "
	@echo "  ██    █████████    ██       ██    ████████    ██   "
	@echo "  ██   ██       ██    ██     ██   ███       ██   ██  "
	@echo " ██   ██          █    ████████   █          █    ██ "
	@echo " ██   ██        ███               ███        █    ██ "
	@echo "  █    ██    ████████                ██     ██    █  "
	@echo "  ██    ████████████████     ████████████████    ██  "
	@echo "   ██     ████   ████  ██  ███   ███   ███      ██   "
	@echo "     ███  ██     ███     ███    ████    ███   ██     "
	@echo "        ████     ███     ███    ████     ████        "
	@echo "        ████    █████    ███    █████    ███         "
	@echo "        ██ ██   █████   ████    █████   ██ █         "
	@echo "        █   ██  ████   ██   ██  ████  ███  ██        "
	@echo "        ██    █████████       █████████    ██        "
	@echo "        ████████████████████████████████████         "
	@echo "         ██  ██ █    ███     ██     █ █   ██         "
	@echo "          ████  █   █  █     ███   █   ██ █          "
	@echo "           ██   ██ ██  ██   █  ██ ██    ██           "
	@echo "            ███  █ █    ██ ██   ████   ██            "
	@echo "              ██ ██      █ █    ███  ██              "
	@echo "                ████     ███     ████                "
	@echo "                    █████████████                    "
	@echo "                                                     "


PHONY: all clean fclean re print_art bonus