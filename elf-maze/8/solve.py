import elf, munchkins, levers, lollipops, yeeters, pits
data = munchkins.get(0).ask()
for lollipop in lollipops.get():
    elf.moveTo(lollipop.position)
elf.moveLeft(8)
elf.moveUp(2)
munchkins.get(0).answer((list(data.keys())[list(data.values()).index('lollipop')]))
elf.moveUp(5)
