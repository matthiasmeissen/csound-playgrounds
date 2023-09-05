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
    kAmp = linseg:k(0.4, 0.5, 0.2)
    kFreq = linseg:k(400, 0.3, 500)
    aSine = poscil:a(kAmp, kFreq)
    aOut = linen:a(aSine, 0, p3, 1)
    outall(aOut)
endin

</CsInstruments>

<CsScore>
i "myInstrument" 0 2
</CsScore>
</CsoundSynthesizer>