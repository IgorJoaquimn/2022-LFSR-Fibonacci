cria:
	python3 criabits.py
	rm -f lfsr_output.txt

4bits: cria
	iverilog testbench.sv 4bits/LFRS.sv -o LFRS
	./LFRS
	python3 converte_imagem.py 4
	rm -f LFRS

7bits: cria
	iverilog testbench.sv 7bits/LFRS.sv -o LFRS
	./LFRS
	python3 converte_imagem.py 7
	rm -f LFRS

11bits: cria
	iverilog testbench.sv 11bits/LFRS.sv -o LFRS
	./LFRS
	python3 converte_imagem.py 11
	rm -f LFRS

16bits: cria
	iverilog testbench.sv 16bits/LFRS.sv -o LFRS
	./LFRS
	python3 converte_imagem.py 16
	rm -f LFRS

all: 7bits 11bits 16bits