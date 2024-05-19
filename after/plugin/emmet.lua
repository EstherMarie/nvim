local lspconfig = require('lspconfig')

lspconfig.emmet_language_server.setup({
  filetypes = { "css", "html", "javascript", "javascriptreact", "less", "sass", "scss", "typescriptreact" },
  init_options = {
    --- @type table<string, any> https://docs.emmet.io/customization/preferences/
    preferences = {},
    --- @type "always" | "never" defaults to `"always"`
    showexpandedabbreviation = "always",
    --- @type boolean defaults to `true`
    showabbreviationsuggestions = true,
    --- @type boolean defaults to `false`
    showsuggestionsassnippets = false,
    --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
    syntaxprofiles = {
      html = {
        attr_quotes = "single",
        inline_break = 2,
        self_closing_tag = "xhtml";
      },
      jsx = {
        attr_quotes = "single",
        inline_break = 2,
        self_closing_tag = "xhtml";
      }
    },
    --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
    variables = {},
    --- @type string[]
    excludelanguages = {},
  },
})

-- =========================================================

-- Config Emmet_ls options
-- local lspconfig = require('lspconfig')
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
-- local emmet_opts = {
--   ["output.attributeQuotes"] = "single",
--   ["output.inlineBreak"] = 1,
--   ["jsx.enabled"] = true,
--   ["output.selfClosingStyle"] = "xhtml";
-- }
--
-- lspconfig.emmet_ls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "sass", "scss" },
--   init_options = {
--     html = {
--       options = {
--         ["output.attributeQuotes"] = "single",
--         ["output.inlineBreak"] = 1,
--       }
--     },
--     jsx = {
--       options = emmet_opts
--     },
--   }
-- })

-- =======================================================

-- NOT IN USE | This config was for: 'mattn/emmet-vim'

-- Set single quotes for emmet autocompletion
vim.g.user_emmet_settings = {
  ["html"] = {
    ["quote_char"] = "'"
  },
  ["javascript.jsx"] = {
    ["extends"] = "jsx",
    ["quote_char"] = "'"
  },
  ["typescript.tsx"] = {
    ["extends"] = "tsx",
    ["quote_char"] = "'"
  }
}

-- let g:user_emmet_settings = {
-- \    "html": {
-- \        "quote_char": "'"
-- \    }
-- \    ,"javascript.jsx": {
-- \        "extends": "jsx"
-- \        "quote_char": "'"
-- \    }
-- \}
