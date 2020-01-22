.PHONY:all clean
SUB_DIR =usb  lcd  media  player
all:
	for i in $(SUB_DIR);\
	do \
	make -C $$i;\
	done
clean:
	for j in $(SUB_DIR);\
		do\
			make -C $$j clean;\
		done
