b = '''
testinput1
testinput2
testinput3
'''
a = '''{b}'''.format(b=b)
print(a)
out = a.replace("\n", "\\n")
print(out)
