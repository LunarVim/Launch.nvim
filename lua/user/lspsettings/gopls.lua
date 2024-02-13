return {
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			hoverKind = "FullDocumentation",
			semanticTokens = true,
			codelenses = {
				generate = true,
				gc_details = true,
				tidy = true,
				upgrade_dependency = true,
			},
		},
	},
}
