function makecfg(objBuildInfo)
	%get the path of this script so we can create our lib paths from it
	mfilePath = mfilename('fullpath');
	if contains(mfilePath,'LiveEditorEvaluationHelper')
		mfilePath = matlab.desktop.editor.getActiveFilename;
	end
	%remove the filename from the end
	[path, ~, ~] = fileparts(mfilePath);
	lib_path = fullfile(path, '..', 'lib', 'libmodbus');
	src_path = fullfile(path, '..', 'code');
	addIncludePaths(objBuildInfo, {lib_path, src_path});
	addLinkObjects(objBuildInfo, fullfile(path, '..', 'lib', 'libmodbus','libmodbus.so.5'), '', 1000, true, true);
	addSourcePaths(objBuildInfo, src_path);
	addSourceFiles(objBuildInfo, 'GocontrollModbus.c', src_path);
end