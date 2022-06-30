PATH="$PATH:/usr/local/llvm-9.0.0/bin"
PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
PATH="$PATH:/usr/local/arm/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/bin"
PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/.TinyTeX/bin/x86_64-linux"
PATH="$PATH:$HOME/.local/bin/"
PATH="$PATH:/opt/Questasim/questasim/linux_x86_64/"
PATH="$PATH:/home/lilacsat/.cargo/bin"
PATH="$PATH:/home/lilacsat/bin/"
PATH="$PATH:/usr/local/go/bin"

LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib/x86_64-linux-gnu/"
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu/"
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/WindTerm_2.3.1/lib/"
export PATH
export LD_LIBRARY_PATH

export NODE_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/

# for Ranger
export RANGER_LOAD_DEFAULT_RC FALSE
export VISUAL=vim
export EDITOR=vim
export RANGER_ZLUA="/home/lilacsat/.local/share/zinit/plugins/skywind3000---z.lua/z.lua"


export LM_LICENSE_FILE=/opt/Questasim/mentor.dat
export MGLS_LICENSE_FILE=/opt/Questasim/mentor.dat
alias licm="lmgrd -c /opt/Questasim/mentor.dat"
