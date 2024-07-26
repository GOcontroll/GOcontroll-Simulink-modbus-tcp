%this file runs before the make command is invoked and allows for changes to it, so we can add our include folder and library
function makecfg(objBuildInfo)
%get the path of this script so we can compile the mexes using it.
mfilePath = mfilename('fullpath');
if contains(mfilePath,'LiveEditorEvaluationHelper')
	mfilePath = matlab.desktop.editor.getActiveFilename;
end
%remove the filename from the end
[path, ~, ~] = fileparts(mfilePath);
src_path = fullfile(path, '..', 'code');
lib_path = fullfile(path, '..', 'lib', 'libmodbus');
addIncludePaths(objBuildInfo,{src_path, lib_path}); %add the -I/path/to/includes to the makefile
addSourceFiles(objBuildInfo, '*.c', src_path);
addLinkObjects(objBuildInfo, fullfile(lib_path, 'libmodbus.so.5'), '', 1000, true, true);
clear mfilePath src_path lib_path
end