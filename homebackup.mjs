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
  `firebase`,
  `gcloud`,
  `i3`,
  `i3-resurrect`,
  `rofi`,
  `stripe`,
];

const HOME_FOLDERS = [`.config/keys`, `.ssh`];

// FILES

const HOME_FILES = [
  `.npmrc`,
  `.zsh_history`,
  `.zshrc`,
  `.config/Code/User/keybindings.json`,
  `.config/Code/User/settings.json`,
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
  await $`7za a -spf -r -p${PASS} ${TARGET} ${folder}`;
}
