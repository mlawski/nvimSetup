local M = {}

-- Safe require (do not throw errors)
function M.safe_require(module)
    local ok, result = pcall(require, module)
    if ok then
        return result
    else
        vim.notify("Cannot load module: " .. module, vim.log.levels.WARN)
        return nil
    end
end

-- Quick key mapping
function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- System check
function M.is_windows()
    return vim.loop.os_uname().version:match "Windows"
end

function M.is_linux()
    return vim.loop.os_uname().sysname == "Linux"
end

return M
