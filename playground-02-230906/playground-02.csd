<CsoundSynthesizer>
<CsOptions>
-n -d 
</CsOptions>

<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr myInstrument    

    // Get input from the score and store as variable
    iMidiStart = p4
    iMidiEnd = p5

    // Create a linear segment for amplitude and midi notes
    kAmpseg = linseg:k(-10, 0.5, -20)
    kMidiseg = linseg:k(iMidiStart, 0.5, iMidiEnd)

    // Convert amplitude to db and midi to frequency
    kAmp = ampdb:k(kAmpseg)
    kFreq = mtof:k(kMidiseg)
    
    // Create two sine oscillators
    aSine1 = poscil:a(kAmp, kFreq)
    aSine2 = poscil:a(kAmp, 400)
    
    // Create a fade out for the oscillators and add to channels
    aOut1 = linen:a(aSine1, 0, p3, 0.2)
    aOut2 = linen:a(aSine2, 0, p3, 0.2)
    out(aOut1, aOut2)
    
endin

</CsInstruments>

<CsScore>
i "myInstrument" 0 2 62 68
</CsScore>
</CsoundSynthesizer>