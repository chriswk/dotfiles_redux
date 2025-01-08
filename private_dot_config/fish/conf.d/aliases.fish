abbr -a yr 'cal -y'
abbr -a c cargo
abbr -a k kubectl
abbr -a e nvim
abbr -a m make
abbr -a o xdg-open
abbr -a g git
abbr -a gc 'git checkout'
abbr -a ga 'git add -p'
abbr -a vimdiff 'nvim -d'
abbr -a ct 'cargo t'
abbr -a gt 'gradle test'
abbr -a amz 'env AWS_SECRET_ACCESS_KEY=(lpass show -G mercellawssecret --password)'
abbr -a ais "aws ec2 describe-instances | jq '.Reservations[] | .Instances[] | {iid: .InstanceId, type: .InstanceType, key: .KeyName, state: State.Name, host:.PublicDnsName}'"
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a pr 'gh pr create -t (git show -s --format=%s HEAD) -b (git show -s --format=%B HEAD | tail -n+3)'
