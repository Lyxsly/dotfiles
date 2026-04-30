return {
  { "akinsho/toggleterm.nvim" },
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup({
        mode = "toggleterm",
        filetype = {
          cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
          c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
          python = "python3 $file",
        },
      })
      vim.keymap.set("t", "<leader>qt", "<C-\\><C-n>:bd!<CR>")
    end,
    keys = {
      { "<leader>r", ":RunCode<CR>", desc = "Run Code" },
    },
  },
}
