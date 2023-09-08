<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
nchnls_i = 1
0dbfs = 1
seed(0)


instr init1
    // Initialize Intruments
    schedule("inst1", 0, 1, 60, 68)
    schedule("inst1", 0, 0.2, 54, 62)
endin

instr inst1
    // Note Value Inputs
    iLowNote = p4
    iHighNote = p5

    // Create random Notes
    kNote = random(iLowNote, iHighNote)
    kFreq = mtof(kNote)

    // Create envelope
    aEnv = linen(1, p3 * 0.1, p3, p3 * 0.1)
    
    // Create osicllator
    aSig1 = vco2(0.2, kFreq)
    aSig2 = vco2(0.2, kFreq * 2)
    
    aOutL = aEnv * aSig1
    aOutR = aEnv * aSig2
    
    out(aOutL, aOutR)
    
    schedule("inst1", p3, 1, iLowNote, iHighNote)
endin

schedule("init1", 0, 0)

</CsInstruments>

<CsScore>
    e 20
</CsScore>
</CsoundSynthesizer>