# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
redshift -l 37.78:-122.41 &
#/usr/bin/rescuetime >/dev/null 2>&1 &
