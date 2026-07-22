args <- commandArgs(trailingOnly = TRUE)

#correspondence_aux_files
aux2_path <- args[1]
gff_path <- args[2]
out <- args[3]

aux2 <- read.table(aux2_path, sep = "\t", header = FALSE,
                 stringsAsFactors = FALSE, check.names = FALSE,
                 fill = TRUE, quote = "", comment.char = "")
gff <- read.table(gff_path, sep = "\t", header = FALSE,
                 stringsAsFactors = FALSE, check.names = FALSE,
                 fill = TRUE, quote = "", comment.char = "")

gff$pham_local <- aux2$V1[ match(gff$V9, paste0("ID=", aux2$V2)) ]
gff$pham_db <- aux2$V3[ match(gff$V9, paste0("ID=", aux2$V2)) ]
gff$annot <- aux2$V4[ match(gff$V9, paste0("ID=", aux2$V2)) ]
gff$categ <- aux2$V5[ match(gff$V9, paste0("ID=", aux2$V2)) ]

write.table(gff, out, row.names = FALSE, sep = "\t")
