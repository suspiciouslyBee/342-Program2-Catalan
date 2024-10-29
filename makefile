all:
	g++ main.cpp catalan.cpp -o catalan
	chmod +x 777 ./catalan

clean :
	-rm *.o $(objects) catalan

