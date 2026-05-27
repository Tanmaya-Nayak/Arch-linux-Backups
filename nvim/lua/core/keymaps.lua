-- ============================================================
--  Keymaps
-- ============================================================
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ── General ─────────────────────────────────────────────────
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Force quit all" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<CR>", opts)
map("n", "<C-Down>", "<cmd>resize -2<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Splits
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertical" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split horizontal" })
map("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close split" })

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Move lines (visual)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Better paste (don't clobber register)
map("v", "p", '"_dP', opts)

-- Indent stay in visual
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- ── Telescope ───────────────────────────────────────────────
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Symbols" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })

-- ── Neo-tree ────────────────────────────────────────────────
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "File explorer" })
map("n", "<leader>o", "<cmd>Neotree focus<CR>", { desc = "Focus explorer" })

-- ── LSP (set in lsp/init.lua on_attach, listed here for reference) ──

-- ── Terminal ────────────────────────────────────────────────
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ── DAP (Debugger) ───────────────────────────────────────────

-- ── Misc ─────────────────────────────────────────────────────
map("n", "<leader>lz", "<cmd>Lazy<CR>", { desc = "Lazy plugin manager" })
map("n", "<leader>mm", "<cmd>Mason<CR>", { desc = "Mason LSP installer" })

-- ── Smart Compile & Run ──────────────────────────────────────
local function run_file()
  if vim.bo.buftype ~= "" then
    vim.notify("Not a file buffer!", vim.log.levels.WARN)
    return
  end
  local ft = vim.bo.filetype
  local file = vim.fn.expand("%:p")
  local fname = vim.fn.expand("%:t:r")
  local dir = vim.fn.expand("%:p:h")
  local cmd

  if ft == "c" then
    cmd = string.format("cd '%s' && gcc '%s' -o '%s' && ./'%s'", dir, file, fname, fname)
  elseif ft == "cpp" then
    cmd = string.format("cd '%s' && g++ -std=c++17 '%s' -o '%s' && ./'%s'", dir, file, fname, fname)
  elseif ft == "python" then
    local venv = vim.fn.finddir(".venv", dir .. ";")
    local python = (venv ~= "" and (venv .. "/bin/python")) or "python3"
    cmd = string.format("cd '%s' && '%s' '%s'", dir, python, file)
  elseif ft == "java" then
    cmd = string.format("cd %s && javac %s && java %s", dir, file, fname)
  elseif ft == "javascript" then
    cmd = string.format("cd %s && node %s", dir, file)
  elseif ft == "typescript" then
    cmd = string.format("cd %s && ts-node %s", dir, file)
  elseif ft == "sh" or ft == "bash" then
    cmd = string.format("cd %s && bash %s", dir, file)
  elseif ft == "lua" then
    cmd = string.format("cd %s && lua %s", dir, file)
  elseif ft == "rust" then
    cmd = string.format("cd %s && cargo run", dir)
  elseif ft == "go" then
    cmd = string.format("cd %s && go run %s", dir, file)
  else
    vim.notify("No runner configured for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  -- Save first
  vim.cmd("w")
  -- Run in horizontal toggleterm
  require("toggleterm.terminal").Terminal:new({
    cmd = cmd,
    direction = "horizontal",
    close_on_exit = false,
    on_open = function(term)
      vim.cmd("startinsert!")
    end,
  }):toggle()
end

map("n", "<leader>rr", run_file, { desc = "Run current file" })
map("n", "<F5>", run_file, { desc = "Run current file" })
