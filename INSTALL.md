# INSTALL 

* Download latest release (https://github.com/soccin/RNAi_App/archive/v1.2.3.zip)

* Then copy to Applications folder and set permissions

```bash
mv RNAi_App-1.2.3 /Applications
sudo chmod -R uog+rX /Applications/RNAi_App-1.2.3
```

* Then need to fix `PATH` for each user. For each user do:

```bash
sudo su - <USER>
/Applications/RNAi_App-1.2.3/misc/install.sh
```

