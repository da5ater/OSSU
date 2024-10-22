# array of numbers -> number
#produce the maximum elemnent in an array

def largest(x):
    if not x:
        return 0
    elif(x[0] > largest(x[1:])):
        return x[0]
    else :
        return largest(x[1:])
    

print(largest([1,2,3,4,5]))