
def caesarEncryption(text, key)
    return text.downcase.chars.map! {|c|
        ascii = c.ord
        ascii >= 97 && ascii <= 122 
                ? (((ascii - 97 + key) % 26) + 97).chr 
                : c 
    }.join
end

def caesarDecryption(text, key)
    return caesarEncryption(text, -key)
end

puts caesarEncryption("hello world!", 3)
puts caesarDecryption("khoor zruog!", 3)