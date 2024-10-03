#include <unistd.h>
#include <string.h>
#include <stdlib.h>

int main ()
{

	write(1, "MOTHER WOULDST THOU\n", strlen("MOTHER WOULDST THOU\n"));
	write(2, "LORD SANCTION ONE IN SO BEREFT OF LIGHT\n", strlen("LORD SANCTION ONE IN SO BEREFT OF LIGHT\n"));
	exit(666);
	//printf(%s, (char *)777); // SIGSEGV, exit code 139

}

