/*-----------------------------------------------------
 File Name : 1.c
 Purpose :
 Creation Date : 14-03-2017
 Last Modified : Tue Mar 14 20:12:13 2017
 Created By : Jeasine Ma [jeasinema[at]gmail[dot]com]
-----------------------------------------------------*/
#include <cstdio>

int main() 
{
    unsigned short i=65535, j=98;
    unsigned short k = j-i;
    short k1 = k;
    printf("%d %d", k, k1);
}
