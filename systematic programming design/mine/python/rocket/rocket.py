# descent is integer [0 : 100]
# interp. the kilometers lift between the rocket and earth

d1 = 100 #rocket is 100 km away from earth
d2 = 50  #rocket is 50 away from earth
d3 = 0   # rocket is on earth


# def fn_for_descent(d):
#     return d

# template rules used
## - atomic non-distinct : integer [ 0 : 100]


# descent -> string 
# produce the number it's having as an string till the number is 0 it produce "the rocket has landed"

# def rocket_msg(d):
#     return "100"

def rocket_msg(d):
    if(d == 0):
        return "the rocket has landed"
    else :
        return str(d)

