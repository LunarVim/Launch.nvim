local M = {
  "neogitorg/neogit",
  event = "VeryLazy",
  commit = "eb9d6b8f0840e4f2fa775bca7ec4a5df8b42ed6d",
}

function M.config()
  local icons = require "user.icons"

  require("neogit").setup {
    disable_signs = false,
    -- disable_hint = true,
    disable_context_highlighting = false,
    disable_commit_confirmation = true,
    disable_insert_on_commit = "auto",
    -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
    -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
    auto_refresh = true,
    disable_builtin_notifications = false,
    use_magit_keybindings = false,
    -- Change the default way of opening neogit
    kind = "tab",
    -- Change the default way of opening the commit popup
    commit_popup = {
      kind = "split",
    },
    -- Change the default way of opening popups
    popup = {
      kind = "split",
    },
    -- customize displayed signs
    signs = {
      -- { CLOSED, OPENED }
      section = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
      item = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
      hunk = { "", "" },
    },
    integrations = {
      diffview = true,
    },
    -- Setting any section to `false` will make the section not render at all
    -- sections = {
    --   untracked = {
    --     folded = false,
    --   },
    --   unstaged = {
    --     folded = false,
    --   },
    --   staged = {
    --     folded = false,
    --   },
    --   stashes = {
    --     folded = true,
    --   },
    --   unpulled = {
    --     folded = true,
    --   },
    --   unmerged = {
    --     folded = false,
    --   },
    --   recent = {
    --     folded = true,
    --   },
    -- },
    -- override/add mappings
    -- mappings = {
    --   -- modify status buffer mappings
    --   status = {
    --     ["q"] = "Close",
    --     ["1"] = "Depth1",
    --     ["2"] = "Depth2",
    --     ["3"] = "Depth3",
    --     ["4"] = "Depth4",
    --     ["<tab>"] = "Toggle",
    --     ["x"] = "Discard",
    --     ["s"] = "Stage",
    --     ["a"] = "StageUnstaged",
    --     ["<c-s>"] = "StageAll",
    --     ["u"] = "Unstage",
    --     ["U"] = "UnstageStaged",
    --     ["d"] = "DiffAtFile",
    --     ["$"] = "CommandHistory",
    --     ["<c-r>"] = "RefreshBuffer",
    --     ["o"] = "GoToFile",
    --     ["<enter>"] = "Toggle",
    --     ["<c-v>"] = "VSplitOpen",
    --     ["<c-x>"] = "SplitOpen",
    --     ["<c-t>"] = "TabOpen",
    --     ["?"] = "HelpPopup",
    --     ["D"] = "DiffPopup",
    --     ["p"] = "PullPopup",
    --     ["r"] = "RebasePopup",
    --     ["P"] = "PushPopup",
    --     ["c"] = "CommitPopup",
    --     ["L"] = "LogPopup",
    --     ["Z"] = "StashPopup",
    --     ["b"] = "BranchPopup",
    --     -- ["<space>"] = "Stage",
    --     -- Removes the default mapping of "s"
    --     -- ["s"] = "",
    --   },
    -- },
  }
end

return M
