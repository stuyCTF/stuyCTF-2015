max_number = 10 ** 299999 # Number with 300000 digits

num0 = 0
num1 = 1
while num1 < max_number:
    temp = num0 + num1
    num0 = num1
    num1 = temp

def sumDigits(num):
    ''' # slow and clunky math way
    total = 0
    while num > 0:
        total += num % 10
        num //= 10
    return total
    '''
    total = 0
    string = str(num)
    for char in string:
        total += int(char)
    return total

print sumDigits(num1)
