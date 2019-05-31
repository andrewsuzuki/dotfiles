# Misc functions

# mkdir, then cd
mcd()
{
	if [ ${1} ]; then
		mkdir ${1}
		cd ${1}
	fi
}

# fzf helpers
# fo [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
# Modified version where you can press
#   - CTRL-O to open with `xdg-open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
	local out file key
	IFS=$'\n' out=($(FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -g \"\"" fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
	key=$(head -1 <<< "$out")
	file=$(head -2 <<< "$out" | tail -1)
	if [ -n "$file" ]; then
		[ "$key" = ctrl-o ] && xdg-open "$file" || ${EDITOR:-nvim} "$file"
	fi
}
