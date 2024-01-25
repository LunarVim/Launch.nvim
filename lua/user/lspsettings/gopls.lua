return {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      format = {
        goimports = true,
        goimports_reviser = true,
      },
      completion = {
        usePlaceholders = true,
        completeUnimported = true,
      },
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
