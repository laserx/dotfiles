source ~/.config/fish/aliases.fish
source ~/.config/fish/functions.fish



if status is-interactive
    # Commands to run in interactive sessions can go here
    # set gopath and gobin
    set -Ux GOPATH (go env GOPATH)
    set -Ux PATH $GOPATH/bin $PATH
    # set yarn
    set -Ux PATH (yarn global bin) $PATH
    # set mix
    set -Ux PATH $HOME/.mix $PATH
    # set XDG_CONFIG_HOME
    set -Ux XDG_CONFIG_HOME $HOME/.config
    
    eval (cs install --env)
    eval (cs java --jvm adopt:1.8.0-292 --env)

    set -Ux fish_tmux_default_session_name "λ"
    set -Ux fish_tmux_config $XDG_CONFIG_HOME/tmux/tmux.conf

    # starship
    starship init fish | source
    
    # zoxide
    zoxide init fish | source

    if not test -d ~/.tmux/plugins/tpm
        command git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    end
end
