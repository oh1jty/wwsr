#
#

VERSION = 0.2

CC	= gcc
CFLAGS	= -I./src -I/usr/include -I/usr/include/mysql/ -O2  -g
LIBS	= -L/usr/lib/mysql/ -lmysqlclient -lm -lz -lusb

OBJS		=	wwsr.o
HDRS		= 	wwsr.h

# Common userial header/source
#HDRS		+=	userial/ownet.h userial/owproto.h
#BOBJS		+=	userial/crcutil.o userial/ioutil.o userial/swt1f.o \
#			userial/owerr.o userial/cnt1d.o


# -----------------------------------------------------------------------
# Sort out what operating system is being run and modify CFLAGS and LIBS
#
# If you add a new OSTYPE here please email it to me so that I can add
# it to the distribution in the next release
# -----------------------------------------------------------------------
SYSTYPE := $(shell uname -s)

ifeq ($(SYSTYPE), Linux)
  CFLAGS += -DLINUX
endif

ifeq ($(SYSTYPE), SunOS)
  CFLAGS += -DSOLARIS
  LIBS   += -lposix4
endif

ifeq ($(SYSTYPE), FreeBSD)
  CFLAGS += -DFREEBSD
endif

ifeq ($(SYSTYPE), AIX)
  CFLAGS += -DAIX
endif

help:
	@echo "  SYSTYPE = $(SYSTYPE)"
	@echo "  CFLAGS = $(CFLAGS)"
	@echo "  LIBS   = $(LIBS)"
	@echo ""
	@echo " "

# Build the Linux executable
all:		$(OBJS) $(HDRS)
		$(CC) $(OBJS) -o wwsr $(LIBS)


# Clean up the object files and the sub-directory for distributions
clean:
		rm -f *~ src/*~
		rm -f $(OBJS) 
		rm -f core *.asc 
		rm -rf wwsr

# Install digitemp into /usr/local/bin
install:	wwsr
		install -b -o root -g bin wwsr /usr/local/bin

