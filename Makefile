PROG = yt_history

OBJS = conf.o store.o token.o reply.o feed.o https.o auth.o list.o main.o

CFLAGS = -D_GNU_SOURCE -g -Wall $(shell pkg-config --cflags libevent_openssl libssl json expat)
LDFLAGS = $(shell pkg-config --libs libevent_openssl libssl json expat)

.PHONY: all clean

all: $(PROG)
$(PROG): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS)

clean:
	$(RM) $(PROG) $(OBJS)

