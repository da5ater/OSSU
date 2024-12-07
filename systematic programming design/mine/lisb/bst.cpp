#include <iostream>
#include <string>
#include <memory>
#include <vector>
#include <sstream>
#include <cmath>

// Constants
const int TEXT_SIZE = 14;
const std::string TEXT_COLOR = "BLACK";
const std::string KEY_VAL_SEPARATOR = ":";
const std::string EMPTY_TREE = "MTTREE";

// BST Node Definition
struct Node
{
    int key;
    std::string val;
    std::shared_ptr<Node> left;
    std::shared_ptr<Node> right;

    Node(int k, std::string v, std::shared_ptr<Node> l = nullptr, std::shared_ptr<Node> r = nullptr)
        : key(k), val(v), left(l), right(r) {}
};

// Function to render the key-value pair
std::string renderKeyVal(int key, const std::string &val)
{
    std::ostringstream oss;
    oss << key << KEY_VAL_SEPARATOR << val;
    return oss.str();
}

// Function to render lines between nodes
std::string renderLines(int lw, int rw)
{
    int totalWidth = lw + rw;
    int height = totalWidth / 4;

    std::ostringstream oss;
    oss << "Lines: [" << "LW=" << lw << ", RW=" << rw
        << ", TotalWidth=" << totalWidth << ", Height=" << height << "]";
    return oss.str();
}

// Recursive function to render the BST
std::string renderBST(std::shared_ptr<Node> bst)
{
    if (!bst)
    {
        return EMPTY_TREE;
    }

    std::string keyVal = renderKeyVal(bst->key, bst->val);
    std::string leftRender = renderBST(bst->left);
    std::string rightRender = renderBST(bst->right);

    int lw = leftRender.size();
    int rw = rightRender.size();

    std::ostringstream oss;
    oss << "Node(" << keyVal << ")\n"
        << renderLines(lw, rw) << "\n"
        << "Left: " << leftRender << "\n"
        << "Right: " << rightRender;

    return oss.str();
}

int main()
{
    // Example trees
    auto BST1 = std::make_shared<Node>(1, "abc");
    auto BST7 = std::make_shared<Node>(7, "ruf");
    auto BST4 = std::make_shared<Node>(4, "dcj", nullptr, BST7);
    auto BST3 = std::make_shared<Node>(3, "ilk", BST1, BST4);
    auto BST42 = std::make_shared<Node>(42, "ily",
                                        std::make_shared<Node>(27, "wit", std::make_shared<Node>(14, "olp"), nullptr),
                                        std::make_shared<Node>(50, "dug"));
    auto BST10 = std::make_shared<Node>(10, "why", BST3, BST42);
    auto BST100 = std::make_shared<Node>(100, "large", BST10, nullptr);

    // Render trees
    std::cout << renderBST(BST100) << std::endl;

    return 0;
}
