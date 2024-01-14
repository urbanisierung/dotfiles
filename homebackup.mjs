#!/usr/bin/env zx

// https://github.com/google/zx

const PASS = process.env.ZIP_PASS;

if (!PASS || PASS.length === 0) {
  throw new Error(`Encryption Password not set`);
}

const HOME = `/home/adam`;

const HOME_CONFIG_BASE = `.config`;

const TARGET = `${HOME}/Documents/backup/${new Date()
  .toISOString()
  .substring(0, 16)}-backup.zip`;

// FOLDERS

const CONFIG_FOLDERS = [
  `envvars`,
  `fcheatsheets`,
  `gcloud`,
  `i3`,
  `i3-resurrect`,
  `rofi`,
  `rclone`,
  // `stripe`,
  // `firebase`,
];

const HOME_FOLDERS = [`.config/keys`, `.ssh`, `.gnupg`];

// FILES

const HOME_FILES = [
  `.gitconfig`, // git
  `.npmrc`, // npm
  `.zsh_history`, // zsh
  `.zshrc`, // zsh
  `.config/Code/User/keybindings.json`, // vscode
  `.config/Code/User/settings.json`, // vscode
  `.config/google-chrome/Default/Bookmarks`, // google chrome bookmarks
  `.local/share/atuin/history.db`, // atuin
  `.config/atuin/config.toml`, // atuin
  `.config/starship.toml`, // starship
];

// ZIP FILES

const folders = [
  ...CONFIG_FOLDERS.map((folder) => `${HOME}/${HOME_CONFIG_BASE}/${folder}`),
  ...HOME_FOLDERS.map((folder) => `${HOME}/${folder}`),
];
const files = [...HOME_FILES.map((file) => `${HOME}/${file}`)];

for (const file of files) {
  console.log(`zip: adding ${file}`);
  await $`7za a -spf -p${PASS} ${TARGET} ${file}`;
}

for (const folder of folders) {
  console.log(`zip: adding ${folder}`);
  try {
    await $`7za a -spf -r -p${PASS} ${TARGET} ${folder}`;
  } catch (error) {
    console.log(`Failed to add folder ${folder}`);
  }
}

// upload backup

await $`rclone copy ${TARGET} gdrive:dev/backup/`;
