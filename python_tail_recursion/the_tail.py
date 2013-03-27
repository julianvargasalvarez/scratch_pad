def with_for():
    def add_one(x):
        a = x + 1
    for i in range(1000000):
        add_one(i)

def with_tail():
    def add_one(numbers):
        if len(numbers) > 0:
            numbers[0] + 1
            add_one(numbers[1:])
    add_one(range(1000000))

if __name__ == "__main__":
    with_tail()
