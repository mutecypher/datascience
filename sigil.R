sigil <- function(initial_input){
        library(stringr)
        consonants <- c("B","C", "D", "F","G", "H", "J","K", "L", "M","N","P","Q","R", "S", "T", "V", "W", "X", "Y", "Z")
        vowels <- c("a", "e", "i", "o", "u")  
        char_count <- nchar(initial_input)
        x <- as.character(initial_input)     ## give the input a quick dummy of x
        x <- str_replace_all(x,"[^a-zA-Z]", "")   ## remove all non-alphabetic chars. and spaces
        x <- toupper(x)                         ## make everything upper case
        num_cons = vector(mode = "integer", length = 21)   ## dummy vector for values
        no_vowels <- str_replace_all(x,"[AEIOU]", "")  ## take out the vowels
        for (i in 1:length(consonants))
        {
                intermediate <- str_count(no_vowels,consonants[i])    ## count occurences of each consonant
                num_cons[i] <- intermediate
        }
        names(num_cons) = consonants
        ##y <- str_replace_all(x,"[AEIOU]", "")
        individual_chars <- vector(mode = "character", length = nchar(no_vowels))
        individual_chars <- substring(no_vowels, 1:nchar(no_vowels), 1:nchar(no_vowels))
        ## above gives the number of occurrences of each consonant
        alphy <- names(num_cons[num_cons != 0])  ##puts consonants in alphabetical order
        ##vwl <- str_locate_all(x,vowel)
        ##print(cons)
        ## print(vwl)
        print(x)        ## all spaces and non-alphabetic characters, all caps
        print(no_vowels)        ## all vowels removed
        ##print(nchar(y))
        print(individual_chars)   ## no-vowels as a vector of characters
        print(num_cons)         ## number of each consonant
        print(alphy)            ## consonants in alphabetical order
        print(length(alphy))
        try1 <- grepl(alphy[1], individual_chars)
        for (i in 2:length(alphy))
                {
        
                try2 <- grepl(alphy[i], individual_chars)
                try1 <- cbind(try1, try2)
        }
        colnames(try1) <- alphy[1:length(alphy)]
        print(try1)

}