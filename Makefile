batFile=boot.bat start.bat
asmFile=boot.asm start.asm

sys.img:$(batFile)
	java -jar init.jar

$(batFile):$(asmFile)
	nasm boot.asm -o boot.bat
	nasm start.asm -o start.bat
