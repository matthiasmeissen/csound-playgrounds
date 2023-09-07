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

instr myInstrument    

    // Get input from the score and store as variable
    iMidiStart = p4
    iMidiEnd = p5
    
    // Use p6 from the first instrument call to change the variables
    iCount = p6

    // Create a linear segment for amplitude and midi notes
    kAmpseg = linseg:k(-10, random:i(0, 1), -20)
    kMidiseg = linseg:k(iMidiStart, random:i(0, 1), iMidiEnd)

    // Convert amplitude to db and midi to frequency
    kAmp = ampdb:k(kAmpseg)
    kFreq = mtof:k(kMidiseg)
    
    // Create two sine oscillators
    aSine1 = poscil:a(kAmp, kFreq)
    aSine2 = poscil:a(kAmp, kFreq * random:i(1, 4))
    
    // Create a fade out for the oscillators and add to channels
    aOut1 = linen:a(aSine1, 0, p3, 0.2)
    aOut2 = linen:a(aSine2, 0, p3, 0.2)
    out(aOut1, aOut2)
    
    if (iCount < 10) then
    	schedule("myInstrument", p3 + 1, p3, 60, 68, p6 + 1)
    endif
    
endin

schedule("myInstrument", 0, 1, 60, 68, 0)

</CsInstruments>
	e 20
<CsScore>
	
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
