#!/bin/bash

# Installations-Skript für Git, Pi-Apps, Tabby, Snapdrop, Python 3, Python IDLE und pip Pakete mit venv

echo "Installation wird gestartet..."
echo "Update wird gestartet..."
# System aktualisieren
sudo apt-get update && sudo apt-get upgrade -y

# Git installieren
echo "Git wird installiert..."
sudo apt-get install git -y

# Pi-Apps installieren
echo "Pi-Apps wird installiert..."
wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash

# Tabby installieren (Terminal Emulator)
echo "Tabby wird installiert..."
wget -qO- https://archive.org/download/tabby-linux-installer/tabby-linux-installer.sh | bash

# Snapdrop installieren (als Desktop-Verknüpfung über Pi-Apps)
echo "Snapdrop wird über Pi-Apps installiert..."
~/pi-apps/manage install snapdrop

# Python 3 und Python IDLE installieren
echo "Python 3 und Python IDLE werden installiert..."
sudo apt-get install python3 python3-idle -y

# pip und venv installieren, falls nicht vorhanden
echo "pip und venv werden installiert..."
sudo apt-get install python3-pip python3-venv -y

# Verzeichnis für die virtuelle Umgebung erstellen
echo "Virtuelle Umgebung wird erstellt..."
mkdir -p ~/my_python_env
cd ~/my_python_env

# Virtuelle Umgebung erstellen und aktivieren
python3 -m venv venv
source venv/bin/activate

# pip Pakete in der virtuellen Umgebung installieren
echo "Installation von pip Paketen in der virtuellen Umgebung..."
pip install numpy pandas flask requests

# Installationsergebnisse überprüfen
if [ $? -eq 0 ]; then
    echo "Alle Programme, virtuelle Umgebung und Pakete wurden erfolgreich installiert!"
else
    echo "Es gab ein Problem bei der Installation der Programme, virtuellen Umgebung oder Pakete."
fi

# Hinweis zur Aktivierung der virtuellen Umgebung
echo "Um die virtuelle Umgebung zukünftig zu aktivieren, verwenden Sie den Befehl:"
echo "source ~/my_python_env/venv/bin/activate"
