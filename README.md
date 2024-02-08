# GOcontroll-Simulink-modbus-tcp

A Gocontroll-Simulink extension blockset for setting up a modbus tcp server

# Usage

Create a project using the regular [GOcontroll-Simulink](https://github.com/GOcontroll/GOcontroll-Simulink) template.  
Make a copy or a symbolic link of the blockset_gocontroll_modbus_tcp folder at the root level of this template so it is next to the regular blockset directory:
``` text
.
├── blockset
├── blockset_modbus_tcp
├── GOcontroll_Linux.slx
├── GOcontroll_Linux_startup.m
├── librarySetup.m
```
Start matlab in this project and open your simulink model, the librarySetup.m script will now load this addon into your simulink library.  
Your library browser should now show a GOcontroll Modbus library.

# Important notice

The [libmodbus](https://github.com/stephane/libmodbus) project is licensed under an LGPL license, this means that it is not allowed to statically link this library in a non GPL licensed project.  
Therefore you should also make sure that /blockset_modbus_tcp/lib/libmodbus/libmodbus.so.5 is uploaded to /usr/lib/aarch64-linux-gnu/ as it needs to be dynamically loaded.  
If this file is not present on the controller and this module is built into your project, the final executable will fail to launch.

# goals

- [x] Create a Modbus TCP Server implementation
- [ ] Add a TCP client implementation
- [ ] Add a RS232 Modbus implementation
- [ ] Add a RS485 Modubs implementation (for use with the Anleg Communication module)
