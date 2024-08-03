import s
import unittest


class test_name(unittest.TestCase):

    def test_pluralize(self):

        self.assertEqual(s.pluralize("dog") , "dogs")

if __name__ == '__main__' :

    unittest.main()