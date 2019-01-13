clear
echo '#################################################################'
echo '## Ubuntu Version: $lsb_release -a'
lsb_release -a
echo ''

echo '#################################################################'
echo '## Machine Arquitecture: $uname -a'
echo '##'
uname -a
echo ''


echo '#################################################################'
echo '## CPU INFO: $grep -E: (^model name|^vendor_id|^flags) /proc/cpuinfo | sort | uniq'
grep -E '(^model name|^vendor_id|^flags)' /proc/cpuinfo | sort | uniq
echo ''


echo '#################################################################'
echo '#GRAPHIC CARD INFO:  $lspci -vnn | grep VGA -A 12'
lspci -vnn | grep VGA -A 12
echo ''


echo '#################################################################'
echo '## gcc version: $gcc --version -O3 -std=c99'
gcc --version -O3 -std=c99

echo '#################################################################'
echo '##  version of your python and pip:  version of your python and pip'
python --version
pip --version


