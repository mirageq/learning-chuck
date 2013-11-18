//Assignment_3_StereoDorian

//Sound network
SndBuf mySounds =>Pan2 x => dac; //Sound Buffer
SinOsc s => Pan2 p => dac; //Oscillator

//dac => Gain g => WvOut w => blackhole;

//"foo.wav" => string myOutput;
// myOutput => w.wavFilename;

//<<<"writing to file:", "'"+w.myOutput()+"'">>>;

//Dorian scale MIDI value arrays
[ 50, 52, 53, 55, 57, 59, 60, 62] @=> int A[];
[62, 64, 65, 67, 69, 71, 72, 74] @=> int B[];
[62, 52, 65, 55, 69, 59, 72, 62] @=> int C[];
[50, 64, 53, 67, 57, 71, 60, 74] @=> int D[];

string fileNames[3];
//Define file paths
me.dir() + "/audio/snare_01.wav" => fileNames[0]; 
me.dir() + "/audio/hihat_04.wav" => fileNames[1];
me.dir() + "/audio/kick_02.wav" => fileNames[2];

//Dorian scale in normal octave
for ( 0 => int i; i < 8; i++)
{
    Std.mtof(A[i]) => s.freq;
    0.7 => s.gain;
    .25 :: second => now;
} 

//Dorian scale in higher octave

for ( 0 => int i; i < 8; i++)
{
    Std.mtof(B[i]) => s.freq;
    0.7 => s.gain;
    .25 :: second => now;
} 


//Mixed up octaves
for ( 0 => int i; i < 8; i++)
{
    Std.mtof(D[i]) => s.freq;
    0.7 => s.gain;
    Math.random2f (-1.0, 1.0) => x.pan; //set panning

    .25 :: second => now;
} 

0 => s.gain;
0 => int counter; //counter variable

while(counter < 7)
{
    
    for ( 0 => int i; i < 8; i++)
    
    {
        Math.random2 (0, 7) => int j;
        Std.mtof(D[j]) => s.freq;
        0.7 => s.gain;
        
        Math.random2(0,2) => int which;
        fileNames[which] => mySounds.read; //Read Sound Buffer
        Math.random2f (-1.0, 1.0) => p.pan; //Oscillator Panning

    Math.random2f (-1.0, 1.0) => x.pan; // SndBuf panning

        .25 :: second => now;
    } 
    
    counter++;
    
}

0 => int flag; // This variable is used specifically to perform modulo operations


while (counter < 38)
{
    Math.random2(0,6) => flag;
    flag % 6 => int beat; //Modulo
    
    if((beat == 0) || (beat == 3)) //Using modulo results
    {
                   fileNames[0] => mySounds.read;

           0 => mySounds.pos;
           1.0 => mySounds.rate;

        Math.random2f (-1.0, 1.0) => p.pan;

        1.5 => mySounds.gain;
    }     
        

        
        if((beat == 1))
        {
             fileNames [1] => mySounds.read;

             0 => mySounds.pos;
             1.0 => mySounds.rate;
            Math.random2f (-1.0, 1.0) => p.pan;

            0.35 => mySounds.gain;

          }
    
    if((beat == 2) || (beat == 5) || (beat == 4))
    {
                fileNames [2] => mySounds.read;

        mySounds.samples() => mySounds.pos; //Reverse Sound
        -3.0 => mySounds.rate; //Set negative rate
        Math.random2f (-1.0, 1.0) => p.pan;

        1.5 => mySounds.gain;    
    }
    
    for ( 0 => int i; i< 7; i++)
    {
        
        Math.random2( 0, 7) => int j;
        Std.mtof(C[j]) => s. freq;
        0.7 => s.gain;
    } 
        .25::second => now;
    
    
 counter++;   
}


// Fade Out sequence

0.7 => float k;

for ( 38 => counter; counter < 48; counter++)
{
    for ( 0 => int i; i< 7; i++)
    {
        Math.random2( 0, 7) => int j;
        Std.mtof(D[j]) => s. freq;
                
    } 
    k - 0.15 => k; //reduce gain for fade out
        k => s.gain; 
        
    .25::second => now;

}
    
