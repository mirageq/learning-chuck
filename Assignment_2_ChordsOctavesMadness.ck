//Assignment_2_ChordsOctavesMadness.ck

//Oscillators
SawOsc sawAsc => dac.right;
SawOsc sawDesc => dac.left;
SinOsc s => Pan2 p => dac;
//Initial freq and gain
0.7 => float onGain;
0.0 => float offGain;
1.0 => float panPosition;
0 => s.gain;

[50, 52, 53, 55, 57, 59, 60, 62] @=> int A[]; //normal octave
[62, 64, 65, 67, 69, 71, 72, 74] @=> int B[]; //higher octave
[38, 40, 41, 43, 45, 47, 48, 50] @=> int C[]; //lower than normal octave

//Hard panning
for (0 => int i; i< 8; i++)
{
    Std.mtof(A[i]) => sawAsc.freq;
    onGain => sawAsc.gain;
    offGain => sawDesc.gain;
    0.25 ::second => now;
    offGain => sawAsc.gain;
    0.017 :: second => now;
}

for ( 7 => int i; i >= 0; i--)
{
    Std.mtof(A[i]) => sawDesc.freq;
    onGain => sawDesc.gain;
    0.25 ::second => now;
    offGain => sawDesc.gain;
    0.017 :: second => now;
}


//Position panning
    0.4 => s.gain;
    panPosition => p.pan;
    <<<panPosition>>>;
    panPosition - .01 => panPosition;

    for (0 => int i; i< 8; i++)
    {
      
Std.mtof(A[i]) => s.freq;
                onGain => s.gain;
        0.25 ::second => now;
        offGain => s.gain;
        0.017 :: second =>now;
            panPosition - .01 => panPosition;
            
Math.random2f (-1.0, 1.0) => p.pan;
 }  
 
 
 panPosition => p.pan;  


for ( 7 => int i; i >= 0; i--)
{
    Std.mtof(A[i]) => s.freq;

    onGain => s.gain;
    0.25 ::second => now;
    offGain => s.gain;
 
    0.017 :: second => now;
    Math.random2f (-1.0, 1.0) => p.pan;

    
}


//B array - higher octave

//Hard Panning
//Ascent
for (0 => int i; i< 8; i++)
{
    Std.mtof(B[i]) => sawAsc.freq;
    onGain => sawAsc.gain;
    offGain => sawDesc.gain;
    0.25 ::second => now;
    offGain => sawAsc.gain;
    0.017 :: second => now;
}

//Descent
for ( 7 => int i; i >= 0; i--)
{
    Std.mtof(B[i]) => sawDesc.freq;
    onGain => sawDesc.gain;
    0.25 ::second => now;
    offGain => sawDesc.gain;
    0.017 :: second => now;
}


// Position Panning
//Ascent
0.4 => s.gain;
panPosition => p.pan;
<<<panPosition>>>;
panPosition - .01 => panPosition;

for (0 => int i; i< 8; i++)
{
    
    Std.mtof(B[i]) => s.freq;
    onGain => s.gain;
    0.25 ::second => now;
    offGain => s.gain;
    0.017 :: second =>now;
    panPosition - .01 => panPosition;
    
    Math.random2f (-1.0, 1.0) => p.pan;
}  

//Descent
panPosition => p.pan;  


for ( 7 => int i; i >= 0; i--)
{
    Std.mtof(B[i]) => s.freq;
    
    onGain => s.gain;
    0.25 ::second => now;
    offGain => s.gain;
    
    0.017 :: second => now;
    Math.random2f (-1.0, 1.0) => p.pan;
    
    
}

// C Array - Lower Octave
//Hard pan
//Ascent
for (0 => int i; i< 8; i++)
{
    Std.mtof(C[i]) => sawAsc.freq;
    onGain => sawAsc.gain;
    offGain => sawDesc.gain;
    0.25 ::second => now;
    offGain => sawAsc.gain;
    0.017 :: second => now;
}
//Descent
for ( 7 => int i; i >= 0; i--)
{
    Std.mtof(C[i]) => sawDesc.freq;
    onGain => sawDesc.gain;
    0.25 ::second => now;
    offGain => sawDesc.gain;
    0.017 :: second => now;
}


//position panning
//Ascent
0.4 => s.gain;
panPosition => p.pan;
<<<panPosition>>>;
panPosition - .01 => panPosition;

for (0 => int i; i< 8; i++)
{
    
    Std.mtof(C[i]) => s.freq;
    onGain => s.gain;
    0.25 ::second => now;
    offGain => s.gain;
    0.017 :: second =>now;
    panPosition - .01 => panPosition;
    
    Math.random2f (-1.0, 1.0) => p.pan;
}  

//Descent
panPosition => p.pan;  


for ( 7 => int i; i >= 0; i--)
{
    Std.mtof(C[i]) => s.freq;
    
    onGain => s.gain;
    0.25 ::second => now;
    offGain => s.gain;
    
    0.017 :: second => now;
    Math.random2f (-1.0, 1.0) => p.pan;
    
    
}

//All Octaves together. Both hard pan and position pan

//Ascent
for (0 => int i; i< 8; i++)
{
    
    Std.mtof(C[i]) => s.freq;
    Std.mtof(B[i]) => sawAsc.freq;
        Std.mtof(A[i]) => sawDesc.freq;

    
    onGain => s.gain;
    onGain => sawAsc.gain;
    onGain => sawDesc.gain;
    0.25 ::second => now;
    offGain => s.gain;
    offGain =>sawAsc.gain;
    offGain => sawDesc.gain;
    0.017 :: second =>now;
    
}  
//Descent
for ( 7 => int i; i >= 0; i--)
{
    Std.mtof(C[i]) => s.freq;
    Std.mtof(B[i]) => sawAsc.freq;
        Std.mtof(A[i]) => sawDesc.freq;

    
    onGain => s.gain;
    onGain => sawAsc.gain;
    onGain => sawDesc.gain;
    0.25 ::second => now;
    offGain => s.gain;
    offGain =>sawAsc.gain;
    offGain => sawDesc.gain;
    
    0.017 :: second =>now;
    
}

//Fadeout
Std.mtof(C[0]) => s.freq;
Std.mtof(B[0]) => sawAsc.freq;
Std.mtof(A[0]) => sawDesc.freq;
        0.6 => s.gain;
        0.6 => sawAsc.gain;
        0.6 => sawDesc.gain;
        

0.2::second => now;
0.4 => s.gain;
0.4 => sawAsc.gain;
0.4 => sawDesc.gain;
      
0.2::second => now;
0.1 => s.gain;
0.1 => sawAsc.gain;
0.1 => sawDesc.gain;
0.1::second => now;
       
 
        
        




