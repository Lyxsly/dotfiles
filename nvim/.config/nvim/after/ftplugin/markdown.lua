vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

-- <leader>mp で現在のファイルをPDFに変換する
vim.keymap.set("n", "<leader>mp", function()
  local file = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:p:r") .. ".pdf"
  vim.fn.system("marp " .. file .. " --pdf --allow-local-files --output " .. output)
  print("PDF出力: " .. output)
end, {
  buffer = true,
  desc = "Marp: PDF出力",
})

local marp_job_id = nil

vim.keymap.set("n", "<leader>mw", function()
  local file = vim.fn.expand("%:p:h")
  marp_job_id = vim.fn.jobstart("marp --watch --server " .. file)
  print("Marp watch開始: http://localhost:8080")
end, {
  buffer = true,
  desc = "Marp: プレビュー開始",
})

vim.keymap.set("n", "<leader>mq", function()
  if marp_job_id then
    vim.fn.jobstop(marp_job_id)
    marp_job_id = nil
    print("Marp watch停止")
  end
end, {
  buffer = true,
  desc = "Marp: プレビュー停止",
})
