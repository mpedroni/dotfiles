return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    main = 'nvim-treesitter.config',
    opts = {
        ensure_installed = {
            'c',
            'diff',
            'lua',
            'luadoc',
            'javascript',
            'typescript',
            'tsx',
            'html',
            'css',
            'json',
            'jsonc',
            'yaml',
            'regex',
            'markdown',
            'markdown_inline',
            'dockerfile',
            'cpp',
            'make',
            'bash',
            'go',
            'proto',
            'sql',

            'vim',
            'vimdoc',

            'templ',
        },
        auto_install = true,
        highlight = {
            enable = true,
            -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
            --  If you are experiencing weird indenting issues, add the language to
            --  the list of additional_vim_regex_highlighting and disabled languages for indent.
            additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby' } },
    },
}
