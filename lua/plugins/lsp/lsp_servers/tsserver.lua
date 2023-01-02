local opts = {}

local util = require('lspconfig.util')

local inlay_hints = {
  includeInlayEnumMemberValueHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayVariableTypeHints = true,
}

opts.root_dir = util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json')

opts.settings = {
  javascript = {
    inlayHints = inlay_hints,
  },
  typescript = {
    inlayHints = inlay_hints,
  }
}

return opts
