# ============================
#  Neovim Windows Installer
# ============================

Write-Host "=== Installing Neovim configuration ==="

# Paths
$localAppData = $env:LOCALAPPDATA
$nvimConfigPath = Join-Path $localAppData "nvim"
$repoConfigPath = Join-Path $PSScriptRoot "nvim"

# 1. Remove old config
if (Test-Path $nvimConfigPath) {
    Write-Host "Removing old configuration..."
    Remove-Item $nvimConfigPath -Recurse -Force
}

# 2. Create symlink
Write-Host "Creating symlink..."
New-Item -ItemType SymbolicLink -Path $nvimConfigPath -Target $repoConfigPath | Out-Null

Write-Host "Symlink created:"
Write-Host "$nvimConfigPath -> $repoConfigPath"

# 3. Install dependencies via Scoop
if (Get-Command scoop -ErrorAction SilentlyContinue) {
    Write-Host "Installing dependencies via Scoop..."

    scoop install git ripgrep fd fzf neovim

    # Nerd Fonts (JetBrainsMono)
    scoop bucket add nerd-fonts
    scoop install JetBrainsMono-NF

    # LSP + formatters
    scoop install lua-language-server
    scoop install llvm            # contains clangd + clang-format
    scoop install stylua
    scoop install python          # for Black
    pip install black
} else {
    Write-Host "Scoop is not installed — skipping dependency installation."
    Write-Host "Install Scoop with:"
    Write-Host 'Set-ExecutionPolicy RemoteSigned -Scope CurrentUser'
    Write-Host 'iwr -useb get.scoop.sh | iex'
}

# FASTBuild (.bff) tree-sitter queries
Write-Host "Setting up FASTBuild tree-sitter queries..."
$fastbuildTsDir = Join-Path $env:USERPROFILE ".cache\tree-sitter-fastbuild"
if (-not (Test-Path $fastbuildTsDir)) {
    git clone --depth 1 https://github.com/pinbraerts/tree-sitter-fastbuild.git $fastbuildTsDir
} else {
    git -C $fastbuildTsDir pull --ff-only
}

$queriesDest = Join-Path $repoConfigPath "after\queries\fastbuild"
New-Item -ItemType Directory -Path (Split-Path $queriesDest -Parent) -Force | Out-Null
if (Test-Path $queriesDest) {
    Remove-Item $queriesDest -Force -Recurse
}
New-Item -ItemType Junction -Path $queriesDest -Target (Join-Path $fastbuildTsDir "queries\fastbuild") | Out-Null

Write-Host "Installation complete — launch Neovim."
