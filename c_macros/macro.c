#include<stdio.h>

#define MAX_SIZE 10
#define SWAP(a,b)({a ^= b; b ^= a; a ^= b;})
#define SQARE(x) (x*x)
#define TRACE_LOG(msg) write_log(TRACE_LEVEL, msg)

int main(void)
{
  int size = 0;
  size = size = MAX_SIZE;
  printf("The value of size is [%d]\n", size);

  int three = 3;
  int five = 5;

  SWAP(three, five);

  printf(three);
  printf(five);

  return 0;
}
