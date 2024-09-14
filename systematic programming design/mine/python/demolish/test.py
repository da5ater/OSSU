import unittest
import demolish

class test_name(unittest.TestCase):

    def test_add(self):

        self.assertEqual(demolish.demolish("new") , False)
        self.assertEqual(demolish.demolish("old") , True)
        self.assertEqual(demolish.demolish("heritage") , False)

if __name__ == '__main__' :

    unittest.main()