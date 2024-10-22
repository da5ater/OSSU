def sum_w(w):
    if not w:  # equivalent to (empty? w) in Lisp
        return 0
    else:
        return w[0] + sum_w(w[1:])  # w[0] is the first element, w[1:] is the rest

print(sum_w([1, 2, 3, 4]))  # Output: 10
