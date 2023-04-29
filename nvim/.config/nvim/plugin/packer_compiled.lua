-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/katyanna/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/katyanna/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/katyanna/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/katyanna/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/katyanna/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nI\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tload\29luasnip.loaders.from_lua\frequire\0" },
    loaded = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["any-jump.vim"] = {
    commands = { "AnyJump" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/opt/any-jump.vim",
    url = "https://github.com/pechorin/any-jump.vim"
  },
  ["ctrlsf.vim"] = {
    after_files = { "/Users/katyanna/.local/share/nvim/site/pack/packer/opt/ctrlsf.vim/after/plugin/ctrlsf.vim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/opt/ctrlsf.vim",
    url = "https://github.com/dyng/ctrlsf.vim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/opt/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["gist-vim"] = {
    commands = { "Gist" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/opt/gist-vim",
    url = "https://github.com/mattn/gist-vim"
  },
  ["git-messenger.vim"] = {
    commands = { "GitMessager" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/opt/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nÖ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0&current_line_blame_formatter_opts\1\0\1\18relative_time\1\28current_line_blame_opts\1\0\3\18virt_text_pos\beol\14virt_text\2\ndelay\3è\a\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["goto-preview"] = {
    config = { "\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21default_mappings\2\nsetup\17goto-preview\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/opt/goto-preview",
    url = "https://github.com/rmagatti/goto-preview"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nÿ\3\0\0\a\0\27\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0034\4\3\0005\5\v\0>\5\1\4=\4\f\0035\4\16\0005\5\r\0005\6\14\0=\6\15\5>\5\1\4=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\3=\3\22\0025\3\24\0004\4\3\0005\5\23\0>\5\1\4=\4\b\0034\4\0\0=\4\n\0034\4\0\0=\4\f\0034\4\0\0=\4\17\0034\4\0\0=\4\19\0035\4\25\0=\4\21\3=\3\26\2B\0\2\1K\0\1\0\ftabline\1\2\0\0\ttabs\1\0\0\1\2\0\0\fbuffers\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\5\0\0\0\rencoding\15fileformat\rfiletype\fsymbols\1\0\4\twarn\tï„ª \nerror\tï€ \thint\tï ´ \tinfo\tï„© \1\2\0\0\16diagnostics\14lualine_c\1\2\1\0\rfilename\tpath\3\1\14lualine_b\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\1\ntheme\tnord\nsetup\flualine\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\nw\0\2\a\1\6\0\v-\2\0\0009\2\0\2B\2\1\0016\2\1\0009\2\2\0029\2\3\2)\4\0\0'\5\4\0'\6\5\0B\2\4\1K\0\1\0\0À\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvim\nsetupÅ\1\0\1\5\2\t\0\0156\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\3\0-\4\0\0=\4\4\0035\4\5\0=\4\6\3-\4\1\0009\4\a\4=\4\b\3B\1\2\1K\0\1\0\1À\0À\rsettings\14languages\nflags\1\0\2\17exit_timeout\3\0\26debounce_text_changes\3ô\3\14on_attach\1\0\1\24single_file_support\2\nsetup\14lspconfig\frequireæ\1\1\0\6\0\n\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0023\1\a\0006\2\0\0'\4\1\0B\2\2\0029\2\b\0024\4\3\0003\5\t\0>\5\1\4B\2\2\0012\0\0€K\0\1\0\0\19setup_handlers\0\22user.lsp_settings\21ensure_installed\1\0\0\1\b\0\0\vlua_ls\befm\ngopls\fpyright\vclangd\vtexlab\vyamlls\nsetup\20mason-lspconfig\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/opt/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    after = { "mason-lspconfig.nvim" },
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nordic.nvim"] = {
    config = { "\27LJ\2\n¬\3\0\3\6\0\r\0,4\3\t\0005\4\0\0009\5\1\0>\5\2\4>\4\1\0035\4\2\0009\5\1\0>\5\2\4>\4\2\0035\4\3\0009\5\1\0>\5\2\4>\4\3\0034\4\3\0005\5\4\0>\5\1\0049\5\5\0>\5\2\4>\4\4\0034\4\3\0005\5\6\0>\5\1\0049\5\1\0>\5\2\4>\4\5\0034\4\3\0005\5\a\0>\5\1\0049\5\b\0>\5\2\4>\4\6\0034\4\3\0005\5\t\0>\5\1\0049\5\n\0>\5\2\4>\4\a\0034\4\3\0005\5\v\0>\5\1\0049\5\f\0>\5\2\4>\4\b\3L\3\2\0\16bright_cyan\1\2\0\0\20@function.macro\tcyan\1\4\0\0\f@string\20@string.special\vString\17intense_blue\1\3\0\0\r@keyword\v@field\1\4\0\0\n@type\14@variable\fSpecial\vpurple\1\3\0\0\r@include\v@label\1\2\0\0\27TelescopePreviewBorder\1\2\0\0\27TelescopeResultsBorder\tblue\1\2\0\0\26TelescopePromptBorderÜ\1\1\0\4\0\t\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0003\3\a\0=\3\b\2B\0\2\1K\0\1\0\18custom_colors\0\1\0\5\vitalic\1\21underline_option\14underline\26alternate_backgrounds\1\17minimal_mode\2\20italic_comments\2\16colorscheme\vnordic\frequire\23colorscheme nordic\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/nordic.nvim",
    url = "https://github.com/andersevenrud/nordic.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n¸\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\19ignore_install\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    commands = { "Octo" },
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/opt/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\twrap\2\nsetup\20symbols-outline\frequire\0" },
    loaded = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/rbjorklin/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n†\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\2B\0\2\1K\0\1\0\rdefaults\1\0\0\25file_ignore_patterns\1\3\0\0\vvendor\17node_modules\fset_env\1\0\1\14COLORTERM\14truecolor\18layout_config\1\0\1\20prompt_position\btop\1\0\2\21sorting_strategy\14ascending\19color_devicons\1\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["vim-go"] = {
    config = { "\27LJ\2\n¨\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\3\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0K\0\1\0\25go_fmt_fail_silently\21go_gopls_enabled\30go_doc_keywordprg_enabled\27go_def_mapping_enabled\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/opt/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  vimtex = {
    config = { "\27LJ\2\n2\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\nlatex\15tex_flavor\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/webapi-vim",
    url = "https://github.com/mattn/webapi-vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n\1\0\0\5\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\b\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\17user.keymaps\fplugins\1\0\0\rspelling\1\0\0\1\0\2\16suggestions\3\20\fenabled\2\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/katyanna/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n†\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\2B\0\2\1K\0\1\0\rdefaults\1\0\0\25file_ignore_patterns\1\3\0\0\vvendor\17node_modules\fset_env\1\0\1\14COLORTERM\14truecolor\18layout_config\1\0\1\20prompt_position\btop\1\0\2\21sorting_strategy\14ascending\19color_devicons\1\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n\1\0\0\5\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\b\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\17user.keymaps\fplugins\1\0\0\rspelling\1\0\0\1\0\2\16suggestions\3\20\fenabled\2\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nI\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tload\29luasnip.loaders.from_lua\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nordic.nvim
time([[Config for nordic.nvim]], true)
try_loadstring("\27LJ\2\n¬\3\0\3\6\0\r\0,4\3\t\0005\4\0\0009\5\1\0>\5\2\4>\4\1\0035\4\2\0009\5\1\0>\5\2\4>\4\2\0035\4\3\0009\5\1\0>\5\2\4>\4\3\0034\4\3\0005\5\4\0>\5\1\0049\5\5\0>\5\2\4>\4\4\0034\4\3\0005\5\6\0>\5\1\0049\5\1\0>\5\2\4>\4\5\0034\4\3\0005\5\a\0>\5\1\0049\5\b\0>\5\2\4>\4\6\0034\4\3\0005\5\t\0>\5\1\0049\5\n\0>\5\2\4>\4\a\0034\4\3\0005\5\v\0>\5\1\0049\5\f\0>\5\2\4>\4\b\3L\3\2\0\16bright_cyan\1\2\0\0\20@function.macro\tcyan\1\4\0\0\f@string\20@string.special\vString\17intense_blue\1\3\0\0\r@keyword\v@field\1\4\0\0\n@type\14@variable\fSpecial\vpurple\1\3\0\0\r@include\v@label\1\2\0\0\27TelescopePreviewBorder\1\2\0\0\27TelescopeResultsBorder\tblue\1\2\0\0\26TelescopePromptBorderÜ\1\1\0\4\0\t\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0003\3\a\0=\3\b\2B\0\2\1K\0\1\0\18custom_colors\0\1\0\5\vitalic\1\21underline_option\14underline\26alternate_backgrounds\1\17minimal_mode\2\20italic_comments\2\16colorscheme\vnordic\frequire\23colorscheme nordic\bcmd\bvim\0", "config", "nordic.nvim")
time([[Config for nordic.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n¸\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\19ignore_install\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\twrap\2\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd mason-lspconfig.nvim ]]

-- Config for: mason-lspconfig.nvim
try_loadstring("\27LJ\2\nw\0\2\a\1\6\0\v-\2\0\0009\2\0\2B\2\1\0016\2\1\0009\2\2\0029\2\3\2)\4\0\0'\5\4\0'\6\5\0B\2\4\1K\0\1\0\0À\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvim\nsetupÅ\1\0\1\5\2\t\0\0156\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\3\0-\4\0\0=\4\4\0035\4\5\0=\4\6\3-\4\1\0009\4\a\4=\4\b\3B\1\2\1K\0\1\0\1À\0À\rsettings\14languages\nflags\1\0\2\17exit_timeout\3\0\26debounce_text_changes\3ô\3\14on_attach\1\0\1\24single_file_support\2\nsetup\14lspconfig\frequireæ\1\1\0\6\0\n\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0023\1\a\0006\2\0\0'\4\1\0B\2\2\0029\2\b\0024\4\3\0003\5\t\0>\5\1\4B\2\2\0012\0\0€K\0\1\0\0\19setup_handlers\0\22user.lsp_settings\21ensure_installed\1\0\0\1\b\0\0\vlua_ls\befm\ngopls\fpyright\vclangd\vtexlab\vyamlls\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'GitMessager', function(cmdargs)
          require('packer.load')({'git-messenger.vim'}, { cmd = 'GitMessager', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'git-messenger.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GitMessager ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Gist', function(cmdargs)
          require('packer.load')({'gist-vim'}, { cmd = 'Gist', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'gist-vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Gist ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'AnyJump', function(cmdargs)
          require('packer.load')({'any-jump.vim'}, { cmd = 'AnyJump', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'any-jump.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('AnyJump ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Octo', function(cmdargs)
          require('packer.load')({'octo.nvim'}, { cmd = 'Octo', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'octo.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Octo ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'ctrlsf.vim', 'todo-comments.nvim', 'editorconfig-vim', 'Comment.nvim', 'goto-preview', 'lualine.nvim', 'gitsigns.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/katyanna/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], true)
vim.cmd [[source /Users/katyanna/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
time([[Sourcing ftdetect script at: /Users/katyanna/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], false)
time([[Sourcing ftdetect script at: /Users/katyanna/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /Users/katyanna/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /Users/katyanna/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /Users/katyanna/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /Users/katyanna/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /Users/katyanna/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /Users/katyanna/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /Users/katyanna/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /Users/katyanna/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
