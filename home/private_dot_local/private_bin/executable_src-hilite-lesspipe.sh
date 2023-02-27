#! /bin/sh

for source in "$@"; do
    case $source in
	*ChangeLog|*changelog) 
        source-highlight --failsafe -f esc --lang-def=changelog.lang --style-file=esc.style -i "$source" ;;
	*Makefile|*makefile) 
        source-highlight --failsafe -f esc --lang-def=makefile.lang --style-file=esc.style -i "$source" ;;
	*PKGBUILD) 
        source-highlight --failsafe -f esc --lang-def=sh.lang --style-file=esc.style -i "$source" ;;
	*.zsh)
        source-highlight --failsafe -f esc --lang-def=zsh.lang --style-file=esc.style -i "$source" ;;
	*.tar|*.tgz|*.gz|*.bz2|*.xz)
        lesspipe "$source" ;;
        *) source-highlight --failsafe --infer-lang -f esc --style-file=esc.style -i "$source" ;;
    esac
done
