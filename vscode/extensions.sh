#!/bin/bash

code --list-extensions >> ./vs_code_extensions_list.txt
# code --list-extensions >>vs_code_extensions_list.txt

# install:
# cat vs_code_extensions_list.txt | xargs -n 1 code --install-extension
