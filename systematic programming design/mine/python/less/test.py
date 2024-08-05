import smaller
import unittest

class test_name(unittest.TestCase):

    def test_less(self):

        self.assertEqual(smaller.LessThanFive(5) , False)
        self.assertEqual(smaller.LessThanFive(10) , False)
        self.assertEqual(smaller.LessThanFive(2) , True)

if __name__ == '__main__' :

    unittest.main()