run:
	ldc2 -mcpu=cortex-m4 -mtriple=thumb-none-linux-eabi -g --function-sections --data-sections -relocation-model=pic -O3 -Xcc=-msingle-pic-base -Xcc=mpic-register=r9 -Xcc=mno-pic-data-is-text-relative pthread.d -lib

clean:
	rm pthread.a pthread.o
