args <- commandArgs(trailingOnly = TRUE)

#correspondence_aux_files
df1_path <- args[1]
df2_path <- args[2]
df3_path <- args[3]
out_path <- args[4]

df1 <- read.table(df1_path, sep = "\t", header = FALSE,
                 stringsAsFactors = FALSE, check.names = FALSE,
                 fill = TRUE, quote = "", comment.char = "")
df2 <- read.table(df2_path, sep = "\t", header = FALSE,
                 stringsAsFactors = FALSE, check.names = FALSE,
                 fill = TRUE, quote = "", comment.char = "")
df3 <- read.table(df3_path, sep = "\t", header = FALSE,
                 stringsAsFactors = FALSE, check.names = FALSE,
                 fill = TRUE, quote = "", comment.char = "")

df1$pham <- df2$V2[ match(df1$V1, df2$V1) ]
df1$annot <- df3$V2[ match(df1$V1, df3$V1) ]
df1$categ <- df3$V3[ match(df1$V1, df3$V1) ]

gene_cols <- setdiff(
  names(df1)[sapply(df1, function(x) any(grepl("geneCall", x)))],
  c("V1","pham","annot","categ")
)

long <- reshape(df1, varying = gene_cols, v.names = "geneCall",
                timevar = "src", times = gene_cols, direction = "long")

df_ext <- long[!is.na(long$geneCall) & long$geneCall != "" & grepl("geneCall", long$geneCall),
               c("V1","geneCall","pham","annot","categ")]
row.names(df_ext) <- NULL

write.table(df_ext, file.path(out_path, "correspondence_aux2.csv"), row.names = FALSE, sep = "\t")
