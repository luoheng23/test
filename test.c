#include <stdio.h>
#include <string.h>


int main ()
{
   char str1[10];
   char str2[10];
   printf("输入第一个字符串：\n");
   scanf("%s", str1);
   printf("输入第二个字符串：\n");
   scanf("%s", str2);

   int i;
   i=strcmp(str1,str2);
   if(0==i){
     printf("两个字符串完全相同" );
   }
   else  printf("两个字符串不相同" );

   return 0;
}