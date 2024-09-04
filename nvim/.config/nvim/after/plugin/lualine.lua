require('lualine').setup({
  options = {
    theme = 'kanagawa'
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
  extensions = {'fugitive', 'chadtree'}
})

