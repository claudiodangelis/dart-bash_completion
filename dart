_dart() {
    # TODO: complete only *.dart files
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Options
    opts="--help --checked --package-root --version"

    if [[ ${cur} == -* ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    elif [[ ${prev} != *.dart ]] ; then
        local dart_scripts=$(for d in `ls  -1 *.dart 2>/dev/null`; do echo ${d}; done)
        COMPREPLY=( $(compgen -W "${dart_scripts}" -- ${cur}) )
    else
        COMPREPLY=()
        return 0
    fi
}

complete -o default -F _dart dart
