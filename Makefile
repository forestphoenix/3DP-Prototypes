
%.stl: %.slvs
	solvespace-cli regenerate $< --chord-tol 0.3
	solvespace-cli export-mesh --output $@ --chord-tol 0.3 $<
	
stls := $(patsubst %.slvs,%.stl,$(wildcard **/*.slvs))

all: $(stls)

clean:
	rm $(stls)

rebuild: clean all
