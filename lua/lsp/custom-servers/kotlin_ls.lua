local function start_kotlin_ls()
  vim.lsp.start({
    name = 'kotlin_ls',
    cmd = { '/usr/local/bin/debug/kotlin_ls' }
  })
  -- send init message
end

start_kotlin_ls()



-- vim.lsp.stop_client(2)
