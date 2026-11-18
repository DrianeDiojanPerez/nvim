local map = vim.keymap.set

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "J", "mzJ`z")

local function half_window(direction)
    return function()
        local jump = math.floor(vim.api.nvim_win_get_height(0) / 2)
        vim.cmd("normal! " .. jump .. direction .. "zz")
    end
end

map({ "n", "v" }, "<C-d>", half_window("j"))
map({ "n", "v" }, "<C-u>", half_window("k"))
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", [["_d]])

map("i", "<C-c>", "<Esc>")
map("n", "Q", "<nop>")
map("n", "<C-a>", "ggVG")

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>wr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
