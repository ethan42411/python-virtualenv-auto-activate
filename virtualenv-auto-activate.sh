#!/bin/bash
# python-virtualenv-auto-activate
# The virtualenv will be activated automatically when you enter the directory.

_virtualenv_auto_activate() {
  if [ -e "bin/activate" ]; then
    # Check to see if already activated to avoid redundant activating
    if [ "$VIRTUAL_ENV" = "" ]; then
      _VENV_NAME=$(basename `pwd`)
      echo Activating virtualenv \"$_VENV_NAME\"...
      VIRTUAL_ENV_DISABLE_PROMPT=1
      source bin/activate
      _OLD_VIRTUAL_PS1="$PS1"
      PS1="($_VENV_NAME)$PS1"
      export PS1
    fi
  else
    if [ "$VIRTUAL_ENV" != "" ]; then
      if [[ "$PWD"/ != "$VIRTUAL_ENV"/* ]] ; then
        echo deactivating virtualenv
        deactivate
      fi
    fi
  fi
}

export PROMPT_COMMAND=_virtualenv_auto_activate