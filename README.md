## cheat.sh_plus_trans
[![Build Status](https://travis-ci.org/nixscript/cheat.sh_plus_trans.svg?branch=master)](https://travis-ci.org/nixscript/cheat.sh_plus_trans)
[![GitHub License](https://img.shields.io/github/license/nixscript/cheat.sh_plus_trans.svg)](https://github.com/nixscript/cheat.sh_plus_trans/blob/master/LICENSE.md)
[![GitHub Release](https://img.shields.io/github/release/nixscript/cheat.sh_plus_trans.svg)](https://github.com/nixscript/cheat.sh_plus_trans/releases)

Bash script for translating tips from [cheat.sh](http://cheat.sh/)

### Dependencies

+ curl
+ [translate-shell](https://github.com/soimort/translate-shell)

### Install
```
sudo make install
```

### Uninstall
```
sudo make uninstall
```

### Usage
```markdown
# Help tip about a command
$ cheat.sh commandname

# Find help tips
$ cheat.sh keyword

# Colored result
$ cheat.sh -T commandname
```

Go to [nixscript.ru/tips](https://nixscript.ru/tips) for get some tips! 
