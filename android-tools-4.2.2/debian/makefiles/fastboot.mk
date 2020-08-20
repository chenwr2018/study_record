# Makefile for fastboot; from https://heiher.info/2227.html

VPATH+= $(SRCDIR)/core/fastboot
SRCS+= bootimg.c
SRCS+= engine.c
SRCS+= fastboot.c
SRCS+= protocol.c
SRCS+= usb_linux.c
SRCS+= util_linux.c

VPATH+= $(SRCDIR)/core/libzipfile
SRCS+= centraldir.c
SRCS+= zipfile.c

VPATH+= $(SRCDIR)/core/libsparse
SRCS+= backed_block.c
SRCS+= sparse_crc32.c
SRCS+= sparse.c
SRCS+= sparse_read.c
SRCS+= sparse_err.c
SRCS+= output_file.c

VPATH+= $(SRCDIR)/extras/ext4_utils/
SRCS+= make_ext4fs.c
SRCS+= crc16.c
SRCS+= ext4_utils.c
SRCS+= indirect.c
SRCS+= allocate.c
SRCS+= contents.c
SRCS+= uuid.c
SRCS+= extent.c
SRCS+= wipe.c
SRCS+= sha1.c

CPPFLAGS+= -I$(SRCDIR)/core/fastboot
CPPFLAGS+= -I$(SRCDIR)/core/include
CPPFLAGS+= -I$(SRCDIR)/core/mkbootimg
CPPFLAGS+= -I$(SRCDIR)/extras/ext4_utils/
CPPFLAGS+= -I$(SRCDIR)/core/libsparse/include/

LIBS+= -lz -lselinux

OBJS= $(SRCS:.c=.o)

all: fastboot

fastboot: $(OBJS)
	$(CC) -o $@ $(LDFLAGS) $(OBJS) $(LIBS)

clean:
	rm -rf $(OBJS) fastboot
