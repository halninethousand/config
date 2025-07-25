require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- LSP mappings: should be set in on_attach
local function lsp_keymaps(bufnr)
  local opts = { buffer = bufnr, silent = true }

  -- LSP
  map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", unpack(opts) })
  map("n", "gr", vim.lsp.buf.references, { desc = "Find references", unpack(opts) })
  map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", unpack(opts) })
  map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation", unpack(opts) })
  map("n", "<leader>gn", vim.lsp.buf.rename, { desc = "Rename symbol", unpack(opts) })
  map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", unpack(opts) })
  map("n", "<leader>dL", "<cmd>Telescope diagnostics<CR>", { desc = "Workspace Diagnostics" })
  -- LLDB debug
  map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
  map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
  map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
  map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
  map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
  map(
    "n",
    "<Leader>dd",
    "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
    { desc = "Debugger set conditional breakpoint" }
  )
  map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
  map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

  -- rustaceanvim
  map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })
end

-- export it so you can call it from your on_attach
return {
  lsp_keymaps = lsp_keymaps
}


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
