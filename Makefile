CC=gcc

.PHONY: all
all: server


server: buffer.o connection.o net.o canvas.o main.o
	$(CC) -o $@ $^ `sdl2-config --libs` -lpthread

%.o: %.c common.h buffer.h connection.h canvas.h net.h param.h
	$(CC) -Wall -Wextra -O -c -g `sdl2-config --cflags` -o $@ $<

.PHONY: clean
clean:
	rm -f buffer.o connection.o main.o canvas.o net.o server
