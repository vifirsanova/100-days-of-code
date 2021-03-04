""" FUNCTIONAL PROGRAMMING """

# Based on https://realpython.com/python-functional-programming/#calling-map-with-a-single-iterable

from functools import reduce


# We can assign a function to a variable
def func(a, b):
    return [x for x in range(a, b) if a < b]


create_list = func
print(func(1, 3))
# [1, 2]
print(create_list(1, 3))
# [1, 2]
print(func == create_list)
# True


# Function is an object. Let's demonstrate its object properties
print(123, 'hello', create_list)
# 123 hello <function func at 0x000001CAE8DB4AF8>
new_list = [123, 'hello', create_list]
print(new_list[-2:])
# ['hello', <function func at 0x0000018DA1414828>]
print(new_list[-1](1, 3))
# [1, 2]
new_dict = {'integer': 123, 'string': 'hello', 'function': create_list}
print(f'We have a string "{new_dict["string"]}" and a function {new_dict["function"]}')
# We have a string "hello" and a function <function func at 0x00000196BBFF4AF8>
print(new_dict['function'](1, 3))


# [1, 2]


# Let's try to pass our function to another one as an argument
def func_stats(function):
    return {'len': len(function), 'min': min(function), 'max': max(function), 'sum': sum(function)}


print(func_stats(func(1, 3)))
# {'len': 2, 'min': 1, 'max': 2, 'sum': 3}


# Now let's try to create a function inside another one
def create_func(n):
    if n > 0:
        def new_func(string):
            print(string.upper())

        return new_func
    else:
        def another_func(string):
            print(list(string))

        return another_func


create_func(3)('hello')
# HELLO
create_func(-1)('hello')
# ['h', 'e', 'l', 'l', 'o']


# Let's give this function a new name
positive_func = create_func(5)
negative_func = create_func(-5)
print(positive_func)
# <function create_func.<locals>.new_func at 0x000002378FD4B3A8>
print(negative_func)
# <function create_func.<locals>.another_func at 0x000002378FD4B438>


# Lambda expressions
# Let's observe their properties firstly
print(lambda x: {x + 1: f'{x} squared is {x ** 2}' for x in range(5)})
# <function <lambda> at 0x000001D4C7FBB8B8>
print(callable(lambda x: {x + 1: f'{x} squared is {x ** 2}' for x in range(5)}))
# True
print(f'Our original dictionary: ')
print((lambda x: {x + 1: f'{x} squared is {x ** 2}' for x in range(5)})(3))
# Our original dictionary:
# {1: '0 squared is 0', 2: '1 squared is 1', 3: '2 squared is 4', 4: '3 squared is 9', 5: '4 squared is 16'}


def get_values(obj):
    return obj.values()


print(get_values((lambda x: {x + 1: f'{x} squared is {x ** 2}' for x in range(5)})(3)))
# dict_values(['0 squared is 0', '1 squared is 1', '2 squared is 4', '3 squared is 9', '4 squared is 16'])


# It's time to practice with map()
dogs = ['pug', 'labradoodle', 'bulldog', 'dalmatian']


def reverse(x):
    return sorted(x, key=len)[::-1]


print(reverse(dogs))
# ['labradoodle', 'dalmatian', 'bulldog', 'pug']
print(map(reverse, dogs))
# <map object at 0x000001A103DAD7C8>
for i in map(reverse, dogs):
    print(''.join(i))
# gup
# eldoodarbal
# godllub
# naitamlad
print(' + 5 is '.join(map(str, [x*5 for x in range(4)])))
# 0 + 5 is 5 + 5 is 10 + 5 is 15


def multi_func(n1, n2, n3):
    return (n1**2 + n2**2) // n3


print(list(map(multi_func, [0, 1, 3], [5, 2, 4], [8, 1, 7])))
# [3, 5, 3]
print(f'Step by step \n 1. {multi_func(0, 5, 8)} \n 2. {multi_func(1, 2, 1)} \n 3. {multi_func(3, 4, 7)}')
# Step by step
#  1. 3
#  2. 5
#  3. 3


# filter()
def is_even(n):
    return n % 2 == 0


print(list(filter(is_even, [123, 24, 134, 521, 1342])))
# [24, 134, 1342]
print(list(filter(is_even, [123, 24, 134, 521, 1342])) == list(filter(lambda n: n % 2 == 0, [123, 24, 134, 521, 1342])))
# True


# reduce()
print(reduce(lambda x, y: x * y, [1, 2, 3], 10))
# 60


def my_filter(function, data):
    return reduce(
        lambda x, y: x + [y] if function(y) else x,
        data,
        []
    )


print(list(my_filter(lambda x: x % 2 == 0, [0, 134, 23, 1231, 6])))
# [0, 134, 6]


def my_map(function, data):
    return reduce(
            lambda x, y: x + [function(y)],
            data,
            []
        )


print(list(my_map(str, [1, 23, 4])))
# ['1', '23', '4']
