
def func(fn):
    print("func start")
    def func(*args, **kargs):
        fn(args, kargs)


class hello:
    @func
    def good(self):
        print("hello")

print("Yes")