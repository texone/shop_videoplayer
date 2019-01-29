# shop_videoplayer
repository for a processing video player on the raspberry

## projector control

In this repo you also find a processing example for projector control over serial. To control the projector a ftdi chipset based usb to serial adapter and a null modem cable to connect it to the projector are required. For an acer projector these are the possible control codes.

* `OKOKOKOKOK\r`	Power On
* `* 0 IR 001\r`	Power On
* `* 0 IR 002\r`	Power Off

* `* 0 IR 015\r`	Source Analog RGB for D-sub
* `* 0 IR 016\r`	Source Digital RGB(DVI)
* `* 0 IR 017\r`	Source PbPr for D-sub
* `* 0 IR 018\r`	Source S-Video
* `* 0 IR 019\r`	Source Composite Video
* `* 0 IR 020\r`	Source Component Video
* `* 0 IR 050\r`	Source HDMI

* `* 0 IR 004\r`	Keystone
* `* 0 IR 006\r`	Mute
* `* 0 IR 007\r`	Freeze
* `* 0 IR 008\r`	Menu
* `* 0 IR 009\r`	Up
* `* 0 IR 010\r`	Down
* `* 0 IR 011\r`	Right
* `* 0 IR 012\r`	Left
* `* 0 IR 013\r`	Enter
* `* 0 IR 014\r`	Re-Sync
* `* 0 IR 021\r`	Aspect ratio 16:9
* `* 0 IR 022\r`	Aspect ratio 4:3
* `* 0 IR 023\r`	Volume +
* `* 0 IR 024\r`	Volume –
* `* 0 IR 025\r`	Brightness
* `* 0 IR 026\r`	Contrast
* `* 0 IR 027\r`	Color Temperature
* `* 0 IR 028\r`	Source Analog RGB for DVI Port(DVI-A)
* `* 0 IR 029\r`	Source Analog YPbPr for DVI Port
* `* 0 IR 030\r`	Hide
* `* 0 IR 031\r`	Source
* `* 0 IR 032\r`	Video: Color saturation adjustment
* `* 0 IR 033\r`	Video: Hue adjustment
* `* 0 IR 034\r`	Video: Sharpness adjustment
* `* 0 IR 035\r`	Query Model name
* `* 0 IR 036\r`	Query Native display resolution
* `* 0 IR 037\r`	Query company name
* `* 0 IR 042\r`	Keystone Up
* `* 0 IR 043\r`	Keystone Down
* `* 0 IR 046\r`	Zoom
* `* 0 IR 049\r`	Language
* `* 0 IR 051\r`	ECO mode
* `* 0 IR 052\r`	Query ECO mode
* `* 0 Lamp ?\r`	Query the lamp ON/OFF
* `* 0 Lamp\r`	Query the lamp hours
* `* 0 Src ?\r`	Query source input type

## set time

```bash
sudo date -s '2014-12-25 12:34:56'
```

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
