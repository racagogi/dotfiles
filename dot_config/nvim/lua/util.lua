require('nvim-lastplace').setup {}
require('trim').setup {}
require("expand_expr")
require('Comment').setup {
    toggler = {
        line = 'cll',
        block = 'cbb',
    },
    opleader = {
        line = 'cl',
        block = 'cb',
    },
    mappings = {
        baisic = true,
        extra = false
    }
}
require("nvim-autopairs").setup({
    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey = 'Comment'
    },
})
require("nvim-autopairs").add_rule(require('nvim-autopairs.rule')("$$","$$",{"tex","latex","markdown"}))
require("nvim-autopairs").add_rule(require('nvim-autopairs.rule')("$","$",{"tex","latex","markdown"}))
require("nvim-autopairs").remove_rule('`')
require('nvim-surround').setup {}
