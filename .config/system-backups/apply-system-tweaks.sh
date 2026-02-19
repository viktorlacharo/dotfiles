#!/bin/bash
echo "Aplicando parches del sistema..."

# 1. Blindar DNS contra NetExtender
echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf >/dev/null
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf >/dev/null
sudo chattr +i /etc/resolv.conf
echo "[OK] DNS blindado."

# 2. Desbloquear driver xpad para mando de Xbox por cable
sudo sed -i 's/blacklist xpad/#blacklist xpad/g' /etc/modprobe.d/*.conf /usr/lib/modprobe.d/*.conf 2>/dev/null
echo "[OK] Driver xpad liberado."

echo "Parches aplicados correctamente."
