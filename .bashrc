# Syntax highlighting with liquidprompt
source ~/liquidprompt/liquidprompt
# Can change settings in config file: ~/.liquidpromptrc

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,environments,exports,functions,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;