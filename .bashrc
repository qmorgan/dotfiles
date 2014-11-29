# use textmate as default editor 
export EDITOR="/usr/local/bin/mate -w"

# forcing you to use anaconda or explicitly virtualenv first
function virtualenv_message {
	echo "Adam sayz:"
	echo "Use initanaconda or initvirtualenvwrapper first."
}

alias virtualenv=virtualenv_message

# wrapped anaconda in a function to keep it separate
function condainit {
	unalias virtualenv
	# added by Anaconda 2.1.0 installer
	export PATH="/Users/qmorgan/anaconda/bin:$PATH"
	
	# useful aliases from travis oliphant 
	alias workon='source activate'
	alias workoff='source deactivate'
	alias virtualenv='conda create -p'
}

# wrapped virtualenvwrapper in a function to keep it separate
function virtualenvinit {
	unalias virtualenv
	# setup virtualenvwrapper paths
	export WORKON_HOME=$HOME/.virtualenvs
	export PROJECT_HOME=$HOME/projects
	export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
	source /usr/local/bin/virtualenvwrapper_lazy.sh
}

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# allow a global 'gpip' if we do infact want global install
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# don't allow easy_install
easy_install_message(){
	echo "Adam sayz:"
	echo "Use pip. Use gpip if really want global install."
	echo "Try brew instead, or conda if using anaconda distribution."
}
alias easy_install=easy_install_message

# Syntax highlighting with liquidprompt
source ~/liquidprompt/liquidprompt
# Can change settings in config file: ~/.liquidpromptrc
