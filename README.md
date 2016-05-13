Panicked evacuation simulation
==============================
README  13/MAY/2016

------------------------------
WHAT DOES THIS DO
------------------------------

The original program simulated a moshpit by considering it to be a free particle gas governed by a Maxwell-Boltzmann distribution.
This version adds an extra term to simulate a panicked motion towards a door (to simulate an evacuation).



------------------------------
CHANGES MADE TO THE ORIGINAL PROGRAM
------------------------------

The work done here expands https://github.com/mattbierbaum/moshpits

The main change was adding the extra force term in line (~L351/2)
We also change boundary conditions to aperiodic (~L96)
Then, the door condition was added (~L395)
It was also necessary to count the live particles (~L178) to end the simulation



------------------------------
USAGE
------------------------------
Compile with:		make 
Run with:		./entbody

The main.c file contains all the code necessary to run the simulation. 
Other files serve to create the plots (velocity, temperature, etc) 

You can also run it with 
arguments:			./entbody [alpha] [eta] [seed]	



------------------------------
FUTURE WORK
------------------------------

-Different room geometries;
-Random initial particle distribution (as opposed to centered);
-Different door positions (as well as the number of doors);
-Deeper study of the effects of each term;
-Maximum flow through the door; 
-Critical pressure point;
-Different types of individuals (i.e. different maximum speed): 
	-low mobility (child/elderly), 
	-normal mobility (adult), 
	-high mobility (panicked individual).


------------------------------------------------------------------------------------------
ORIGINAL README
------------------------------------------------------------------------------------------

Collective motion at heavy metal concerts
=========================================

A simple n-body code to simulate a 2D set of particles
using a cell neighbor locator. 
Uses OpenGL for display capabilities and is reasonably fast.

There are options in the Makefile so that it works easily
with other systems (edit as necessary):
 - DOPLOT - display with opengl
 - FPS    - calculate frames per second (not portable, POSIX only)
 - POINTS - make the opengl display points, not fancy circles (a speed issue)
 - IMAGES - use OpenIL to save screen shots to disk

To compile, simply `make`.

There are several dependencies required to use all features:
 - freeglut - used for simple OpenGL bindings.  This is different than regular glut and not compatible.
 - OpenIL - open image library used to save screenshots to various image formats.

To install these on a debian system, use the command:

    sudo apt-get install freeglut3-dev libdevil-dev    

There are helper scripts which generate several of the plots in the paper. 
They are written in Python and located in the scripts directory.  Each one
requires different files to be present in order to run.  
To make the plots you can go to the scripts directory and run:

    python utilities.py all

or you can run each individually after reading the `utilities.py` file.
If you prefer to launch the phase diagram creation across many machines, edit the hostlist
file and then launch `hostlist_launch`.  

Check out the related project at <a href="http://github.com/mattbierbaum/moshpits.js">Moshpits.js</a>
