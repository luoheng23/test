#   coding=utf-8
 
coded, words = open("scrambled-words.txt", "r", encoding="UTF-8"), open("dictionary.txt", encoding="UTF-8")
key, value = [x.strip('\n') for x in coded], [x.strip('\n') for x in words]
 
