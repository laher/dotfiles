VLUA=~/.config/nvim/lua/

function v-nvi {
  nvim "${VLUA}/init.lua"
}

function v-nvp {
  # just pick a common one
  nvim "${VLUA}/plugins/neorg.lua"
}

function v-nvs {
  nvim "${VLUA}/settings.lua"
}

function v-nvk {
  nvim "${VLUA}/keymappings.lua"
}


function v-cd-p {
  cd "${VLUA}/plugins"
}

function v-cd-l {
  cd "${VLUA}"
}
