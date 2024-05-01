# GOcontroll-Simulink-modbus-tcp

A GOcontroll-Simulink extension blockset for setting up a modbus tcp server

# Usage
Notice: If you are working with multiple Matlab versions on your system, It is recommended to change the default addon location.  
This can be done in the home tab of **Matlab** -> **preferences** (environment section) -> **MATLAB** -> **Add-Ons**.  
Change the installation folder to something like "MATLAB*your matlab version*_addons", do this for all your Matlab installations.  
This way it is easier to maintain version compatibility between toolboxes and Matlab. For more info see [the help page](https://nl.mathworks.com/help/matlab/matlab_env/get-add-ons.html).  

Download the Modbus-Simulink add-on from the Matlab add-on explorer.

Open Simulink, your library browser should now contain the Modbus library.

# Important notice

The [libmodbus](https://github.com/stephane/libmodbus) project is licensed under an LGPL license, this means that it is not allowed to statically link this library in a non GPL licensed project.  
Therefore you should also make sure that /blockset_modbus_tcp/lib/libmodbus/libmodbus.so.5 is uploaded to /usr/lib/aarch64-linux-gnu/ as it needs to be dynamically loaded.  
If this file is not present on the controller and this module is built into your project, the final executable will fail to launch.

# goals

- [x] Create a Modbus TCP Server implementation
- [ ] Add a TCP client implementation
- [ ] Add a RS232 Modbus implementation
- [ ] Add a RS485 Modubs implementation (for use with the Anleg Communication module)
