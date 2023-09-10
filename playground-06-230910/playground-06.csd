<Cabbage>
form caption("Untitled") size(400, 300), guiMode("queue"), pluginId("def1")
keyboard bounds(8, 158, 381, 95)
rslider bounds(16, 16, 60, 60) channel("cutoff") range(1, 20000, 1000, 1, 0.001) text("Cutoff")
rslider bounds(80, 16, 60, 60) channel("resonance") range(0, 1, 0.5, 1, 0.001) text("Resonance")
rslider bounds(16, 80, 60, 60) channel("attack") range(0, 1, 0.1, 1, 0.001) text("Attack")
rslider bounds(80, 80, 60, 60) channel("release") range(0, 1, 0.1, 1, 0.001) text("Release")
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>

<CsInstruments>
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1
    kCutoff chnget "cutoff" 
    kResonance chnget "resonance"
    iAttack chnget "attack"
    iRelease chnget "release"

    kEnv madsr .1, .2, .6, .4
    kFilterEnv madsr iAttack, 0, 1, iRelease
    aOsc vco2 p5 * kEnv, p4
    aFilter moogladder aOsc, kCutoff + (kCutoff * kFilterEnv), kResonance
    
    outs aFilter, aFilter
endin

</CsInstruments>

<CsScore>
f0 z
</CsScore>
</CsoundSynthesizer>
