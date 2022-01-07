source ~/.config/fish/alias.fish
source ~/.config/fish/functions.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
    # set gopath and gobin
    set -x GOPATH (go env GOPATH)
    set -x PATH $GOPATH/bin $PATH
    # set yarn
    set -x PATH (yarn global bin) $PATH
    # set mix
    set -x PATH $HOME/.mix $PATH
    # Alias
    alias hp="https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890 "

    # starship
    starship init fish | source
end
