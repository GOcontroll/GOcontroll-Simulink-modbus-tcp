addons = matlab.addons.installedAddons;
modbus_idx = find(strcmp(addons.Name, "GOcontroll-Simulink-modbus-tcp"));
matlab.addons.disableAddon(addons.Identifier(modbus_idx));
clear addons modbus_idx