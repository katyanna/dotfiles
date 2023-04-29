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
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    execute 'packadd packer.nvim'
end

-- local group = augroup('packer_user_config', { clear = true })
-- autocmd('BufWritePost', { pattern = 'plugins.lua ', command = 'source <afile> | PackerCompile', group = group })
local group = augroup('packer_user_config', { clear = true })
autocmd('BufWritePost', { group = group, pattern = 'plugins.lua', command = 'source <afile> | PackerCompile' })

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
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons' },
            event = 'BufWinEnter',
            config = function()
                require('lualine').setup {
                    options = { theme = 'nord' },
                    sections = {
                        lualine_a = { 'mode' },
                        lualine_b = { 'branch', 'diff' },
                        lualine_c = {
                            {
                                'filename',
                                path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                            },
                        },
                        lualine_x = {
                            { 'diagnostics', symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } },
                            'encoding',
                            'fileformat',
                            'filetype',
                        },
                        lualine_y = { 'progress' },
                        lualine_z = { 'location' },
                    },
                    tabline = {
                        lualine_a = { { 'buffers' } },
                        lualine_b = {},
                        lualine_c = {},
                        lualine_x = {},
                        lualine_y = {},
                        lualine_z = { 'tabs' },
                    },
                }
            end,
        }

        use {
            'andersevenrud/nordic.nvim',
            config = function()
                vim.cmd([[colorscheme nordic]])
                -- The table used in this example contains the default settings.
                -- Modify or remove these to your liking (this also applies to alternatives below):
                require('nordic').colorscheme({
                    -- Underline style used for spelling
                    -- Options: 'none', 'underline', 'undercurl'
                    underline_option = 'underline',

                    -- Italics for certain keywords such as constructors, functions,
                    -- labels and namespaces
                    italic = false,

                    -- Italic styled comments
                    italic_comments = true,

                    -- Minimal mode: different choice of colors for Tabs and StatusLine
                    minimal_mode = true,

                    -- Darker backgrounds for certain sidebars, popups, etc.
                    -- Options: true, false, or a table of explicit names
                    -- Supported: terminal, qf, vista_kind, packer, nvim-tree, telescope, whichkey
                    alternate_backgrounds = false,

                    -- Callback function to define custom color groups
                    -- See 'lua/nordic/colors/example.lua' for example defitions
                    custom_colors = function(c, _, _)
                        return {
                            { 'TelescopePromptBorder',                    c.blue },
                            { 'TelescopeResultsBorder',                   c.blue },
                            { 'TelescopePreviewBorder',                   c.blue },
                            { { '@include', '@label' },                   c.purple },
                            { { '@type', '@variable', 'Special' },        c.blue },
                            { { '@keyword', '@field' },                   c.intense_blue },
                            { { '@string', '@string.special', 'String' }, c.cyan },
                            { { '@function.macro' },                      c.bright_cyan },
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
                require("mason-lspconfig").setup({
                    ensure_installed = {
                        'lua_ls',
                        'efm',
                        'gopls',
                        'pyright',
                        'clangd',
                        'texlab',
                        'yamlls',
                    },
                })
                local settings = require('user.lsp_settings')
                local on_attach = function(_, _)
                    settings.setup()

                    -- Use LSP as the handler for omnifunc.
                    --    See `:help omnifunc` and `:help ins-completion` for more information.
                    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                end
                require("mason-lspconfig").setup_handlers({
                    -- The first entry (without a key) will be the default handler
                    -- and will be called for each installed server that doesn't have
                    -- a dedicated handler.
                    function(server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup({
                            on_attach = on_attach,
                            flags = { debounce_text_changes = 500, exit_timeout = 0 },
                            single_file_support = true,
                            settings = settings.languages,
                        })
                    end,
                    -- Next, you can provide targeted overrides for specific servers.
                    -- For example, a handler override for the `rust_analyzer`:
                    -- ["rust_analyzer"] = function ()
                    --     require("rust-tools").setup {}
                    -- end
                })
            end,
        }

        use {
            'rbjorklin/symbols-outline.nvim',
            branch = 'fix-outline-detection',
            config = function() require('symbols-outline').setup({ wrap = true }) end,
        }

        use {
            'pwntester/octo.nvim',
            requires = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim', 'kyazdani42/nvim-web-devicons' },
            cmd = 'Octo',
            config = function() require "octo".setup() end,
        }

        use {
            'folke/which-key.nvim',
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
        prefix = '●',    -- Could be '■', '▎', 'x'
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

