SRC		=	memcpy.asm 	\
			memset.asm 	\
			rindex.asm  \
			strchr.asm  \
			strcmp.asm 	\
			strlen.asm  \
			strncmp.asm \
			strstr.asm  \
			strpbrk.asm \
			strcspn.asm \


ASM_OBJ	=	$(SRC:.asm=.o)

NAME	=	libasm.so

FLAGS	=	ld -shared

CFLAGS	=	-f elf64

NASM	=	nasm

CC		=	gcc

all: $(NAME)

$(NAME): $(ASM_OBJ)
	$(FLAGS) $(ASM_OBJ) -o $(NAME)

%.o:	%.asm
		nasm -f elf64 $< -o $@

clean:
	rm -f *.gcda
	rm -f *.gcno
	rm -f $(COV_FILE)
	rm -f $(OBJ)

fclean:	clean
	rm -f $(NAME)
	rm -f $(UNIT_TEST)

re: fclean all

.PHONY: re clean fclean all
