![color change example](screenshot.gif)

# every-color

**every-color** is an [Übersicht](https://github.com/felixhageloh/uebersicht) widget. It is a modifiable rectangle that slowly changes color to cover the entire RGB colorspace. In other words, over the course of ~20 days, this widget will display every single color your computer can muster.

every-color uses [unix epoch time](https://en.wikipedia.org/wiki/Unix_time) to set the color, so it shows the same color at the same time over multiple instances and on any computer.

## How it works

every-color works through a fairly simple process. In short, the command:
1. takes the modulus of the current epoch time with respect to the total number of possible RGB colors (i.e. 256^3)
````bash
$(( $(date +%s) % 16777216 ))
````
2. converts that number to hexadecimal format
````bash
$(printf '%x\n' $(( $(date +%s) % 16777216 )))
````
3. echoes it back with a pound symbol
````bash
echo '#'$(printf '%x\n' $(( $(date +%s) % 16777216 )))
````
And then übersicht uses that as the updated background-color of the div.
````coffeescript
update: (output, domEl) ->
  $(domEl).find('.swatch').css backgroundColor: output
````

The faster version differs by calling the epoch time in nanoseconds using `gdate` and then cutting that down to deciseconds.
````bash
$(/usr/local/opt/coreutils/libexec/gnubin/date +%s%N | sed 's/........$//')
````
## Making every-color Run Faster

On it's default settings, every-color takes almost 200 days to cycle through all the colors. That's quite a long time.

This is because the default Apple `date` command only gives time to the nearest second, so colors can only be updated once every second.

**By installing an updated `date` utility, you can make every-color run faster.**

**Specifically, you need to install the `coreutils` package through Homebrew**, which includes an updated version of `date`.

[Here is Homebrew's homepage](https://brew.sh/) which contains the basic instructions for installing Homebrew. Once you have it installed, type **`brew install coreutils`** into the command line and coreutils should be installed.

After that, simply **update the widget's index.coffee by commenting out the default command and then uncommenting the other command.**

This new command makes the colors change 10x faster, meaning it will cycle through every color in about 20 days. 

If you want to mess with it, adding/deleting from the string of periods in the command you can change the speed by factors of 10. The limiting factor will be your monitor's refresh rate.
