%%***************************************************************************************
%% file         sfcn_modbus_server_read_map.m
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
function sfcn_modbus_server_read_map(block)
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
	block.NumOutputPorts = 1;

	% Number of S-Function parameters expected
	tsamp = 1;
	address = 2;
	block_type = 3;
	data_type = 4;
	bit = 5;
	length = 6;

	block.NumDialogPrms     = 6;
	block.SampleTimes = [block.DialogPrm(tsamp).Data 0];
	block.OutputPort(1).DatatypeID = block.DialogPrm(data_type).Data -1;
	block.OutputPort(1).Complexity = 'Real';
	block.OutputPort(1).SamplingMode = 'sample';
	if block.DialogPrm(data_type).Data ~= 9
		block.OutputPort(1).Dimensions = block.DialogPrm(length).Data;
	else
		block.OutputPort(1).Dimensions = 1;
	end
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
	address = 2;
	block_type = 3;
	data_type = 4;
	bit = 5;
	length = 6;
	block.WriteRTWParam('string', 'address', num2str(block.DialogPrm(address).Data));
	block.WriteRTWParam('string', 'block_type', num2str(block.DialogPrm(block_type).Data));
	block.WriteRTWParam('string', 'data_type', num2str(block.DialogPrm(data_type).Data));
	block.WriteRTWParam('string', 'bit', num2str(block.DialogPrm(bit).Data));
	block.WriteRTWParam('string', 'length', num2str(block.DialogPrm(length).Data));

%%******************************* end of sfcn_modbus_server_read_map.m **********************
