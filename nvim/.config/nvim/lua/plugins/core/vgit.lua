return {
  "tanvirtin/vgit.nvim",
  branch = "v1.0.x",
  event = "LazyFile",
  config = function()
    require("vgit").setup({
      keymaps = {
        {
          mode = "n",
          key = "[h",
          handler = "hunk_up",
          desc = "Go up in the direction of the hunk",
        },
        {
          mode = "n",
          key = "]h",
          handler = "hunk_down",
          desc = "Go down in the direction of the hunk",
        },
        {
          mode = "n",
          key = "<leader>uG",
          handler = "toggle_live_blame",
          desc = "Toggle live blame",
        },
        {
          mode = "n",
          key = "<leader>gD",
          handler = "project_diff_preview",
          desc = "Show project diff preview",
        },
        {
          mode = "n",
          key = "<leader>gb",
          handler = "buffer_blame_preview",
          desc = "Show buffer blame preview",
        },
      },

      settings = {
        scene = {
          diff_preference = "unified", -- unified or split
          keymaps = {
            quit = "q",
          },
        },
        live_blame = {
          enabled = true,
          format = function(blame, git_config)
            local author = (git_config["user.name"] == blame.author) and "You" or blame.author
            local time = os.difftime(os.time(), blame.author_time)
            local time_divisions = {
              { 60 * 60 * 24 * 30 * 12, "years" },
              { 60 * 60 * 24 * 30, "months" },
              { 60 * 60 * 24, "days" },
              { 60 * 60, "hours" },
              { 60, "minutes" },
              { 1, "seconds" },
            }

            local counter, time_division, time_postfix = 1, time_divisions[1], time_divisions[1][2]
            while time < time_division[1] and counter < #time_divisions do
              counter = counter + 1
              time_division, time_postfix = time_divisions[counter], time_divisions[counter][2]
            end
            time = time / time_division[1]

            local commit_message = blame.committed and blame.commit_message or "Uncommitted changes"
            if not blame.committed then
              author = "You"
            end

            local blame_text =
              string.format("%s, %s %s ago • %s", author, math.floor(time + 0.5), time_postfix, commit_message)

            local win_width = vim.api.nvim_win_get_width(0)
            local cursor_line = vim.api.nvim_win_get_cursor(0)[1] - 1
            local line_content = vim.api.nvim_buf_get_lines(0, cursor_line, cursor_line + 1, false)[1] or ""
            local text_width = vim.fn.strdisplaywidth(line_content)
            local available_space = math.max(0, win_width - text_width - 2)

            local blame_text_width = vim.fn.strdisplaywidth(blame_text)
            if blame_text_width > available_space then
              local max_commit_length = available_space
                - vim.fn.strdisplaywidth(author .. ", " .. time_postfix .. " ago • ")
                - 3
              commit_message = max_commit_length > 0 and commit_message:sub(1, max_commit_length) .. "..." or "..."
              blame_text = string.format("%s, %s ago • %s", author, time_postfix, commit_message)
            end

            local padding = math.max(0, available_space - blame_text_width)
            return string.rep(" ", padding - 15) .. blame_text
          end,
        },
      },
    })
  end,
}
