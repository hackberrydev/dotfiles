set PATH ~/.local/bin ~/.cargo/bin $PATH

# Plugins
fundle plugin "strika/catfish-pine"
fundle plugin "FabioAntunes/fish-nvm"
fundle plugin "edc/bass"

fundle init

# Remove the default Fish greeting
set fish_greeting

# Aliases
alias e="kak"
alias p="cd ~/wiki; alas --insert-days 3 --remove-empty-days plan.md; e plan.md"
alias play="mplayer -subcp cp1250"

# Git aliases
alias g="git"
alias gr="grep -rn"
alias grc="git add .; and git rebase --continue"
alias grm="git rebase -i master"
alias gpsf="git push -f"

# Vim aliases
alias v="nvim"
alias vim="nvim"

# Ruby on Rails aliases
alias b="bundle"
alias pewpew="bin/rails db:migrate db:test:prepare"
alias spring="./bin/spring"
alias import_db="bin/rake db:drop db:create; and mysql aligni_development -u developer -p < ~/aligni-db/latest; and bin/rake db:migrate db:test:prepare"
alias pewpew="bundle exec rake db:migrate db:test:prepare"
alias console="bin/rails console"
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
