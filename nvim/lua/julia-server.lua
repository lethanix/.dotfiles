local nvim_lsp = require("lspconfig")

local on_attach = function()
    require("lsp-conf")
    require("cmp-conf")
end

nvim_lsp.julials.setup ({
    on_attach=on_attach,
    on_new_config = function(new_config,new_root_dir)
	server_path = "/Users/louis/.julia/packages/LanguageServer/y1ebo/src"
	cmd = {
	    "julia",
            "--project="..server_path,
            "--startup-file=no",
            "--history-file=no",
            "-e", [[
		using Pkg;
              	Pkg.instantiate()
              	using LanguageServer; using SymbolServer;
              	depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
              	project_path = dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2])))
              	# Make sure that we only load packages from this environment specifically.
              	@info "Running language server" env=Base.load_path()[1] pwd() project_path depot_path
              	server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path);
              	server.runlinter = true;
              	run(server);
            ]]
	};
	new_config.cmd = cmd
    end
})
