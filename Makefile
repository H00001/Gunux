img=system.img
system.img:kernel.bat boot.bat
	
kernel.bat:
	nasm kernel.asm -o kernel.bat
boot.bat:
	nasm boot.asm -o boot.bat
