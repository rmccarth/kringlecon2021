import elf, munchkins, levers, lollipops, yeeters, pits
lever0, lever1, lever2, lever3, lever4 = levers.get()

def moveIt():
    elf.moveUp(2)
    
elf.moveLeft(2)
lever4.pull(lever4.data() + ' concatenate')
moveIt()
lever3.pull(not lever3.data())
moveIt()
lever2.pull(lever2.data() + 1)
moveIt()
lever1.pull(lever1.data() + [1])
moveIt()
lever0.pull({})
moveIt()
