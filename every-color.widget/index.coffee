# There are two commands included with this: a default and a faster version.

# This command works by default on macOS.
# It will take almost 200 days to cycle through every color.

# DEFAULT COMMAND:
command: "echo '#'$(printf '%x\n' $(( $(date +%s) % 16777216)))"


# The below command cycles through every color in about 20 days. 
# It updates every TENTH of a second.
# It requires coreutils to be installed on your Mac.
# If you have homebrew simply type "brew install coreutils" into the terminal.
# Detailed instructions and explanation can be found at https://git.io/vhWtT

# FASTER COMMAND:
#command: "echo '#'$(printf '%x\n' $(( $(/usr/local/opt/coreutils/libexec/gnubin/date +%s%N | sed 's/........$//') % 16777216)))"


# Refreshes every 100 miliseconds / tenth of a second.
refreshFrequency: 100


render: (_) -> """
  <div class='swatch'></div>
"""


update: (output, domEl) ->
  $(domEl).find('.swatch').css backgroundColor: output


# every-color by default is behind most widgets. You can change this by changing the z-index.
style: """
  top: 0px
  left: 0px
  .swatch
    z-index: -5
    width: 500px
    height: 500px
"""
