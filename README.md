# minBalenaPisound
# Minimal Dockerfile to install pysound into Rpi using Balena

## have a Rpi Online in the Balena fleets

val@pop-os:~/balenaFiles/bal-1/pisound$ balena fleets

     Id      App name Slug           Device type     Device count Online devices 
 
     ─────── ──────── ────────────── ─────────────── ──────────── ────────────── 
 
     1524057 hydro_0  vveirs/hydro_0 raspberrypi4-64 1            0              
 
     2054214 val-one  vveirs/val-one raspberrypi4-64 1            1  
 
# run balena push val-one
 
## output is in the errorDump.txt file in this repository

The Dockerfile runs ok now until line 327 when it finds broken packages
     I am wondering if pisound is using 32 bit instead of 64 bit architecture
