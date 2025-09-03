------------------- Helpers ---------------------
-- For more information :h lua-vim-options
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local cmd = vim.cmd -- Behaves like :cmd('<something>')
local execute = vim.api.nvim_command
local fn = vim.fn
local opt = vim.opt -- Behaves like :set

-- disable netrw at the very start of your init.lua (strongly advised)
-- for nvim tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-------------------- Plugins ---------------------
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]])

require('packer').startup({
    function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- ###############################################################################
        -- ###                              STYLING                                    ###
        -- ###############################################################################

        use { 'stevearc/dressing.nvim' }
        use { 'nvim-tree/nvim-tree.lua', config = function() require("nvim-tree").setup() end }

        use { 'norcalli/nvim-colorizer.lua', config = function() require 'colorizer'.setup {} end }

        use {
            'catppuccin/nvim',
            as = 'catppuccin',
            config = function()
                require('catppuccin').setup({
                    flavour = "mocha", -- latte, frappe, macchiato, mocha
                    background = {    -- :h background
                        light = "latte",
                        dark = "mocha",
                    },
                    transparent_background = false, -- disables setting the background color.
                    no_italic = false,              -- Force no italic
                    no_bold = false,                -- Force no bold
                    no_underline = false,           -- Force no underline
                    styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
                        comments = { "italic" },    -- Change the style of comments
                        conditionals = { "italic" },
                        loops = {},
                        functions = {},
                        keywords = {},
                        strings = {},
                        variables = {},
                        numbers = {},
                        booleans = {},
                        properties = {},
                        types = {},
                        operators = {},
                        -- miscs = {}, -- Uncomment to turn off hard-coded styles
                    },
                    color_overrides = {
                        all = {},
                        latte = {},
                        frappe = {},
                        macchiato = {},
                        mocha = {},
                    },
                    custom_highlights = function(colors)
                        return {
                            ["@string"] = { fg = colors.blue },
                            String = { fg = colors.blue },
                        }
                    end,
                })
            end,
        }

        -- ###############################################################################
        -- ###                              LANGUAGES                                  ###
        -- ###############################################################################

        use { 'lervag/vimtex', ft = { 'tex' }, config = function() vim.g.tex_flavor = 'latex' end }

        use {
            'nvim-treesitter/nvim-treesitter',
            requires = 'nvim-treesitter/playground',
            run = ':TSUpdate',
            config = function()
                require('nvim-treesitter.configs').setup {
                    ensure_installed = 'all', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
                    ignore_install = {},      -- List of parsers to ignore installing
                    highlight = {
                        enable = true,        -- false will disable the whole extension
                        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                        -- Using this option may slow down your editor, and you may see some duplicate highlights.
                        -- Instead of true it can also be a list of languages
                        additional_vim_regex_highlighting = false,
                    },
                }
            end,
        }

        use {
            'fatih/vim-go',
            ft = { 'go' },
            config = function()
                -- These options are disabled to favor the nvim-lspconfig setup:
                -- GoToDefinition -> lua vim.lsp.buf.definition()
                vim.g.go_def_mapping_enabled = false
                -- GoDoc -> lua vim.lsp.buf.hover()
                vim.g.go_doc_keywordprg_enabled = false
                vim.g.go_gopls_enabled = false
                vim.g.go_fmt_fail_silently = true
            end,
        }

        -- ###############################################################################
        -- ###                              ERGONOMICS                                 ###
        -- ###############################################################################

        use { 'dyng/ctrlsf.vim', event = 'BufWinEnter' }
        use { 'editorconfig/editorconfig-vim', event = 'BufWinEnter' }
        use { 'mattn/gist-vim', cmd = 'Gist', requires = { 'mattn/webapi-vim' } }
        use { 'numToStr/Comment.nvim', event = 'BufWinEnter', config = function() require('Comment').setup {} end }
        use { 'pechorin/any-jump.vim', cmd = 'AnyJump' }
        use { 'rhysd/git-messenger.vim', cmd = 'GitMessager' }
        use { 'L3MON4D3/LuaSnip', config = function() require("luasnip.loaders.from_lua").load({}) end }
        use { "neovim/nvim-lspconfig" }
        use { "williamboman/mason.nvim", config = function() require("mason").setup() end }

        use {
            "williamboman/mason-lspconfig.nvim",
            after = "mason.nvim",
            config = function()
                -- mason
                local on_attach = function(client, bufnr)
                    -- FIX: Enable semanticTokensProvider only for supported servers
                    if not client.server_capabilities.semanticTokensProvider then
                        client.server_capabilities.semanticTokensProvider = nil
                    end

                    -- if client.server_capabilities.inlayHintProvider then
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                        vim.lsp.inlay_hint.enable(true)
                    end
                    -- end
                    -- require("navigator.lspclient.mapping").setup({ client = client, bufnr = bufnr }) -- setup navigator keymaps here,
                    -- require("navigator.dochighlight").documentHighlight(bufnr)
                    -- require("navigator.codeAction").code_action_prompt(bufnr)
                    -- Use LSP as the handler for omnifunc.
                    --    See `:help omnifunc` and `:help ins-completion` for more information.
                    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
                end

                local function lsp_names(servers)
                    local names = {}
                    for _, server in pairs(servers) do
                        names[#names + 1] = server.name
                    end
                    return names
                end

                local util = require("lspconfig.util")
                local servers = {
                    { name = "clangd",      opts = { on_attach = on_attach } },
                    { name = "dotls",       opts = { on_attach = on_attach } },
                    { name = "efm",         opts = { on_attach = on_attach } },
                    { name = "taplo",       opts = { on_attach = on_attach } },
                    { name = "terraformls", opts = { on_attach = on_attach } },
                    { name = "texlab",      opts = { on_attach = on_attach } },
                    { name = "tflint",      opts = { on_attach = on_attach } },
                    { name = "zls",         opts = { on_attach = on_attach } },
                    {
                        name = "lua_ls",
                        opts = {
                            on_attach = on_attach,
                            on_init = function(client)
                                if client.workspace_folders then
                                    local path = client.workspace_folders[1].name
                                    if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
                                        return
                                    end
                                end

                                client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                                    runtime = {
                                        -- Tell the language server which version of Lua you're using
                                        -- (most likely LuaJIT in the case of Neovim)
                                        version = "LuaJIT",
                                    },
                                    -- Make the server aware of Neovim runtime files
                                    workspace = {
                                        checkThirdParty = false,
                                        library = {
                                            vim.env.VIMRUNTIME,
                                            -- Depending on the usage, you might want to add additional paths here.
                                            -- "${3rd}/luv/library"
                                            -- "${3rd}/busted/library",
                                        },
                                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                                        -- library = vim.api.nvim_get_runtime_file("", true)
                                    },
                                })
                            end,
                            single_file_support = true,
                            settings = {
                                Lua = {
                                    hint = {
                                        enable = true,
                                    },
                                    diagnostics = { globals = { "vim" } },
                                },
                            },
                        },
                    },
                    {
                        name = "gopls",
                        opts = {
                            on_attach = on_attach,
                            single_file_support = true,
                            settings = {
                                gopls = {
                                    analyses = { unusedparams = true, shadow = true },
                                    completeUnimported = true,
                                    experimentalPostfixCompletions = true,
                                    gofumpt = true,
                                    staticcheck = true,
                                    hints = {
                                        assignVariableTypes = true,
                                        compositeLiteralFields = true,
                                        compositeLiteralTypes = true,
                                        constantValues = true,
                                        functionTypeParameters = true,
                                        parameterNames = true,
                                        rangeVariableTypes = true,
                                    },
                                    codelenses = {
                                        gcDetails = true,
                                        generate = true,
                                        regenerateCgo = true,
                                        runGovulncheck = true,
                                        tidy = true,
                                        upgradeDependency = true,
                                        vendor = true,
                                    },
                                },
                            },
                        },
                    },
                    {
                        name = "pylsp",
                        opts = {
                            on_attach = on_attach,
                            pylsp = {
                                plugins = {
                                    pycodestyle = {
                                        maxLineLength = 100,
                                    },
                                    rope_completion = {
                                        enabled = true,
                                    },
                                    jedi_completion = {
                                        enabled = true,
                                    },
                                },
                            },
                        },
                    },
                    {
                        name = "marksman",
                        opts = {
                            filetypes = { "markdown", "quarto" },
                        },
                        root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
                    },
                    {
                        name = "rust_analyzer",
                        opts = {
                            on_attach = on_attach,
                            settings = {
                                ["rust-analyzer"] = {
                                    assist = { importGranularity = "module", importPrefix = "by_self" },
                                    cargo = { loadOutDirsFromCheck = true },
                                    checkOnSave = { command = "clippy" },
                                    completion = { autoimport = { enable = true } },
                                    procMacro = { enable = true },
                                },
                            },
                        },
                    },
                    {
                        name = "yamlls",
                        opts = {
                            on_attach = on_attach,
                            settings = {
                                yaml = {
                                    schemaStore = {
                                        enable = true,
                                        url = "",
                                    },
                                    schemas = {
                                        kubernetes = "**/templates/*.yaml",
                                    },
                                },
                            },
                        },
                    },
                }
                require("mason").setup()

                local lspconfig = require("lspconfig")
                lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
                    inlay_hints = {
                        enabled = true,
                    },
                    codelens = {
                        enabled = true,
                    },
                    document_highlight = {
                        enabled = true,
                    },
                    capabilities = {
                        workspace = {
                            fileOperations = {
                                didRename = true,
                                willRename = true,
                            },
                        },
                    },
                })

                require("mason-lspconfig").setup({
                    ensure_installed = lsp_names(servers),
                })
                -- After setting up mason-lspconfig you may set up servers via lspconfig
                -- require("lspconfig").lua_ls.setup {}
                -- require("lspconfig").rust_analyzer.setup {}
                -- ...
                for i, server in ipairs(servers) do
                    require("lspconfig")[server.name].setup(server.opts)
                end
            end,
        }

        use {
            'rbjorklin/symbols-outline.nvim',
            branch = 'fix-outline-detection',
            config = function() require('symbols-outline').setup({ wrap = true }) end,
        }

        use {
            'folke/which-key.nvim',
            requires = 'nvim-tree/nvim-web-devicons',
            config = function()
                require('which-key').setup { plugins = { spelling = { enabled = true, suggestions = 20 } } }
                require('user.keymaps').setup()
            end,
        }

        use {
            'rmagatti/goto-preview',
            event = 'BufWinEnter',
            config = function() require('goto-preview').setup { default_mappings = true } end,
        }

        use {
            'folke/todo-comments.nvim',
            event = 'BufWinEnter',
            requires = 'nvim-lua/plenary.nvim',
            config = function() require('todo-comments').setup {} end,
        }

        use {
            'lewis6991/gitsigns.nvim',
            event = 'BufWinEnter',
            requires = { 'nvim-lua/plenary.nvim' },
            config = function()
                require('gitsigns').setup {
                    current_line_blame = true,
                    current_line_blame_opts = {
                        virt_text = true,
                        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                        delay = 1000,
                    },
                    current_line_blame_formatter_opts = { relative_time = false },
                }
            end,
        }

        use {
            'nvim-telescope/telescope.nvim',
            requires = { 'nvim-lua/plenary.nvim' },
            config = function()
                require('telescope').setup {
                    defaults = {
                        sorting_strategy = 'ascending',
                        layout_config = { prompt_position = 'top' },
                        set_env = { ['COLORTERM'] = 'truecolor' },
                        color_devicons = false,
                        file_ignore_patterns = { 'vendor', 'node_modules' },
                    },
                }
            end,
        }

        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = { display = { open_fn = require('packer.util').float } },
})

-------------------- Options ---------------------
opt.spell = false
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.autoread = true    -- Reload files changed outside vim
opt.showmode = true    -- Show current mode down the bottom
opt.visualbell = false -- 'true' for no sounds
opt.lazyredraw = false -- 'true' for http://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
opt.splitbelow = true  -- Horizontal split below current.
opt.splitright = true  -- Vertical split to right of current.
opt.wrap = false       -- Don't wrap lines
opt.linebreak = true   -- Wrap lines at convenient points"
opt.scrolloff = 8      -- Start scrolling when we're 8 lines away from margins
opt.sidescrolloff = 15
opt.sidescroll = 1
opt.signcolumn = 'yes' -- not sure what it is

-- Turn Off Swap Files
opt.swapfile = false
opt.backup = false
opt.wb = false

-- Indentation
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 2 -- TODO: Need in comparison to shiftwidth
opt.softtabstop = 2
opt.shiftround = true
opt.smarttab = true
opt.shiftwidth = 2

-- Completion
opt.wildmenu = true -- Enable ctrl-n and ctrl-p to scroll through matches
opt.wildmode = 'list:longest'

-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
opt.completeopt = { 'menuone', 'noinsert', 'noselect' }

opt.wildignore:append { '*.png', '*.jpg', '*.gif' }
opt.wildignore:append { '*DS_Store*' }
opt.wildignore:append { '*vim/backups*' }
opt.wildignore:append { '.tags' }
opt.wildignore:append { 'log/**' }
opt.wildignore:append { 'tmp/**' }
opt.wildignore:append { '*.o', '*.obj', '*~' }

-------------------- Command ---------------------
-- Persistent Undo
-- Keep undo history across sessions, by storing in file.
cmd([[ silent !mkdir ~/.nvim/backups > /dev/null 2>&1 ]])
opt.undofile = true
opt.undodir = os.getenv 'HOME' .. '/.nvim/backups'

-- Automatically rebalance windows on vim resize
autocmd('VimResized', { pattern = '*', command = ':wincmd =' })

-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#customizing-how-diagnostics-are-displayed
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Could be '■', '▎', 'x'
        source = "always", -- Or "if_many"
    },
    float = {
        source = "always", -- Or "if_many"
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
