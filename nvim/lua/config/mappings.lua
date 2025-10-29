vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>sr.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>hl", "<Cmd>HopLine<CR>", { desc = "[H]opping [L]ines" })
vim.keymap.set("n", "<leader><leader>", "<Cmd>HopWord<CR>", { desc = "[H]opping [W]ord" })

vim.keymap.set("n", "<leader>c", "<Cmd>Telescope neoclip<CR>", { desc = "[C]lipboard" })

vim.keymap.set("n", "<leader>a", "<Cmd>AerialToggle!<CR>")

local map = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = "LSP: " .. desc })
end

map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
map("K", vim.lsp.buf.hover, "Hover Documentation")

vim.keymap.set("n", "<leader>g<Up>", "<Cmd>Neogit push<CR>", { desc = "Neo[g]it push" })
vim.keymap.set("n", "<leader>g<Down>", "<Cmd>Neogit pull<CR>", { desc = "Neo[g]it pull" })

vim.keymap.set("n", "<leader>-", "za", { desc = "Fold Closure" })
vim.keymap.set("n", "<leader>y-", "zM", { desc = "Fold Closure" })
vim.keymap.set("n", "<leader>x-", "zR", { desc = "Fold Closure" })
