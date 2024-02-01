MODBUSTCP_PATH = $(BIN_PATH)/blockset_modbustcp/code
CC_INCLUDES += -I"$(BIN_PATH)/blockset_modbustcp/lib/libmodbus"
CC_INCLUDES += -I"$(BIN_PATH)/blockset_modbustcp/code"
LIBS += $(BIN_PATH)/blockset_modbustcp/lib/libmodbus/libmodbus.so.5

%.obj : $(MODBUSTCP_PATH)/%.c
	echo ### Compiling modbustcp path $(notdir $<) -o $(notdir $@)
	@$(CC) -c -o $@ $< $(CC_FLAGS) $(CC_INCLUDES)