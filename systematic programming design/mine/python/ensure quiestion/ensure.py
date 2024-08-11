# string -> string
# put a '?' at  the end of given string unless it has one it dose nothing instead


def quistionize(str):
    if(str[-1] == "?") :
        return str
    else:
        return str+'?'