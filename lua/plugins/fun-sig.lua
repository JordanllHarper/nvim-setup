return {
  --Function signature


  'ray-x/lsp_signature.nvim',
  config = function()
    local example_setup = {
      on_attach = function(bufnr)
        require "lsp_signature".on_attach({
          bind = true, -- This is mandatory, otherwise border config won't get registered.
          handler_opts = {
            border = "rounded"
          }
        }, bufnr)
      end,
    }

    require "lsp_signature".setup(example_setup)
  end
}
