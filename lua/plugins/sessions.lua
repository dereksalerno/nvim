return {
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        auto_session_suppress_dirs = { "~/", "/", "/tmp" },
        auto_session_use_git_branch = true,
        session_lens = {
          -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
          buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
        vim.keymap.set("n", "<Leader>sl", require("auto-session.session-lens").search_session, {
          noremap = true,
          desc = "List sessions",
        }),
      })
    end,
  },
}
