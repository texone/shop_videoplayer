# shop_videoplayer
repository for a processing video player on the raspberry

## how to create autostart 

Based on this tutorial https://electricnoodlebox.wordpress.com/tutorials/processing-raspberry-pi-auto-run-a-sketch-on-boot/

1. Save your sketch somewhere straight forward in your home folder – the sketchbook folder for Processing is an obvious choice. Make a note of the file path. e.g /home/pi/sketchbook/mySketch

2. Open terminal and use nano to create a new text file, type the following lines in terminal, name the file as you wish, this will be saved in your current directory so I would suggest making the directory your home folder:

```bash
cd ~
sudo nano myScript.sh
```

3. In this new text file, we are going to include a script, albeit a basic one that is just a single line. This will instruct the java executable that is bundled with Processing to run your sketch. Hopefully that is pretty self explanatory, the script says “with processing java, find this sketch, run”. Once you have done this, press ctrl+x to save the file. Write the following line in the text file:

```bash
processing-java –sketch=/home/pi/sketchbook/mySketch –run
```

4. Before we go on, we can test our script. This will probably take a couple of seconds, but if successful then you should see your sketch run in a new window. If you are successful, then press esc to close the sketch and move on to the next step. Enter the following line in Terminal:

```bash
myScript.sh
```

5. Next we need to edit a config file that determines what the x-session does on boot, we want to tell it to run our script when it is ready. The file that opens will probably have a couple of basic lines in it already. First use nano to open the file:

```bash
sudo nano ~/.config/lxsession/LXDE-pi/autostart
```

6. On a new line at the bottom of the file, enter the following text:

```bash
@bash /home/pi/myScript.sh
```

7. Press ctrl+x to save your changes, do not rename this file!

8. Now, hopefully you are done! Test that your script works by rebooting your Pi, you can do this in Terminal with:

```bash
sudo reboot
```

Now the rest is up to you! As far as I have found, all features that are functional in Processing 3 on the Pi will be functional in the java executable. Have fun and feel free to leave comments in the section below.
