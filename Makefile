obj-m += rtl8365mb.o
#obj-m += realtek-smi.o
#obj-m += rtl8366rb.o
#obj-m += rtl8366-core.o


all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
