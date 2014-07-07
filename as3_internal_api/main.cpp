#include <AS3\AS3.h>

// Used to avoid '"__asm__" is undefined' error in Visual Studio.
#ifdef _MSC_VER
#define __asm__
#endif

int main(void)
{
	AS3_GoAsync();
	return(0);
}