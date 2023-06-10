VLUA=~/.config/nvim/lua/

function v-nvi {
  nvim "${VLUA}/init.lua"
}

function v-nvp {
  nvim "${VLUA}/plugins/init.lua"
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
