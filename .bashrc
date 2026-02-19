# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# Start ble.sh for autocomplete and syntax
source ~/.local/share/blesh/ble.sh
# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Show fastfetch, no logo
fastfetch -l none

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
alias vim='nvim'
# eza aliases
alias ls='eza --icons --group-directories-first'
alias ll='eza -l --icons --group-directories-first'
alias la='eza -la --icons --group-directories-first'
alias lt='eza --tree --level=2 --icons --group-directories-first'
alias l.='eza -a --icons --group-directories-first | grep -E "^\."'
# bat aliases
alias cat='bat --style=auto --wrap=never'
alias catn='bat --style=plain --wrap=never'
alias less='bat'
# Lanzar RDP de la oficina en segundo plano
alias rdp-ofi='nohup remmina -c ~/.local/share/remmina/*.remmina >/dev/null 2>&1 & disown'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'



# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/viktorlacharo/.lmstudio/bin"
# End of LM Studio CLI section

# Added by bob-nvim (Neovim version manager)
export PATH="$HOME/.local/share/bob/nvim-bin:$HOME/.cargo/bin:$PATH"

# Control de VPN ACCON por CLI
vpn-accon() {
    if [[ "$1" == "up" ]]; then
        echo "Iniciando túnel hacia ACCON..."
        # Lee la contraseña del archivo seguro
        PASS=$(cat ~/.vpn_secret)
        sudo netExtender vpn.accon.com:4433 -u vlazarenko@accon.com -p "$PASS" -d ACCON
    elif [[ "$1" == "down" ]]; then
        echo "Matando procesos colgados de la VPN..."
        sudo killall pppd netExtender 2>/dev/null
        sudo systemctl restart NetworkManager
        echo "Desconectado. Red local restaurada."
    else
        echo "Uso: vpn-accon [up|down]"
    fi
}

# Automatización total: VPN + RDP
accon() {
    echo "Iniciando secuencia de conexión..."
    
    # Lanzamos un subproceso en segundo plano que vigila la red
    (
        # Espera en bucle hasta que la interfaz ppp0 exista
        while ! ip link show ppp0 > /dev/null 2>&1; do
            sleep 1
        done
        
        # El túnel ha levantado. Damos 2 segundos para que se asienten las rutas.
        sleep 2
        
        # Lanzamos Remmina de forma silenciosa
        nohup remmina -c ~/.local/share/remmina/*.remmina >/dev/null 2>&1 &
    ) &
    
    # Lanzamos la VPN en primer plano para que puedas teclear tu contraseña y 2FA
    vpn-accon up
}
