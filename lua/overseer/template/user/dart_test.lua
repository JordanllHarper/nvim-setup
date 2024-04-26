return {
  name = "dart test",
  builder = function()
    return {
      cmd = { "fvm", "flutter", "test" },
    }
  end,
  condition = {
    filetype = { "dart" },
  }

}
