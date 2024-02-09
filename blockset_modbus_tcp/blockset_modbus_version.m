%%***************************************************************************************
%% file         blockset_modbus_version.m
%% brief        Sets the blockset version in the simulink blocks
%%
%%---------------------------------------------------------------------------------------
%%                          C O P Y R I G H T
%%---------------------------------------------------------------------------------------
%%  Copyright 2024 (c) by GOcontroll     http://www.gocontroll.com    All rights reserved
%%
%%---------------------------------------------------------------------------------------
%%                            L I C E N S E
%%---------------------------------------------------------------------------------------
%% Permission is hereby granted, free of charge, to any person obtaining a copy of this
%% software and associated documentation files (the "Software"), to deal in the Software
%% without restriction, including without limitation the rights to use, copy, modify, merge,
%% publish, distribute, sublicense, and/or sell copies of the Software, and to permit
%% persons to whom the Software is furnished to do so, subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included in all copies or
%% substantial portions of the Software.
%%
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
%% INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
%% PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
%% FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
%% OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
%% DEALINGS IN THE SOFTWARE.
%%
%%***************************************************************************************

function [version] = blockset_modbus_version()

version = "Modbus v0.0.4";

%% V0.0.4 Update 9-2-2024:
%% improved read/write out of bounds errors, improved tlc code in general
%% server ip is now configurable
%%
%% V0.0.3 Update 8-2-2024:
%% added a error when the read or write block would go out of bounds of the available memory map
%% prevents undefined behaviour and segfaults
%%
%% V0.0.2 Update 8-2-2024:
%% fixed the holding and input registers being reversed in the tlcs
%% tcp server component is now usable, only some minor usability improvements left for 1.0.0
%%
%% V0.0.1 Update 6-2-2024:
%% first time actually running in a model, for some reason holding/input register do not seem to work properly yet,
%% coils and discrete inputs do however seem to work.
%% this version only supports a modbus tcp server functionality, hopefully other functions will be added later