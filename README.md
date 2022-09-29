# USB-Raid-Framework

![Logo](https://github.com/I-Am-Jakoby/hak5-submissions/blob/main/Assets/logo-170-px.png?raw=true)

<img src="https://media.giphy.com/media/VgCDAzcKvsR6OM0uWg/giphy.gif" width="50"> 

<h1 align="center">
  <a href="https://git.io/typing-svg">
    <img src="https://readme-typing-svg.herokuapp.com/?lines=Welcome+to+the;USB+Raid+Framework!+😈&center=true&size=30">
  </a>
</h1>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#Description">Description</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#Contributing">Contributing</a></li>
    <li><a href="#Version-History">Version History</a></li>
    <li><a href="#Contact">Contact</a></li>
    <li><a href="#Acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<div align=left>
<img align="center" src="https://github.com/I-Am-Jakoby/I-Am-Jakoby/blob/main/Assets/usb-raid.png" width="300">
  <p>YouTube Tutorial</p>
</div>


An offensive security framework that weaponizes any standard USB Device 

## Description

This framework is designed to be implemented on any standard USB Drive 

This attack takes advantage of the ability to run powershell commands from inside a .lnk file.

The following video is another example of how this method may be implemented. 

<p align="left">
      <a href="https://www.youtube.com/watch?v=sOLIdqpzrW4">
        <img src=https://github.com/I-Am-Jakoby/hak5-submissions/raw/main/Assets/Shortcut-Jacker/sjtn.png width="300" alt="Python" />
      </a>
      <br>YouTube Tutorial	
</p>

After downloading the .Zip file and placing the contents on your USB drive you'll want to delete the ReadMe.md and LICENSE file 

Next you will want to make sure the `h` directory and `s1.bat` file have the hidden attribute. You do not want these files to be visible to your target. 

Now in the Root directory you should have 3 files

* A hidden `h` directory - Folder containing all the files needed to be moved onto your targets system, and the initial script to be run 
* A hidden `s1.bat` file - A bat file called on by the shortcut to move all the above files and execute the initial script
* A `contacts.txt` .lnk file (shortcut) - a shortcut phishing file disguised as a text file to entice your target to open it

The `h` directory will contain 5 more files 

* `contacts.txt` - the actual text file to be opened by the shortcut to convince your target they just opened a regular txt file 
* `exception.ps1` - A script containing a UAC bypass to open an admin window and add the targets C:/ drive to the windows defender exclusion list. This will prevent further tools you download from being flagged by defender
* `intitial.ps1` - This is a script that will be ran one time when the target open the fake text file 
* `persist.cmd` - This is a file added to the start up folder to achieve persistence. It will call on the `persist.ps1` file stored in the AppData directory
* `persist.ps1` - This is the file that will contain your script that will be run everytime the target boots up their computer 

## Getting Started

Taking advantage of a little known secret we will be running powershell code embedded in a shortcuts target field as seen in the image below. 

This has a few advantages. 
* You can't run a regular powershell script by double clicking on it. It will only open it with your default text editor. It will run from a shortcut
* External powershell scripts can not be run without triggering the UAC prompt. We use the shortcut to open their own powershell console we run it from to trick their sytem into thinking it is from a native script. 

This is the code in that target text box: 

```C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -NonI -W H -ep bypass ".((gwmi win32_volume -f 'label=''259''').Name+'s1.bat')```

<div align=left>
<img align="center" src="https://github.com/I-Am-Jakoby/I-Am-Jakoby/blob/main/Assets/USB-Raid/lnk.properties.png" width="300">
  <p>YouTube Tutorial</p>
</div>

This code will open a powershell console and bypass the execution policy and run our bat file after identifying what drive letter our USB is. 

In order for it to find our drive we must change the label of our USB to match the label used in our code in the target text box. 

For this example notice the label in the image below and the code above are both `259`. This can be changed but they both need to match.

<div align=left>
<img align="center" src="https://github.com/I-Am-Jakoby/I-Am-Jakoby/blob/main/Assets/USB-Raid/label-259.png" width="300">
  <p>YouTube Tutorial</p>
</div>


### Executing program

Once you have all of the above set up you are ready to execute this attack vector

You will want to have 2 payloads ready. 
* Your initial payload to be run once this attack has been initiated.
  
  I use my [ADV Recon](https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/OMG/Payloads/OMG-ADV-Recon) payload to gather as much info on my target as possible

* The payload you want to be run with persistence at each reboot on your targets PC (This payload will vary depending on your goal)

Once this attack vector has been initiated by your target opening the fake text file link it will open the real hidden txt file in the `h` directory to avoid suspicion

The shortcut will then run the `s1.bat` file that will initialize the rest of your scripts. 

First your initial payload will run followed by moving your `persistance.bat` file to the start up directory. 

Then your `persistence.ps1` file will be added to the AppData folder and run once now and again at each start up. 

Finally the real hidden text file will replace your fake txt shortcut link and delete the rest of the files to avoid further investigation into your USB drive

In a real world scenario you would also want to make the USB drive look realistic with a photo album or something else to entice your target to get in contact with you by clicking on the fake contacts.txt file

### Dependencies

* An internet connection
* Windows 10,11

<p align="right">(<a href="#top">back to top</a>)</p>


<p align="right">(<a href="#top">back to top</a>)</p>

## Contributing

All contributors names will be listed here

I am Jakoby

<p align="right">(<a href="#top">back to top</a>)</p>

## Version History

* 0.1
    * Initial Release

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

<h2 align="center">📱 My Socials 📱</h2>
<div align=center>
<table>
  <tr>
    <td align="center" width="96">
      <a href="https://youtube.com/c/IamJakoby?sub_confirmation=1">
        <img src=https://github.com/I-Am-Jakoby/I-Am-Jakoby/blob/main/img/youtube-svgrepo-com.svg width="48" height="48" alt="C#" />
      </a>
      <br>YouTube
    </td>
    <td align="center" width="96">
      <a href="https://twitter.com/I_Am_Jakoby">
        <img src=https://github.com/I-Am-Jakoby/I-Am-Jakoby/blob/main/img/twitter.png width="48" height="48" alt="Python" />
      </a>
      <br>Twitter
    </td>
    <td align="center" width="96">
      <a href="https://www.instagram.com/i_am_jakoby/">
        <img src=https://github.com/I-Am-Jakoby/I-Am-Jakoby/blob/main/img/insta.png width="48" height="48" alt="Golang" />
      </a>
      <br>Instagram
    </td>
    <td align="center" width="96">
      <a href="https://discord.gg/MYYER2ZcJF">
        <img src=https://github.com/I-Am-Jakoby/I-Am-Jakoby/blob/main/img/discord-v2-svgrepo-com.svg width="48" height="48" alt="Jsonnet" />
      </a>
      <br>Discord
    </td>
  </tr>
</table>
</div>

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Hak5](https://hak5.org/)
* [MG](https://github.com/OMG-MG)

<p align="right">(<a href="#top">back to top</a>)</p>

<p align="center">
        <img src="https://raw.githubusercontent.com/bornmay/bornmay/Update/svg/Bottom.svg" alt="Github Stats" />
</p>
