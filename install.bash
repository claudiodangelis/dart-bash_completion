#!/bin/bash

LIN_OSX_PATH="/etc/bash_completion.d/"

# List of completion files 
DART_CMDS="dart dart2js dartanalyzer dartfmt docgen pub"

if [[ "$OSTYPE" == "linux-gnu" ]] || [[ "$OSTYPE" == "darwin"* ]] ; then
  echo "Installing bash completion for Dart commands..."
  
  # Check if bash-completion is installed 
  if [[ "$OSTYPE" == "linux-gnu" ]] ; then
    # If debian based Linux dist 
    if [ -f /etc/debian_version ]; then
      dpkg -s bash-completion > /dev/null
      if [ $? != 0 ] ; then 
        # Install if not already installed 
        sudo apt-get install -y bash-completion
      fi
    else 
      read -p "Make sure you have the bash-completion package installed before continuing (press enter to continue, Ctrl+C to cancel)"
    fi
  else 
    # TODO: Add check with brew...
    read -p "Make sure you have the bash-completion package installed before continuing (press enter to continue, Ctrl+C to cancel)"
  fi
  
  # Install completion scripts 
  for cmd in $DART_CMDS ; do 
    sudo cp ${cmd} ${LIN_OSX_PATH}
  done
  
  echo "Done!"  
else 
  echo "Unsupported OS"
fi

