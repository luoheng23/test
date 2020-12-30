#include <iostream>
using namespace std;


// do nothing
void Loop()
{
    int count = 0;
    for(; count < 200000000; ++count);
}

// call Loop inside
void Loop1()
{
    int count = 0;
    for(; count < 600000000; ++count);

    Loop();
}

void Loop2()
{
    int count = 0;
    for(; count < 200000000; ++count);
}

int main()
{
    Loop1();
    Loop2();
    Loop2();

    return 0;
}