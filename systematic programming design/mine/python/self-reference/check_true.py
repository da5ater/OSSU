import unittest

# list of booleans -> booleans
# produce false if any element in the list is false .else it produces true


def CTRUE(l):
    if len[l] == 0 :
        return True
    else: 
        if  l[0] == False : 
             return False
        else :
            return CTRUE(l[1:])



class testboolean(unittest.TestCase):

    def test(self) :
        self.assertEqual([] , True)
        self.assertEqual([True] , True)
        self.assertEqual([True , True] , True)
        self.assertEqual([False] , False)
        self.assertEqual([False , True] , False)

if __name__ == '__main__':
    unittest.main()