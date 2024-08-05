import accon
import unittest


class test_name(unittest.TestCase):

    def test_less(self):

        self.assertEqual(accon.spell("dog") , "accon dog")

if __name__ == '__main__' :

    unittest.main()