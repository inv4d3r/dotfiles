#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# opam configuration
test -r /home/silgurf/.opam/opam-init/init.sh && . /home/silgurf/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
