.PHONY:all clean
SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
DEPS = $(SRCS:.c=.d)
LINK_OBJ_DIR =/home/linux/wanglitao/temp/lcd-1/obj
$(shell mkdir -p $(LINK_OBJ_DIR))
OBJS := $(addprefix $(LINK_OBJ_DIR)/,$(OBJS))
LINK_OBJ=$(wildcard $(LINK_OBJ_DIR)/*.o )
LINK_OBJ+=$(OBJS) 
all: $(DEPS) $(OBJS) $(BIN)
ifneq ("$(wildcard $(DEPS))","")
include $(DEPS)
endif
$(BIN):$(LINK_OBJ)
	gcc -o  $@ $^
$(LINK_OBJ_DIR)/%.o:%.c
	gcc -o  $@ -c $(filter %.c,$^)
%.d:%.c
	gcc -MM $^ > $@
clean:
	rm -f  $(BIN) $(OBJS) $(DEPS)










	

