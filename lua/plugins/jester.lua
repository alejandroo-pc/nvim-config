return {
  {
    'mattkubej/jest.nvim',
    config = function()
      require('nvim-jest').setup {
        -- Path to jest
        jest_cmd = '/Users/alejandro/workspace/ctd/learnApp/node_modules/jest/bin/jest.js',
        silent = false,
      }
    end
  }
}

