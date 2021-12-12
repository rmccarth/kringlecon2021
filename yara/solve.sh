xxd the_critical_elf_app | sed 's/6361 6e64 7963 616e/6361 6e64 7963 626e /' | xxd -r > two
xxd two | sed 's/2121/2120/' | xxd -r > three
dd if=./three of=./three bs=1024 oflag=append conv=notrunc

ctrl^c
chmod +x three && ./three
