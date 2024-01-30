# urbanisierungs dotfiles

```bash
    .___      __    _____.__.__
  __| _/_____/  |__/ ____\__|  |   ____   ______
 / __ |/  _ \   __\   __\|  |  | _/ __ \ /  ___/
/ /_/ (  <_> )  |  |  |  |  |  |_\  ___/ \___ \
\____ |\____/|__|  |__|  |__|____/\___  >____  >
     \/                               \/     \/
```

Config files for i3, zsh and some scripts. Furthermore useful apps I use all the time.

## sync config files

get all config files:

```bash
./sync.sh get
```

copy all config files to system:

```bash
./sync.sh push
```

## AMD driver

- Drivers: [https://www.amd.com/en/support/linux-drivers](https://www.amd.com/en/support/linux-drivers)
- Install: `sudo dpkg -i amdgpu-install_*.deb`
- `amdgpu-install --usecase=graphics,opencl --vulkan=amdvlk --opencl=legacy`

## Tools

### [VSCode](https://code.visualstudio.com/) - the most powerful IDE I know

```bash
sudo apt update
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code
```

- Extensions
  - [Peacock](https://github.com/johnpapa/vscode-peacock) - colorize different projects
  - [Bracket Pair Colorizer](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2)
  - [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph)
  - Better writing:
    - [AlexJS - doc linter](https://alexjs.com/)
    - [Write Good Linter](https://marketplace.visualstudio.com/items?itemName=travisthetechie.write-good-linter)
    - [Vale](https://marketplace.visualstudio.com/items?itemName=testthedocs.vale)
  - [Import Cost](https://marketplace.visualstudio.com/items?itemName=wix.vscode-import-cost)
  - [NodeJS Extension Pack](https://marketplace.visualstudio.com/items?itemName=waderyan.nodejs-extension-pack)
  - [Polacode](https://marketplace.visualstudio.com/items?itemName=pnp.polacode)
  - [Cloud Code](https://cloud.google.com/code/docs/vscode/quickstart)
  - [Code Tour](https://github.com/vsls-contrib/codetour)
  - [Vuln Cost](https://snyk.io/security-scanner-vuln-cost/)
  - [i18n-ally](https://github.com/antfu/i18n-ally)
- Themes:
  - [Cobalt 2](https://marketplace.visualstudio.com/items?itemName=wesbos.theme-cobalt2)
  - [Panda](https://marketplace.visualstudio.com/items?itemName=tinkertrain.theme-panda)
  - [Dracula](https://draculatheme.com/visual-studio-code/) HOT
  - [Yonce](https://yoncetheme.com/)
  - [serendipity](https://wvsc.dev/)
- Fonts:

  - [Dank Mono](https://dank.sh/)
  - [Fira Code](https://github.com/tonsky/FiraCode)
  - [JetBrains Mono](https://www.jetbrains.com/lp/mono)

  ```json
    "editor.fontFamily": "JetBrains Mono",
    "editor.fontSize": 14,
    "editor.fontLigatures": true
  ```

### Frameworks and tools

- [Teleport](https://goteleport.com)

  - Installation: [https://goteleport.com/docs/installation/](https://goteleport.com/docs/installation/)

- [Node](https://nodejs.org/en/) - (hopefully) no description needed

```bash
sudo apt update
sudo apt install nodejs
sudo apt install npm
```

- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) - K8s command line tools

```bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

- Kubectl plugins:

  - [Kubectl tree](https://github.com/ahmetb/kubectl-tree): browse Kubernetes object hierarchies as a tree

- [gcloud](https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu)

```bash
# Create environment variable for correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

# Add the Cloud SDK distribution URI as a package source
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Update the package list and install the Cloud SDK
sudo apt-get update && sudo apt-get install google-cloud-sdk
```

- [docker](https://www.docker.com/)

```bash
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

- [docker compose](https://docs.docker.com/compose/install/)

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

- python(3) and pip(3)
- [insomnia](https://insomnia.rest/download/#ubuntu)

```bash
sudo snap install insomnia
```

- Linter for TypeScript/Node: [Aurora](https://github.com/ScreamZ/aurora)

## System

- [i3](https://i3wm.org/) - the very very best window manager for linux
  - i3blocks, rofi, aptitude
    - use `rofi-theme-selector` to change rofi theme
  - i3blocks [booklets](https://vivien.github.io/i3blocks/blocklets)
  - [my i3blocks booklets](https://github.com/urbanisierung/i3blocks-booklets)
- [zsh](http://www.zsh.org/)
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
- [zinit](https://github.com/zdharma/zinit)
- [hub cli](https://hub.github.com/)
- [GitHub CLI](https://cli.github.com/)
- 7z: `sudo apt-get install p7zip-full`
- pulseaudio
- pavucontrol
- pactl
- blueman
- [gtop](https://github.com/aksakalli/gtop) - system monitoring
- [rclone](https://rclone.org/) - backup files to remote service, like gdrive
- [neofetch](https://github.com/dylanaraps/neofetch) - information tool
- [pywal](https://github.com/dylanaraps/pywal) - generate and change color schemes
- [ktop](https://github.com/ynqa/ktop) - top for k8s
- [arandr](https://christian.amsuess.com/tools/arandr/) - simple gui for xrandr
- [tig](https://github.com/jonas/tig) - text mode interface for git
- [ngrok](https://ngrok.com/) - tunnel your local project easily
- [svgo](https://github.com/svg/svgo) - svg optimizer
- [tldr](https://tldr.sh/) - better man pages
- [gitmoji](https://github.com/carloscuesta/gitmoji-cli)
- [fkill](https://github.com/sindresorhus/fkill-cli) - fabulously kill processes
- [albert](https://albertlauncher.github.io/) - access everything
- [copyQ](https://github.com/hluk/CopyQ) - advanced clipboard
- [curlmail](https://curlmail.co/) - curl you a notify
- [asciinema](https://github.com/asciinema/asciinema) - terminal session recorder ([gifcast](https://dstein64.github.io/gifcast/) to create gif)
- [kubelens](https://github.com/lensapp/lens) - IDE for kubernetes
- [flameshot](https://flameshot.js.org/#/) - screenshot tool
- [git-stats](https://github.com/IonicaBizau/git-stats) - git hub stats
- [lighthouse](https://www.npmjs.com/package/lighthouse) - lighthouse via cli
- [fzf](https://github.com/junegunn/fzf) - general-purpose command-line fuzzy finder
- [ncdu](https://dev.yorhel.nl/ncdu) - disk usage analyzer
- [fd](https://github.com/sharkdp/fd) - better `find`
- [tmpmail](https://github.com/sdushantha/tmpmail) - temp mail addresses via command line
- [icloud-for-linux](https://snapcraft.io/install/icloud-for-linux/ubuntu) - icloud for linux: makes it ieasier to use the icloud suite under linux
- [font-awesome]: `sudo apt install fonts-font-awesome` - needed for icons in i3blocks
- [atuin](https://atuin.sh/) - magic bash search
- [starship](https://starship.rs/) - nice terminal addition
- [nerdfonts](https://www.nerdfonts.com/) - nerd fonts
- [nushell](https://www.nushell.sh/) - adds useful pipelines to your terminal
- [exa](https://github.com/ogham/exa) - better ls
- [translate-shell](https://github.com/soimort/translate-shell) - translations in your shell
- [crow-translate](https://github.com/crow-translate/crow-translate) - translations in your shell - used with rofi

### login screen background

```bash
wget -qO - https://github.com/PRATAP-KUMAR/ubuntu-gdm-set-background/archive/main.tar.gz | tar zx --strip-components=1 ubuntu-gdm-set-background-main/ubuntu-gdm-set-bac
sudo ./ubuntu-gdm-set-background --image /home/user/backgrounds/image.jpg
```

## Mac

- [1Password](https://1password.com/downloads/mac/)
- [Calibbre](https://calibre-ebook.com/)
- [Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12) - alternative for [Caffeine](http://lightheadsw.com/caffeine/)
- [Disk Graph](https://apps.apple.com/de/app/disk-graph/id697942581?mt=12)
- [Affinity Photo](https://apps.apple.com/de/app/affinity-photo/id824183456?mt=12)
- [Affinity Designer](https://apps.apple.com/us/app/affinity-designer/id824171161?mt=12)
- [Dropbox](https://www.dropbox.com/downloading)
- [FileZilla](https://filezilla-project.org/download.php?platform=osx)
- [Ledger Live](https://shop.ledger.com/pages/ledger-live)
- [Notion](https://www.notion.so/desktop)
- [Outbank](https://apps.apple.com/de/app/outbank-alle-banken-und-konten/id1094255754?ls=1&mt=12)
- [Sonos](http://www.sonos.com/redir/controller_software_mac)
- [VLC](https://www.videolan.org/vlc/download-macosx.html)
- [VSCode](https://code.visualstudio.com/download)
- [Brew](https://brew.sh/)
- [Vanilla](https://matthewpalmer.net/vanilla/)
- [Licecap](https://www.cockos.com/licecap/) - create gifs
- [Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12)

## Media

- feh

## Browser

- chrome
- brave

## Colab

- slack
- zoom

## Fonts

- https://www.zetafonts.com/hagrid#
- https://www.cufonfonts.com/font/segoe-pro
