%%***************************************************************************************
%% file         sfcn_modbus_server_config.m
%% brief        Level-2 M file S-Function for writing a value to memory
%%
%%---------------------------------------------------------------------------------------
%%                          C O P Y R I G H T
%%---------------------------------------------------------------------------------------
%%  Copyright 2024 (c) by GOcontroll      http://www.gocontroll.com     All rights reserved
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
function sfcn_modbus_server_config(block)
  setup(block);
%endfunction


%% Function: setup ===================================================
%% Abstract:
%%   Set up the S-function block's basic characteristics such as:
%%   - Input ports
%%   - Output ports
%%   - Dialog parameters
%%   - Options
%%
%%   Required         : Yes
%%   C-Mex counterpart: mdlInitializeSizes

%% DatatypeID's
%% DOUBLE  =  0
%% SINGLE  =  1
%% INT8    =  2
%% UINT8   =  3
%% INT16   =  4
%% UINT16  =  5
%% INT32   =  6
%% UINT32  =  7
%% BOOLEAN =  8

function setup(block)
	%% Register number of input and output ports
	block.NumInputPorts = 0;
	block.NumOutputPorts = 0;

	% Number of S-Function parameters expected

	block.NumDialogPrms     = 10;
	block.SampleTimes = [1 0];
	%% -----------------------------------------------------------------
	%% Register methods called at run-time
	%% -----------------------------------------------------------------

	%%
	%% Start:
	%%   Functionality    : Called in order to initialize state and work
	%%                      area values
	%%   C-Mex counterpart: mdlStart
	%%
	block.RegBlockMethod('Start', @Start);

	%%
	%% Outputs:
	%%   Functionality    : Called to generate block outputs in
	%%                      simulation step
	%%   C-Mex counterpart: mdlOutputs
	%%
	block.RegBlockMethod('Outputs', @Outputs);

	%%
	%% Update:
	%%   Functionality    : Called to update discrete states
	%%                      during simulation step
	%%   C-Mex counterpart: mdlUpdate
	%%
	block.RegBlockMethod('Update', @Update);

	%%
	%% Terminate:
	%%   Functionality    : Called to terminate discrete states
	%%                      during simulation termination
	%%   C-Mex counterpart: mdlTerminate
	%%
	block.RegBlockMethod('Terminate', @Terminate);

	block.RegBlockMethod('WriteRTW', @WriteRTW);
%endfunction

function Start(block)

  %% No start

%endfunction


function Outputs(block)

  %% No output

%endfunction


function Update(block)

  %% No update

%endfunction

function Terminate(block)

  %% No Terminate

%endfunction

function WriteRTW(block)
	ip = 1;
	port = 2;
	coils_addr = 3;
	coils_num = 4;
	discrete_in_addr = 5;
	discrete_in_num = 6;
	holding_addr = 7;
	holding_num = 8;
	input_addr = 9;
	input_num = 10;
	block.WriteRTWParam('string', 'ip', sprintf('\"%s\"',block.DialogPrm(ip).Data)); %%If you don't manually put the brackets around some types it breaks, for example on IP addresses. It doesn't like dots in the string.
	block.WriteRTWParam('string', 'port', num2str(block.DialogPrm(port).Data));
	block.WriteRTWParam('string', 'coils_addr', num2str(block.DialogPrm(coils_addr).Data));
	block.WriteRTWParam('string', 'coils_num', num2str(block.DialogPrm(coils_num).Data));
	block.WriteRTWParam('string', 'discrete_in_addr', num2str(block.DialogPrm(discrete_in_addr).Data));
	block.WriteRTWParam('string', 'discrete_in_num', num2str(block.DialogPrm(discrete_in_num).Data));
	block.WriteRTWParam('string', 'holding_addr', num2str(block.DialogPrm(holding_addr).Data));
	block.WriteRTWParam('string', 'holding_num', num2str(block.DialogPrm(holding_num).Data));
	block.WriteRTWParam('string', 'input_addr', num2str(block.DialogPrm(input_addr).Data));
	block.WriteRTWParam('string', 'input_num', num2str(block.DialogPrm(input_num).Data));

%%******************************* end of sfcn_modbus_server_config.m **********************
