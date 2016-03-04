all:WebServer

WebServer:main.o authentication.o share.o FilesDisplay.o Upload.o
	g++ -g -o WebServer main.o authentication.o share.o Upload.o FilesDisplay.o -lpthread -lsqlite3
	@mv *.o ./OBJ/
	@mv WebServer ./BIN/

main.o:./SRC/main.cpp 
	g++ -g -c ./SRC/main.cpp -o main.o -lpthread

authentication.o:./SRC/authentication.cpp
	g++ -g -c ./SRC/authentication.cpp -o authentication.o -lpthread -lsqlite3
FilesDisplay.o:./SRC/FilesDisplay.cpp
	g++ -g -c ./SRC/FilesDisplay.cpp -o FilesDisplay.o -lsqlite3
share.o:./SRC/share.cpp
	g++ -g -c ./SRC/share.cpp -o share.o -lsqlite3
Upload.o:./SRC/Upload.cpp
	g++ -g -c ./SRC/Upload.cpp -o Upload.o -lpthread -lsqlite3
clean:
	rm ./OBJ/* ./BIN/WebServer 
