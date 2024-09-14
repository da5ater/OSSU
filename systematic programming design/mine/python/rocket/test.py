import unittest
import rocket

class test_name(unittest.TestCase):

    def test_add(self):

        self.assertEqual(rocket.rocket_msg(100) , "100")
        self.assertEqual(rocket.rocket_msg(50) , "50")
        self.assertEqual(rocket.rocket_msg(0) , "the rocket has landed")


if __name__ == '__main__' :

    unittest.main()