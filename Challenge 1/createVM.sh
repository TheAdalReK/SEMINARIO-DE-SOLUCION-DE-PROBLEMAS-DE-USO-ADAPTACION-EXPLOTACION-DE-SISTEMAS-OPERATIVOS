echo "Ingrese el nombre de la máquina virtual:"
read NAME_VM

echo "Ingrese el tipo de sistema operativo que soportará (Linux):"
read OS_TYPE

VBoxManage createvm --name $NAME_VM --ostype $OS_TYPE --register

echo "Ingrese el número de CPUs:"
read CPUS

echo "Ingrese el tamaño de RAM (en GB):"
read RAM_SIZE

echo "Ingrese el tamaño de VRAM (en MB):"
read VRAM_SIZE

VBoxManage modifyvm $NAME_VM --cpus $CPUS --memory $((RAM_SIZE * 1024)) --vram $VRAM_SIZE

echo "Ingrese el tamaño de disco duro virtual (en GB):"
read DISK_SIZE

VBoxManage createmedium disk --filename "$NAME_VM.vdi" --size $((DISK_SIZE * 1024))

echo "Ingrese el nombre del controlador SATA:"
read SATA_CONTROLLER

VBoxManage storagectl $NAME_VM --name "$SATA_CONTROLLER" --add sata --bootable on
VBoxManage storageattach $NAME_VM --storagectl "$SATA_CONTROLLER" --port 0 --device 0 --type hdd --medium "$NAME_VM.vdi"

echo "Ingrese el nombre del controlador IDE"
read IDE_CONTROLLER

VBoxManage storagectl $NAME_VM --name "$IDE_CONTROLLER" --add ide

echo "Configuración creada para la Máquina Virtual $NAME_VM:"
echo "Nombre de la MV: $NAME_VM"
echo "Tipo de SO: $OS_TYPE"
echo "Número de CPUs: $CPUS"
echo "Tamaño de RAM: $RAM_SIZE GB"
echo "Tamaño de VRAM: $VRAM_SIZE MB"
echo "Tamaño de disco duro virtual: $DISK_SIZE GB"
echo "Controlador SATA: $SATA_CONTROLLER"
echo "Controlador IDE: $IDE_CONTROLLER"