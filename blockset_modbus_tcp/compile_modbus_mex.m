%get the path of this script so we can compile the mexes using it.
mfilePath = mfilename('fullpath');
if contains(mfilePath,'LiveEditorEvaluationHelper')
	mfilePath = matlab.desktop.editor.getActiveFilename;
end
%remove the filename from the end
[path, ~, ~] = fileparts(mfilePath);
% if modbus_mex_version doesn't exist or the result of it is false, recompile the mex files
if ~(exist('modbus_mex_version', "file") == 3) || ~modbus_mex_version()
	disp("Compiling Modbus c mex functions...");
	% compile mex files
	d = dir(fullfile(path, 'blocks'));
	files = {d.name};
	for idx = 1:length(files)
		name = char(files(1,idx));
		if contains(name, ".c") && contains(name, "sfcn")
			[~, fname, ~] = fileparts(name);
			fprintf("\nCompiling %s\n", fname);
			mex([path filesep 'blocks' filesep fname '.c'], '-outdir', fullfile(path, 'blocks'));
			fprintf("Compiled %s\n", fname);
		end
	end
	fprintf("\nCompiling modbus_mex_version\n");
	mex(fullfile(path, 'blocks', 'modbus_mex_version.c'), '-outdir',fullfile(path, 'blocks'), ['-DVERSION="' blockset_modbus_version() '"'])
	disp("Finished compiling Modbus c mex functions!");
end
%cleanup
clear mfilePath path d files idx name fname