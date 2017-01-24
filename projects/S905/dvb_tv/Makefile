
#	AVL6862 DVB-Sx/Tx/C frontend driver

obj-m += aml.o
obj-m += avl6862.o aml_fe.o
aml-objs=aml_dvb.o aml_dmx.o 
avl6862-objs=avl.o 

EXTRA_CFLAGS += -I.
EXTRA_CFLAGS += -Idrivers/media/dvb-core -Idrivers/media/usb/dvb-usb -Idrivers/media/dvb-frontends -Idrivers/media/tuners

