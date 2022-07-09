.PHONY: clean

OUTPUT    := count-up.elf
SOURCEDIR := source
RESDIR    := ../resource
LIBDIR    := ../../libraries

# Actual libraries the project uses (used for linking)
LIBS := ../../libraries/au \
        ../../libraries/syscalls \
        ../../libraries/runtime \
        ../../libraries/system

# Software
DC   = ldc2
LD   = ld.lld

# Flags
DFLAGS  := -mtriple=amd64-unknown-elf -relocation-model=static \
           -code-model=kernel -mattr=-sse,-sse2,-sse3,-ssse3 -disable-red-zone \
           -betterC -op -O
LDFLAGS := --oformat elf_amd64 --nostdlib

# Source to compile.
LIBDSOURCE := $(shell find $(LIBS) -type f -name '*.d')
DSOURCE    := $(shell find $(SOURCEDIR) -type f -name '*.d') $(RESDIR)/entrypoint.d
OBJ        := $(DSOURCE:.d=.o) $(LIBDSOURCE:.d=.o)

all: $(OUTPUT)

$(OUTPUT): $(OBJ)
	@$(LD) $(LDFLAGS) $(OBJ) -T $(RESDIR)/link.ld -o $@

%.o: %.d
	@$(DC) $(DFLAGS) -I=$(SOURCEDIR) -I=$(LIBDIR) -c $< -of=$@

clean:
	rm -rf $(OBJ) $(OUTPUT)