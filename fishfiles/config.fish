set PATH ~/.local/bin $PATH

# Plugins
fundle plugin "strika/catfish-pine"

fundle init

# Remove the default Fish greeting
set fish_greeting

# Aliases
function diskusage
  du -h -d1 2> /dev/null | sort -h;
end

function t
  cd ~/vimwiki; vim Tasks.md;
end

# git
function g --wraps git
  git $argv;
end

function gr
  grep -rn $argv;
end

function grc
  git add .; and git rebase --continue;
end

function grm
  git rebase -i master;
end

function gpsf
  git push -f;
end

# vim
function v
  nvim $argv;
end

function vim
  nvim $argv;
end

function vbox
  switch (count $argv)
  case 0
    ssh -p 2222 -o ForwardX11=yes -o ForwardX11Trusted=yes -o ForwardAgent=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=/def/null strika@localhost
  case 1
    VBoxHeadless --startvm $argv[1] &
  end
end

# Ruby on Rails Aliases
function b
  bundle $argv;
end

function pewpew
  bin/rails db:migrate db:test:prepare;
end

function spring
  ./bin/spring;
end

function import_db
  bin/rake db:drop db:create; and mysql aligni_development -u developer -p < ~/aligni-db/latest; and bin/rake db:migrate db:test:prepare
end

function pewpew
  bundle exec rake db:migrate db:test:prepare
end

function console
  bin/rails console
end

function srv
  bin/rails server -b 0.0.0.0
end

# SSH Agent
if set -q SSH_CONNECTION; and not ssh-add -l > /dev/null
  ssh-add
end

# Rbenv
status --is-interactive; and rbenv init - | source
