local M = {
  url = "git@github.com:ChristianChiarulli/nostr.nvim.git",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build ={ "cd rplugin/node/nostr && npm i",  ":UpdateRemotePlugins", }
}

function M.config()
  require("nostr").setup {}
end

return M
