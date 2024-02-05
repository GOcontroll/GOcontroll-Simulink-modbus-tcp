MODBUSTCP_PATH = $(BIN_PATH)/blockset_modbus_tcp/code
CC_INCLUDES += -I"$(BIN_PATH)/blockset_modbus_tcp/lib/libmodbus"
CC_INCLUDES += -I"$(BIN_PATH)/blockset_modbus_tcp/code"
LIBS += $(BIN_PATH)/blockset_modbus_tcp/lib/libmodbus/libmodbus.so.5

%.obj : $(MODBUSTCP_PATH)/%.c
	echo ### Compiling modbus tcp path $(notdir $<) -o $(notdir $@)
	@$(CC) -c -o $@ $< $(CC_FLAGS) $(CC_INCLUDES)