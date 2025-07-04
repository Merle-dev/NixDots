return {
    'nvim-treesitter/nvim-treesitter',
    build = "TSUpdate",
    opts = {
        ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'rust', 'svelte', 'glsl', 'python', 'typescript', 'tsx' },
        auto_install = true,
        highlight = {
            enable = true,
        },
    },
    config = function(_, opts)
        require('nvim-treesitter.install').prefer_git = true
        require('nvim-treesitter.configs').setup(opts)
    end,
}
