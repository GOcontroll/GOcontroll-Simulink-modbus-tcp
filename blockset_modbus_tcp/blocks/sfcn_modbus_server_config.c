/************************************************************************************//**
* \file			sfcn_modbus_server_config.c
* \brief		matlab s-function for getting feedback from the IR module
* \internal
*----------------------------------------------------------------------------------------
*                          C O P Y R I G H T
*----------------------------------------------------------------------------------------
*  Copyright 2024 (c) by GOcontroll      http://www.gocontroll.com   All rights reserved
*
*----------------------------------------------------------------------------------------
*                            L I C E N S E
*----------------------------------------------------------------------------------------
* Permission is hereby granted, free of charge, to any person obtaining a copy of this
* software and associated documentation files (the "Software"), to deal in the Software
* without restriction, including without limitation the rights to use, copy, modify, merge,
* publish, distribute, sublicense, and/or sell copies of the Software, and to permit
* persons to whom the Software is furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all copies or
* substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
* INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
* PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
* FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
* OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
* DEALINGS IN THE SOFTWARE.
* \endinternal
****************************************************************************************/

#define S_FUNCTION_NAME sfcn_modbus_server_config

#include "header.c"
#include "simstruc.h"
#include <stdio.h>

#define PARAM_NAME_IP "ip"
#define PARAM_NAME_PORT "port"
#define PARAM_NAME_COILS_ADDR "coils_addr"
#define PARAM_NAME_COILS_NUM "coils_num"
#define PARAM_NAME_DISCRETE_IN_ADDR "discrete_in_addr"
#define PARAM_NAME_DISCRETE_IN_NUM "discrete_in_num"
#define PARAM_NAME_HOLDING_ADDR "holding_addr"
#define PARAM_NAME_HOLDING_NUM "holding_num"
#define PARAM_NAME_INPUT_ADDR "input_addr"
#define PARAM_NAME_INPUT_NUM "input_num"

enum params {
	PARAM_IP,
	PARAM_PORT,
	PARAM_COILS_ADDR,
	PARAM_COILS_NUM,
	PARAM_DISCRETE_IN_ADDR,
	PARAM_DISCRETE_IN_NUM,
	PARAM_HOLDING_ADDR,
	PARAM_HOLDING_NUM,
	PARAM_INPUT_ADDR,
	PARAM_INPUT_NUM,
	PARAM_COUNT,
};

enum outputs {
	OUT_COUNT
};

enum inputs {
	IN_COUNT,
};

static void mdlInitializeSizes(SimStruct *S) {
	ssSetNumSFcnParams(S, PARAM_COUNT);

	if (ssGetNumSFcnParams(S) != ssGetSFcnParamsCount(S))
		return;

	ssSetSFcnParamTunable(S,PARAM_IP,false);
	ssSetSFcnParamTunable(S,PARAM_PORT,false);
	ssSetSFcnParamTunable(S,PARAM_COILS_ADDR,false);
	ssSetSFcnParamTunable(S,PARAM_COILS_NUM,false);
	ssSetSFcnParamTunable(S,PARAM_DISCRETE_IN_ADDR,false);
	ssSetSFcnParamTunable(S,PARAM_DISCRETE_IN_NUM,false);
	ssSetSFcnParamTunable(S,PARAM_HOLDING_ADDR,false);
	ssSetSFcnParamTunable(S,PARAM_HOLDING_NUM,false);
	ssSetSFcnParamTunable(S,PARAM_INPUT_ADDR,false);
	ssSetSFcnParamTunable(S,PARAM_INPUT_NUM,false);

	if (!ssSetNumInputPorts(S,IN_COUNT))
		return;
	if (!ssSetNumOutputPorts(S, OUT_COUNT)) 
		return;
	
	SetStandardOptions(S);
}

static void mdlInitializeSampleTimes(SimStruct *S) {
	ssSetSampleTime(S, 0, 1);
	ssSetOffsetTime(S, 0, 0);
}

#ifdef MATLAB_MEX_FILE
#define MDL_SET_WORK_WIDTHS
static void mdlSetWorkWidths(SimStruct *S) {
	if (!ssSetNumRunTimeParams(S, (int_T)9))
		return;
	ssRegDlgParamAsRunTimeParam(S, PARAM_PORT, 0, PARAM_NAME_PORT, SS_UINT16);
	ssRegDlgParamAsRunTimeParam(S, PARAM_COILS_ADDR, 1, PARAM_NAME_COILS_ADDR, SS_UINT32);
	ssRegDlgParamAsRunTimeParam(S, PARAM_COILS_NUM, 2, PARAM_NAME_COILS_NUM, SS_UINT32);
	ssRegDlgParamAsRunTimeParam(S, PARAM_DISCRETE_IN_ADDR, 3, PARAM_NAME_DISCRETE_IN_ADDR, SS_UINT32);
	ssRegDlgParamAsRunTimeParam(S, PARAM_DISCRETE_IN_NUM, 4, PARAM_NAME_DISCRETE_IN_NUM, SS_UINT32);
	ssRegDlgParamAsRunTimeParam(S, PARAM_HOLDING_ADDR, 5, PARAM_NAME_HOLDING_ADDR, SS_UINT32);
	ssRegDlgParamAsRunTimeParam(S, PARAM_HOLDING_NUM, 6, PARAM_NAME_HOLDING_NUM, SS_UINT32);
	ssRegDlgParamAsRunTimeParam(S, PARAM_INPUT_ADDR, 7, PARAM_NAME_INPUT_ADDR, SS_UINT32);
	ssRegDlgParamAsRunTimeParam(S, PARAM_INPUT_NUM, 8, PARAM_NAME_INPUT_NUM, SS_UINT32);
}
#endif

#ifdef MATLAB_MEX_FILE
#define MDL_RTW
static void mdlRTW(SimStruct *S){
	char_T *ip = mxArrayToString(ssGetSFcnParam(S,PARAM_IP));
	char_T ip_buff[20];
	snprintf(ip_buff, 20, "\"%s\"", ip); //need to add the quotes for the rtw format because of the dots in an ip address
	ssWriteRTWParamSettings(S, 1, SSWRITE_VALUE_STR, PARAM_NAME_IP, ip_buff);
}
#endif

#define UNUSED_MDLCHECKPARAMETERS
#define UNUSED_MDLTERMINATE
#define UNUSED_MDLOUTPUTS
#include "trailer.c"