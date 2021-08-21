#!/usr/bin/env zx

// https://github.com/google/zx

const HOME = `/home/adam`;
const TARGET = `${HOME}/Downloads/backup.zip`;

const folders = [`${HOME}/.config/fcheatsheets`, `${HOME}/.config/firebase`];

for (const folder of folders) {
  await $`zip -r ${TARGET} ${folder}`;
}
