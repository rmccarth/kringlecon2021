import elf, munchkins, levers, lollipops, yeeters, pits
lever0, lever1, lever2, lever3, lever4 = levers.get()
elf.moveLeft(2)
lever4.pull(lever4.data() + ' concatenate')
elf.moveUp(2)
lever3.pull(not lever3.data())
elf.moveUp(2)
lever2.pull(lever2.data() + 1)
elf.moveUp(2)
info = lever1.data()
info.append(1)
lever1.pull(info)
elf.moveUp(2)
info = lever0.data()
info['strkey']='strvalue'
lever0.pull(info)
elf.moveUp(5)

