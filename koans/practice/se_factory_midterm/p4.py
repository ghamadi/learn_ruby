def caesarEncryption(text, key):
    string = ""
    for i in range(0, len(text)):
        code = ord(text[i])
        if code >= 97 and code <= 122:
            string += chr((((code - 97 + key) % 26) + 97))
        else:
            string += text[i]
    return string


def caesarDecryption(text, key):
    return caesarEncryption(text, -key)


def getMostFrequentLetter(text):
    obj = {}
    for c in text:
        if c in obj:
            obj[c] += 1
        elif c.isalpha():
            obj[c] = 1
    return obj


def getKthLetter(obj, rank):
    arr = sorted(obj, key=obj.get, reverse=True)
    return arr[rank - 1]


print(caesarEncryption("hello world!", 3))

print(caesarDecryption("khoor zruog!", 3))

print(getMostFrequentLetter("khoor zruog!"))

getKthLetter(getMostFrequentLetter("khoor zruog!"), "")
