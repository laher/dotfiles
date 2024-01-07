VLUA=~/.config/nvim/lua/

function v-init {
  nvim "${VLUA}/init.lua"
}

function v-plugins {
  # just pick a common one
  nvim "${VLUA}/plugins/lsp.lua"
}

function v-settings {
  nvim "${VLUA}/settings.lua"
}

function v-keymappings {
  nvim "${VLUA}/keymappings.lua"
}

function v-cd-plugins {
  cd "${VLUA}/plugins"
}

function v-cd-lua {
  cd "${VLUA}"
}
