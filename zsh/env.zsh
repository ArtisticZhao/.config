PATH="$PATH:/usr/local/llvm-9.0.0/bin"
PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
PATH="$PATH:/usr/local/arm/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/bin"
PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/.TinyTeX/bin/x86_64-linux"
PATH="$PATH:$HOME/.local/bin/"
PATH="$PATH:/opt/Questasim/questasim/linux_x86_64/"
PATH="$PATH:/home/zyh/.cargo/bin"

LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib/x86_64-linux-gnu/"
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu/"
export PATH
export LD_LIBRARY_PATH

export NODE_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
export RANGER_LOAD_DEFAULT_RC FALSE

export LM_LICENSE_FILE=/home/zyh/mentor.dat
export MGLS_LICENSE_FILE=/home/zyh/mentor.dat
alias licm="lmgrd -c /home/zyh/mentor.dat"
