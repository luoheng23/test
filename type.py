
import re

pattern = re.compile(r"^(\d+)x(\d+)(?:\+(\d+))?(?:\+(\d+))?$")

test = "700x400+400+200"
m = pattern.match(test)
print(m.groups())
