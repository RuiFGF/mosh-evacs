# change this to 1 or 0 depending if you want a pretty plot,
# not sure what you want otherwise
DOPLOT = 1
FPS    = 0
POINTS = 0
OPENMP = 0
IMAGE  = 0

# standard compile options for the c++ executable
GCC = gcc
EXE = entbody
OBJS =  main.c
FLAGS = -O3 -Wall
LIBFLAGS = -lm

ifeq ($(DOPLOT), 1)
    OBJS += plot.c
    FLAGS += -DPLOT
    LIBFLAGS += -lGL -lGLU -lglut 
endif

ifeq ($(IMAGE), 1)
	FLAGS += -DOPENIL
	LIBFLAGS += -lIL -lILU -lILUT
endif

ifeq ($(OPENMP), 1)
    FLAGS += -fopenmp
    FLAGS += -DOPENMP
endif

ifeq ($(FPS),1)
    LIBFLAGS += -lrt
    FLAGS += -DFPS
endif

ifeq ($(POINTS), 1)
    FLAGS += -DPOINTS
endif

# default super-target
all: $(EXE)

# the standard executable
$(EXE): $(OBJS)
	$(GCC) $(FLAGS) $^ -o $@ $(LIBFLAGS)

.PHONY: clean tidy

tidy:
	@find | egrep "#" | xargs rm -f
	@find | egrep "\~" | xargs rm -f
	@find | egrep ".txt" | xargs rm -f

clean: $(EXE)
	rm -f $(EXE)
