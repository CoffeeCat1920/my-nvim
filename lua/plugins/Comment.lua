return {
    'numToStr/Comment.nvim',
    opts = {
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = {
            line = 'gcc',
            block = 'gcb',
        },
        opleader = {
            line = 'gc',
            block = 'gb',
        },
        extra = {
            eol = 'gcA',
        },
        mappings = {
            basic = true,
            extra = true,
        },
        pre_hook = nil,
        post_hook = nil,
    }
}
