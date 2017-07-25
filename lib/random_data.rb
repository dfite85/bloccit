module RandomData                                                               #RandomData as a standalone lib with no dependencies or inheritance requirements
    
    def self.random_paragraph                                                   #defines random_paragraph
        sentences = []                                                          #creates an empty array names sentences
        rand(4..6).times do                                                     #creates 4 to 6 random sentences
            sentences << random_sentence                                        #puts created sentences in random_sentence
        end
        
        sentences.join(" ")                                                     #joins each sentence in the array with a space to seperate making a full paragraph
    end
    
    def self.random_sentence                                                    #defines random_sentence
        strings = []                                                            #creates an empty array names strings
        rand(3..8).times do                                                     #creates 3 to 8 random strings
            strings << random_word                                              #puts created strings into random_word
        end
        
        sentence = strings.join(" ")                                            #joins each string in the array with a space to seperate making a full sentence
        sentence.capitalize << "."                                              #upcase the first char and inserts a . at the end of the string
    end
    
    def self.random_word                                                        #defines random_word
        letters = ('a'..'z').to_a                                               #letters is defined as an array with (.to_a) and can be any letter a to z
        letters.shuffle!                                                        #shuffles the letters (.shuffle! in place) without (!)would retrun an array rather than shuffle
        letters[0,rand(3..8)].join                                              #joins 0 and the nth item which is determined by the rand(3..8)
    end
end

    