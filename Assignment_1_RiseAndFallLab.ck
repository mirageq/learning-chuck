<<<"Assignment_1_RiseAndFallLab">>>;

//Sound Network
SinOsc sin => dac;
SqrOsc sqr => dac;
TriOsc tri => dac;

//Only play sin
//Set volumes
0.5 => sin.gain;
0 => sqr.gain;
0 => tri.gain;

for ( 0=>int i; i<1000; i++)
{
    i => sin.freq;
    0.005::second =>now;
}

for ( 1000 => int i; i>0; i--)
{
    i => sin.freq;
    0.005::second =>now;
}
    

//Only play sqr
//Set volumes
0 => sin.gain;
0.2 => sqr.gain;
0 => tri.gain;

for ( 0 => int i; i<1000; i++)
{
    i => sqr.freq;
    0.004::second =>now;
}
for ( 1000 => int i; i>0; i--)
{
    i => sqr.freq;
    0.005::second =>now;
}
    

//Only play tri
//Set volumes
0 => sin.gain;
0 => sqr.gain;
0.4 => tri.gain;

0 => int i;


for ( 0 => int i; i<1000; i++)
{
    i => tri.freq;
    0.005::second =>now;
} 
for ( 1000 => int i; i>0; i--)
{
    i => tri.freq;
    0.005::second =>now;
}

//play sin & sqr
//set volumes
0.5 => sin.gain;
0.2 => sqr.gain;
0 => tri.gain;
for (0 => int i; i< 1000; i++)
{
    i => sqr.freq;
    i*2 => sin.freq;   
    0.002::second => now;
}

//play sqr & tri
//set volumes
0 => sin.gain;
0.2 => sqr.gain;
0.3 => tri.gain;
for (0 => int i; i< 1000; i++)
{
    i => sqr.freq;
    i*2 => tri.freq;   
    0.002::second => now;
}

//play tri & sin
//set volumes
0.5 => sin.gain;
0=> sqr.gain;
0.3 => tri.gain;
for (0 => int i; i< 1000; i++)
{
    i => tri.freq;
    i*2 => sin.freq;   
    0.002::second => now;
}


//play sin, sqr and tri all together
//set volumes
0.5 => sin.gain;
0.2 => sqr.gain;
0.1 => tri.gain;

now + 4::second => time later;

//play upward or downward sounds based on random number generated.
//This is chance-based, more like a game.

while (now<later)
{

Math.random2f(0,100) =>float rand;

    if(rand < 50.0) //if the random number is less than 50.0, play upward sounds, which means: increase frequencies
    {
        for (0 => int i; i< 500; i++)
        {
            i => sqr.freq;
            i*2 => sin.freq;
            i*3 => tri.freq;
            
            0.001::second => now;
        }
    }
    
    else //if the random number is greater than 50.0, play downward sounds, which means: decrease frequencies

    {
        for (500 => int i; i>0; i--)
        {
            i => sqr.freq;
            i/2 => sin.freq;
            i/3 => tri.freq;
            
            0.001::second => now;
        }
    }
}


        
   

