function ssh
  switch $argv[1]
  case "*.amazonaws.com"
    env TERM=xterm /usr/bin/ssh $argv
  case "ubuntu@"
    env TERM=xterm /usr/bin/ssh $argv
  case "*"
    /usr/bin/ssh/$argv
  end
end

