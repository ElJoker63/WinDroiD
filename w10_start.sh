echo "starting vm"
echo "enter windows 10 iso directory: "
read dir
echo "enter vm ram usage limit (type in mb only like if you want to give your vm 1gb ram then type '1024'): "
read mem
echo "starting"
qemu-system-x86_64 -m $mem -cdrom $dir -vnc 127.0.0.1:2
echo "your vm server is ready at vnc 127.0.0.1:2"