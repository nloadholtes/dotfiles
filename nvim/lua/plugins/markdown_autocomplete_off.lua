-- This is to help turn off the auto-complete in markdown files.

return {
  {
    "hrsh7th/nvim-cmp",
    init = function()
      vim.g.cmp_disabled = false
    end,
    opts = {
      enabled = function()
        return (vim.bo.ft ~= "markdown")
      end,
    },
  },
}
