set PATH ~/.local/bin $PATH

fish_vi_key_bindings

# Plugins
fundle plugin "strika/catfish-pine"

fundle init

# Remove the default Fish greeting
set fish_greeting

# Aliases
alias diskusage="du -h -d1 2> /dev/null | sort -h"
alias t="cd ~/vimwiki; vim Tasks.md"
alias play="mplayer -subcp cp1250"

# git
alias g --wraps git="git"
alias gr="grep -rn"
alias grc="git add .; and git rebase --continue"
alias grm="git rebase -i master"
alias gpsf="git push -f"

# vim
alias v="nvim"
alias vim="nvim"

function vbox
  switch (count $argv)
  case 0
    ssh -p 2222 -o ForwardX11=yes -o ForwardX11Trusted=yes -o ForwardAgent=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=/def/null strika@localhost
  case 1
    VBoxHeadless --startvm $argv[1] &
  end
end

# Ruby on Rails Aliases
alias b="bundle"
alias pewpew="bin/rails db:migrate db:test:prepare"
alias spring="./bin/spring"
alias import_db="bin/rake db:drop db:create; and mysql aligni_development -u developer -p < ~/aligni-db/latest; and bin/rake db:migrate db:test:prepar"
alias pewpew="bundle exec rake db:migrate db:test:prepar"
alias console="bin/rails consol"
alias srv="bin/rails server -b 0.0.0."

# SSH Agent
if set -q SSH_CONNECTION; and not ssh-add -l > /dev/null
  ssh-add
end

# Rbenv
status --is-interactive; and rbenv init - | source
