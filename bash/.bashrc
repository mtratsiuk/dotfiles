# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH="$HOME/.local/bin:$HOME/bin:$HOME/.deno/bin:/usr/local/go/bin:$HOME/go/bin:$PATH"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias lzg="lazygit"

pgadmin() {
    mkdir -p ~/.pgadmin
    docker run --rm -d --network host -v ~/.pgadmin:/pgadmin thajeztah/pgadmin4
}

webm_to_mp4() {
    ffmpeg -i "$1" "$2"
}

# based on https://girishjoshi.io/post/using-dslr-camera-as-webcam-on-linux/
# dnf install gphoto2 v4l2loopback
camera() {
    gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -f v4l2 /dev/video0
}

. "$HOME/.cargo/env"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
