# classification is on of :
# - new
# - old
# - heritage

# interp. the classification of a building

# def fn_for_classification(c):
#     if(c == "new"):
#         return
#     elif(c == "old"):
#         return
#     else:
#         return

## template rules used
## - atomic distinct new
## - atomic distinct old
## - atomic distinct heritage

# classification -> boolean
# produce true only if the building is "old"


def demolish(c):
    if(c == "new"):
        return False
    elif(c == "old"):
        return True
    else:
        return False