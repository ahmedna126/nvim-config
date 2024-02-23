local api = vim.api

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
})

-- go to last loc when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Don't continue comments on new line
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufRead", "BufNewFile" }, {
  command = "setlocal formatoptions-=cro",
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    if #clients ~= 0 then
      vim.lsp.buf.format()
    end
  end,
})



vim.cmd [[
	augroup ft_insert
		autocmd!
		autocmd BufNewFile *.java exe "normal opublic class " . expand('%:t:r') . "\n{\n}\<Esc>1Go\<CR>\<CR>\<Esc>1G"
		autocmd BufNewFile *.{h,hpp} call Insert_gates()
	augroup end
]]

vim.cmd [[
	augroup file_configs
		autocmd FileType * setlocal formatoptions-=c formatoptions-=o formatoptions-=r
		autocmd Filetype java set makeprg=javac\ -d\ %:~:h:s?src?bin?\ %
		autocmd FileType lua setlocal tabstop=2 softtabstop=2 shiftwidth=2
	augroup end
]]

-- Automatically delete trailing newlines on file write
vim.cmd [[
 	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
 	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
]]

-- Remember foldings
vim.cmd [[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
  augroup end
]]


