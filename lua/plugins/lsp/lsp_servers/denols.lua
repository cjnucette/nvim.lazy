local util = require('lspconfig.util')
local opts = {}

opts = {
 root_dir = util.root_pattern('deno.json', 'deno.jsonc'),
 settings = {
    deno = {
      single_file_support = false,
      inlayHints = {
        enumMemberValues = {enabled = true},
        functionLikeReturnTypes = {enabled = true},
        parameterTypes = {enabled = true},
        parameterNames = {enabled = 'all'}, -- 'none' | 'literals'
        propertyDeclarationTypes = {enabled = true},
        variableTypes = {enabled = true},
      }
    }
  }
}

return opts
