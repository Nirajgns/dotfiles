return {
  "tanvirtin/vgit.nvim",
  branch = "v1.0.x",
  event = "LazyFile",
  config = function()
    require("vgit").setup({
      keymaps = {
        ["n [h"] = function()
          require("vgit").hunk_up()
        end,
        ["n ]h"] = function()
          require("vgit").hunk_down()
        end,
        ["n <leader>uG"] = function()
          require("vgit").toggle_live_blame()
        end,
        ["n <leader>gD"] = function()
          require("vgit").project_diff_preview()
        end,
        ["n <leader>gb"] = function()
          require("vgit").buffer_blame_preview()
        end,
      },
      settings = {
        live_blame = {
          enabled = true,
          format = function(blame, git_config)
            local config_author = git_config["user.name"]
            local author = blame.author
            if config_author == author then
              author = "You"
            end

            local time = os.difftime(os.time(), blame.author_time) / (60 * 60 * 24 * 30 * 12)
            local time_divisions = {
              { 1, "years" },
              { 12, "months" },
              { 30, "days" },
              { 24, "hours" },
              { 60, "minutes" },
              { 60, "seconds" },
            }

            local counter = 1
            local time_division = time_divisions[counter]
            local time_boundary = time_division[1]
            local time_postfix = time_division[2]

            while time < 1 and counter ~= #time_divisions do
              time_division = time_divisions[counter]
              time_boundary = time_division[1]
              time_postfix = time_division[2]
              time = time * time_boundary
              counter = counter + 1
            end

            local commit_message = blame.commit_message
            if not blame.committed then
              author = "You"
              commit_message = "Uncommitted changes"
            end

            -- Format the blame text
            local blame_text = string.format(
              "%s, %s • %s",
              author,
              string.format("%s %s ago", time >= 0 and math.floor(time + 0.5) or math.ceil(time - 0.5), time_postfix),
              commit_message
            )

            -- Get the current window width
            local win_width = vim.api.nvim_win_get_width(0)

            -- Get the length of the current line
            local cursor_line = vim.api.nvim_win_get_cursor(0)[1] - 1 -- Get current line index (0-based)
            local line_content = vim.api.nvim_buf_get_lines(0, cursor_line, cursor_line + 1, false)[1] or ""
            local text_width = vim.fn.strdisplaywidth(line_content)

            -- Calculate available space for blame text
            local available_space = math.max(0, win_width - text_width - 2)

            -- Ensure blame text fits within available space
            local blame_text_width = vim.fn.strdisplaywidth(blame_text)
            if blame_text_width > available_space then
              -- Truncate blame_text dynamically
              local max_commit_length = available_space
                - vim.fn.strdisplaywidth(author .. ", " .. time .. " ago • ")
                - 3
              if max_commit_length > 0 then
                commit_message = commit_message:sub(1, max_commit_length) .. "..."
              else
                commit_message = "..." -- If there's almost no space
              end

              blame_text = string.format("%s, %s ago • %s", author, time, commit_message)
            end

            -- Calculate padding for right alignment
            local padding = math.max(0, available_space - vim.fn.strdisplaywidth(blame_text))

            -- Add calculated spaces before blame text
            return string.rep(" ", padding - 20) .. blame_text
          end,
        },
      },
    })
  end,
}
