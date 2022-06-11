#include <stdio.h>


FLAG = "LHX@b\vNd\017I\bd\\\bOO\nU\\dOS\bdS\017U\\d\v]dosrh\032F"

void encode(char *input)

{
  size_t sVar1;
  char result;
  int i;
  
  i = 0;
  while( true ) {
    sVar1 = strlen(input);
    if (sVar1 <= (ulong)(long)i) break;
    putchar((int)(char)(input[i] ^ 0x3b));
    i = i + 1;
  }
  return;
}