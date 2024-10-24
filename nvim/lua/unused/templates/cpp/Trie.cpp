/*
 * insert: O(n)
 * search: O(n)
 *
 * usage: store char by char in nodes, spell checking, dictionary
 */


#include <string>

constexpr int ALPHABET_SIZE = 26;

struct TrieNode {
  TrieNode *children[ALPHABET_SIZE];
  bool isEnd;
};

TrieNode *getNode() {
  TrieNode *node = new TrieNode;

  node->isEnd = false;
  for (int i = 0; i < ALPHABET_SIZE; ++i)
    node->children[i] = nullptr;

  return node;
}

void insert(TrieNode *root, std::string key) {
  TrieNode *tmp = root;

  for (char c : key) {
    int idx = c - 'a';
    if (!tmp->children[idx]) {
      tmp->children[idx] = getNode();
    }
    tmp = tmp->children[idx];
  }
  tmp->isEnd = true;
}

bool search(TrieNode* root, std::string key) {
  TrieNode* tmp = root;

  for (char c : key) {
    int idx = c - 'a';
    if (!tmp->children[idx]) {
      return false;
    }
    tmp = tmp->children[idx];
  }
  
  return tmp->isEnd;
}
