import unittest
import ensure

class test_name(unittest.TestCase):

    def test_add(self):

        self.assertEqual(ensure.quistionize("who are you") , "who are you?")
        self.assertEqual(ensure.quistionize("who are you?") , "who are you?")


if __name__ == '__main__' :

    unittest.main()