# Recursive function to process a list of structures (los)
def yell(l):
    if not l:  # Equivalent to (empty? los)
        return []  # Replace with the appropriate base case
    else:
        return [l + "!"] + yell(l[1:])   # Replace with logic involving los[0] and the recursive call
        # You can process los[0] here and recursively call fn_for_los(los[1:])


