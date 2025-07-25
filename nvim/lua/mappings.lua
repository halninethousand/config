require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- LSP mappings: should be set in on_attach
local function lsp_keymaps(bufnr)
  local opts = { buffer = bufnr, silent = true }

  map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", unpack(opts) })
  map("n", "gr", vim.lsp.buf.references, { desc = "Find references", unpack(opts) })
  map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", unpack(opts) })
  map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation", unpack(opts) })
  map("n", "<leader>gn", vim.lsp.buf.rename, { desc = "Rename symbol", unpack(opts) })
  map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", unpack(opts) })
  map("n", "<leader>dL", "<cmd>Telescope diagnostics<CR>", { desc = "Workspace Diagnostics" })
end

-- export it so you can call it from your on_attach
return {
  lsp_keymaps = lsp_keymaps
}


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
