# every-color

**every-color** is an [Übersicht](https://github.com/felixhageloh/uebersicht) widget. It is a rectangle that slowly changes color to cover the entire RGB colorspace. In other words, over the course of ~20 days, this widget will display every single color your computer can muster.

every-color uses [unix epoch time](https://en.wikipedia.org/wiki/Unix_time) to set the color, so it should show the same color at the same time on any computer.

## Making every-color Run Faster

On it's default settings, every-color takes almost 200 days to cycle through all the colors. That's quite a long time.

This is because every-color works by taking the current epoch time and calculating the RGB value from it. The default Apple `date` command only gives time to the nearest second so colors can only be updated once every second.

**By installing an updated `date` utility, you can make every-color run faster.**

**Specifically, you need to install the `coreutils` package through Homebrew**, which includes an updated version of `date`.

[Here is Homebrew's homepage](https://brew.sh/) which contains the basic instructions for installing Homebrew. Once you have it installed, type `brew install coreutils` into the command line and coreutils should be installed.

After that, simply **update the widget's index.coffee by commenting out the default command and then uncommenting the other command.**

This new command changes the colors 10x faster. 

By adding/deleting from the string of periods in the command you can change the speed by factors of 10. The limiting factor will probably be your monitor's refresh rate.
