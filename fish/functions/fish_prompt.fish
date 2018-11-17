function fish_prompt --description 'Write out the prompt'
	set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
    set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
    set -l prompt_symbol ''
    switch "$USER"
        case root toor
            set prompt_symbol '#'
        case '*'
            set prompt_symbol '$'
    end
    printf "%s[%s]%s " (set_color -o green) $USER (set_color normal)
    printf "[%s%s%s]" (set_color -o cyan) $pwd (set_color normal)
    printf "%s"  (__fish_git_prompt)
    printf "\n%s " $prompt_symbol
end
