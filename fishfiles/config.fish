set PATH ~/.local/bin ~/.cargo/bin $PATH

# Plugins
fundle plugin "edc/bass"
fundle plugin "FabioAntunes/fish-nvm"
fundle plugin "pure-fish/pure"

fundle init

# Remove the default Fish greeting
set fish_greeting

# Prompt configuration

# Clear previously set color variables
for variable in (set -n | grep -e pure_)
    set -e $variable
end
_pure_set_default pure_enable_single_line_prompt true
source $__fish_config_dir/fundle/pure-fish/pure/conf.d/pure.fish

# Aliases
alias gr="grep -rn"
alias e="kak"
alias p="plan"
alias play="mplayer -subcp cp1250"

# Git aliases
alias g="git"
alias grc="git add .; and git rebase --continue"
alias grm="git rebase -i master"

# Ruby on Rails aliases
alias b="bundle"
alias console="bin/rails console"
alias import_db="env DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bin/rake db:drop db:create; and mysql aligni_development -u developer -p < ~/aligni-db/latest; and bin/rake db:migrate db:test:prepare"
alias pewpew="bin/rails db:migrate db:test:prepare"
alias srv="bin/rails server -b 0.0.0.0"

function vbox
  switch (count $argv)
  case 0
    ssh -p 2222 -o ForwardX11=yes -o ForwardX11Trusted=yes -o ForwardAgent=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=/def/null strika@localhost
  case 1
    VBoxHeadless --startvm $argv[1] &
  end
end

# SSH Agent
if set -q SSH_CONNECTION; and not ssh-add -l > /dev/null
  ssh-add
end

# Rbenv
status --is-interactive; and rbenv init - | source
