.PHONY:all clean
SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
DEPS = $(SRCS:.c=.d)
LINK_OBJ_DIR =$(root_dir)/obj
$(shell mkdir -p $(LINK_OBJ_DIR))
DEP_DIR =$(root_dir)/dep
$(shell mkdir -p $(DEP_DIR))
OBJS:=$(addprefix $(LINK_OBJ_DIR)/,$(OBJS))
DEPS:=$(addprefix $(DEP_DIR)/,$(DEPS))
LINK_OBJ=$(wildcard $(LINK_OBJ_DIR)/*.o )
LINK_OBJ+=$(OBJS)
all: $(OBJS)  $(DEPS) $(BIN)
ifneq ("$(wildcard $(DEPS))","")
include $(DEPS)
endif
$(BIN):$(LINK_OBJ)
	gcc -o  $@ $^
$(LINK_OBJ_DIR)/%.o:%.c
	gcc -o  $@  -c $(filter %.c,$^)
$(DEP_DIR)/%.d:%.c
	gcc -MM $(filter %.c,$^) |  sed  's,\(.*\).o[ :]*,$(LINK_OBJ_DIR)/\1.o $@:,g' > $@
clean:
	rm -f  $(BIN) $(OBJS) $(DEPS)










	

