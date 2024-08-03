import unittest
import doublee

class double(unittest.TestCase):
    def test_doubler(self):
        self.assertEqual(doublee.doubler(2) , 4)


if __name__ == '__main__' :

    unittest.main()