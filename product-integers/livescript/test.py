from functools import reduce

product = lambda arr: reduce(lambda x,y: x*y, arr, 1)

def highest_product_of_n_optimal(array_of_ints, n=3):

    if len(array_of_ints) < n: raise Exception("Less than %d items!" % n)

    # highest_product = [product(array_of_ints[:i]) for i in range(2, n+1)]
    highest_product = []

    for i in range(2, n+1):
        x = array_of_ints[:i]
        print(x)
        res = product(x)
        highest_product.append(res)

    lowest_product = [product(array_of_ints[:i]) for i in range(2, n+1)]

    highest_product.insert(0, max(array_of_ints[:n-1]))
    lowest_product.insert(0, min(array_of_ints[:n-1]))

    print(highest_product)
    print(lowest_product)

    f = array_of_ints[n-1:]
    print(f)

    for current in f:

        for i in range(len(highest_product)-1, 0, -1):

            highest_product[i] = max(
                highest_product[i],
                current * highest_product[i-1],
                current * lowest_product[i-1],
            )

            lowest_product[i] = min(
                lowest_product[i],
                current * highest_product[i-1],
                current * lowest_product[i-1],
            )

        highest_product[0] = max(highest_product[0], current)
        lowest_product[0] = min(lowest_product[0], current)

    print(highest_product)
    return highest_product[-1]


res = highest_product_of_n_optimal([-10, -15, 1, 3, 2], 3)
print(res)
