/************************************************************************************//**
* \file			sfcn_modbus_server_read_map.c
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

#define S_FUNCTION_NAME sfcn_modbus_server_read_map

#include "header.c"
#include "simstruc.h"

#define PARAM_NAME_TSAMP "tsamp"
#define PARAM_NAME_ADDRESS "address"
#define PARAM_NAME_BLOCK_TYPE "block_type"
#define PARAM_NAME_DATA_TYPE "data_type"
#define PARAM_NAME_BIT "bit"
#define PARAM_NAME_LENGTH "length"

enum params {
	PARAM_TSAMP,
	PARAM_ADDRESS,
	PARAM_BLOCK_TYPE,
	PARAM_DATA_TYPE,
	PARAM_BIT,
	PARAM_LENGTH,
	PARAM_COUNT,
};

enum outputs {
	OUT_MAP_VAL,
	OUT_COUNT
};

enum inputs {
	IN_COUNT,
};

static void mdlInitializeSizes(SimStruct *S) {
	ssSetNumSFcnParams(S, PARAM_COUNT);

	if (ssGetNumSFcnParams(S) != ssGetSFcnParamsCount(S))
		return;

	ssSetSFcnParamTunable(S,PARAM_TSAMP,false);
	ssSetSFcnParamTunable(S,PARAM_ADDRESS,false);
	ssSetSFcnParamTunable(S,PARAM_BLOCK_TYPE,false);
	ssSetSFcnParamTunable(S,PARAM_DATA_TYPE,false);
	ssSetSFcnParamTunable(S,PARAM_BIT,false);
	ssSetSFcnParamTunable(S,PARAM_LENGTH,false);

	if (!ssSetNumInputPorts(S,IN_COUNT))
		return;
	if (!ssSetNumOutputPorts(S, OUT_COUNT)) 
		return;

	if (mxGetPr(ssGetSFcnParam(S, PARAM_DATA_TYPE))[0] != 9) {
		AddOutputVectorPort(S, OUT_MAP_VAL, mxGetPr(ssGetSFcnParam(S, PARAM_DATA_TYPE))[0] - 1, mxGetPr(ssGetSFcnParam(S, PARAM_LENGTH))[0]);
	} else {
		AddOutputPort(S, OUT_MAP_VAL, mxGetPr(ssGetSFcnParam(S, PARAM_DATA_TYPE))[0] - 1);
	}
	
	SetStandardOptions(S);
}

static void mdlInitializeSampleTimes(SimStruct *S) {
	ssSetSampleTime(S, 0, mxGetPr(ssGetSFcnParam(S, PARAM_TSAMP))[0]);
	ssSetOffsetTime(S, 0, 0);
}

#ifdef MATLAB_MEX_FILE
#define MDL_SET_WORK_WIDTHS
static void mdlSetWorkWidths(SimStruct *S) {
	if (!ssSetNumRunTimeParams(S, (int_T)5))
		return;
	ssRegDlgParamAsRunTimeParam(S, PARAM_ADDRESS, 0, PARAM_NAME_ADDRESS, SS_UINT32);
	ssRegDlgParamAsRunTimeParam(S, PARAM_BLOCK_TYPE, 1, PARAM_NAME_BLOCK_TYPE, SS_UINT32);
	ssRegDlgParamAsRunTimeParam(S, PARAM_DATA_TYPE, 2, PARAM_NAME_DATA_TYPE, SS_UINT32);
	ssRegDlgParamAsRunTimeParam(S, PARAM_BIT, 3, PARAM_NAME_BIT, SS_UINT32);
	ssRegDlgParamAsRunTimeParam(S, PARAM_LENGTH, 4, PARAM_NAME_LENGTH, SS_UINT32);
}
#endif

#ifdef MATLAB_MEX_FILE
#define MDL_RTW
static void mdlRTW(SimStruct *S){
	UNUSED_PARAMETER(S);
}
#endif

#define UNUSED_MDLCHECKPARAMETERS
#define UNUSED_MDLTERMINATE
#define UNUSED_MDLOUTPUTS
#include "trailer.c"