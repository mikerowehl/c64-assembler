c64-assembler
=============

In an old book I ran across recently I found a printout and some notes about
an assembler I was working on, written in CBM basic for the C64 I had at the
time. So I grabbed a copy of [VICE](http://www.viceteam.org/), an emulator
for commodore systems that works great on OS X, and got it working.

So after 30 years, here it is. Kinda surreal.

I've been using the petcat command from VICE to turn the assembler.bas file 
into a .prg I can load into them emulator:

```
petcat -w2 -o assembler.prg assembler.bas
```

Then you can go into the emulator and "Smart attach Disk/Tape" and point it
at the assembler.prg file.

It's nothing special, I don't expect anyone to use it. I just felt compelled
to get it working once I found it.
