return {
  name = "dart test",
  builder = function()
    return {
      cmd = { "fvm", "flutter", "test" },
      -- args = { "--update-goldens" }
    }
  end,
  condition = {
    filetype = { "dart" },
  }

}
