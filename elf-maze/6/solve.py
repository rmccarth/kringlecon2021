import elf, munchkins, levers, lollipops, yeeters, pits
# Fix/Complete the below code
lever = levers.get(0)
data = lever.data()
if type(data) == bool:
    data = not data
elif type(data) == int:
    data = data * 2 
elif type(data) == list:
    data = [x + 1 for x in data]
elif type(data) == str:
    data += data
elif type(data) == dict:
    data['a'] = data['a'] + 1
elf.moveUp(2)
lever.pull(data)
elf.moveUp(5)

