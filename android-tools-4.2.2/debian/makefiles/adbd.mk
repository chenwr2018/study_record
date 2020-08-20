# Makefile for adbd

VPATH+= $(SRCDIR)/core/adbd
SRCS+=  adb.c
SRCS+=	backup_service.c
SRCS+=	fdevent.c
SRCS+=	transport.c
SRCS+=	transport_local.c
SRCS+=	transport_usb.c
SRCS+=	adb_auth_client.c
SRCS+=	sockets.c
SRCS+=	services.c
SRCS+=	file_sync_service.c
SRCS+=	jdwp_service.c
SRCS+=	framebuffer_service.c
SRCS+=	remount_service.c
SRCS+=	usb_linux_client.c
SRCS+=	log_service.c
SRCS+=	utils.c
SRCS+=	base64.c

VPATH+= $(SRCDIR)/core/libcutils
SRCS+= abort_socket.c
SRCS+= socket_inaddr_any_server.c
SRCS+= socket_local_client.c
SRCS+= socket_local_server.c
SRCS+= socket_loopback_client.c
SRCS+= socket_loopback_server.c
SRCS+= socket_network_client.c
SRCS+= list.c
SRCS+= load_file.c
SRCS+= android_reboot.c

VPATH+= $(SRCDIR)/core/libzipfile
SRCS+= centraldir.c
SRCS+= zipfile.c


CPPFLAGS+= -O2 -g -Wall -Wno-unused-parameter
CPPFLAGS+= -DADB_HOST=0 -DHAVE_FORKEXEC=1 -D_XOPEN_SOURCE -D_GNU_SOURCE -DALLOW_ADBD_ROOT=1
CPPFLAGS+= -DHAVE_SYMLINKS -DBOARD_ALWAYS_INSECURE
CPPFLAGS+= -DHAVE_TERMIO_H
CPPFLAGS+= -DADBD_NON_ANDROID
CPPFLAGS+= -I$(SRCDIR)/core/adbd
CPPFLAGS+= -I$(SRCDIR)/core/include

LIBS+= -lc -lpthread -lz `pkg-config --libs libcrypto` -lcrypt

OBJS= $(patsubst %, %.o, $(basename $(SRCS)))

all: adbd

adbd: $(OBJS)
	$(CC) -o $@ $(LDFLAGS) $(OBJS) $(LIBS)

#%.o:
#	echo $(OBJS)
#	$(CC) -o $@ $(CPPFLAGS) $(CFLAGS) -c $(wildcard $(addprefix $(CURDIR)/../*/,$(patsubst %.o, %.c, $@)))
clean:
	rm -rf $(OBJS) adbd
