library("dplyr")

read_dict <- function(src) {
    dict <- readLines(src)
    comment_lines <- grep(";;;", dict)
    if (length(comment_lines))
        dict <- dict[-comment_lines]
    dict <- stringr::str_split(dict, "#", n=2, simplify=TRUE)
    comment <- gsub("^ +", "", dict[,2])
    comment <- ifelse(comment == "", NA, comment)
    dict <- as.data.frame(stringr::str_split(dict[,1], " ", n=2, simplify=TRUE),
                          stringsAsFactors=FALSE)
    pronunciation <- toupper(dict[,2])
    pronunciation <- gsub("^ +", "", pronunciation)
    pronunciation <- gsub(" +$", "", pronunciation)
    dict <- as.data.frame(stringr::str_split(dict[,1], "\\(", n=2, simplify=TRUE),
                          stringsAsFactors=FALSE)
    word <- tolower(dict[,1])
    alt <- gsub(")$", "",  dict[,2])
    alt <- ifelse(alt == "", NA, alt)
    data.frame(word, alt, pronunciation, comment, stringsAsFactors=FALSE)
}
list_phonemes <- function(dict) {
    phonemes <- unique(unlist(stringr::str_split(dict$pronunciation, " ")))
    phonemes <- unique(gsub("[[:digit:]]", "", phonemes))
    phonemes <- left_join(data.frame(arpabet=phonemes, stringsAsFactors=FALSE),
                          arpabet, by="arpabet")
    print(phonemes)
}
arpabet <- read.csv("data-raw/phoneme_mappings.csv", 
                    stringsAsFactors=FALSE, fileEncoding="UTF-8")
Encoding(arpabet$ipa) <- "UTF-8"
save(arpabet, file="data/arpabet.rda", compress=TRUE)

enUSxgaCMU <- read_dict("data-raw/cmudict/cmudict.dict")
list_phonemes(enUSxgaCMU)
head(enUSxgaCMU)
save(enUSxgaCMU, file="data/enUSxgaCMU.rda", compress=TRUE)

enUSxgaCainteoir <- read_dict("data-raw/amepd/cmudict")
list_phonemes(enUSxgaCainteoir)
head(enUSxgaCainteoir)
save(enUSxgaCainteoir, file="data/enUSxgaCainteoir.rda", compress=TRUE)

enGBxrpCainteoir <- read_dict("data-raw/en-GB-x-rp.dict/en-GB-x-rp.dict")
list_phonemes(enGBxrpCainteoir)
head(enGBxrpCainteoir)
save(enGBxrpCainteoir, file="data/enGBxrpCainteoir.rda", compress=TRUE)

enScotlandCainteoir <- read_dict("data-raw/en-scotland.dict/en-scotland.dict")
list_phonemes(enScotlandCainteoir)
head(enScotlandCainteoir)
save(enScotlandCainteoir, file="data/enScotlandCainteoir.rda", compress=TRUE)
