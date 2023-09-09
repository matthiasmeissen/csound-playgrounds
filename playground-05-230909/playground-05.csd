<Cabbage> bounds(0, 0, 0, 0)
form caption("Untitled") size(400, 300), guiMode("queue"), pluginId("def1")
keyboard bounds(8, 158, 381, 95)
rslider bounds(16, 16, 60, 60) channel("freq") range(1, 1000, 800, 1, 0.001) text("Frequency") textColour(0, 0, 0, 255)
rslider bounds(80, 16, 60, 60) channel("cutoff") range(0, 1, 0.4, 1, 0.001) text("Cutoff") textColour(0, 0, 0, 255)
rslider bounds(216, 16, 60, 60) channel("lfo") range(0, 10, 4, 1, 0.25) text("LFO") textColour(0, 0, 0, 255)
rslider bounds(280, 16, 60, 60) channel("intensity") range(0, 2, 1, 1, 0.001) text("Intensity") textColour(0, 0, 0, 255)
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-o dac -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>

<CsInstruments>
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1
    kFreq chnget "freq"
    kCutoff chnget "cutoff"
    kLfoSpeed chnget "lfo"
    kIntensity chnget "intensity"
    
    kLfo lfo kIntensity, kLfoSpeed, 5
    
    kEnv madsr .1, .2, .6, .4
    aOsc vco2 p5 * kEnv, p4
    
    aFilter moogladder aOsc, kFreq * kLfo, kCutoff
    
    outs aFilter, aFilter
endin

</CsInstruments>

<CsScore>
f0 z
</CsScore>
</CsoundSynthesizer>
