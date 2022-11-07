local status_ok, code_runner = pcall(require, "code_runner")
if not status_ok then
	return
end
code_runner.setup({
	-- put here the commands by filetype
	filetype = {
		cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
		go = "cd $dir && go run $fileName && time",
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "cd $dir && python3 $fileName && time",
		typescript = "deno run",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
	},
})
