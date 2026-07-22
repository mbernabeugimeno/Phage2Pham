library(gggenomes)
library(ggplot2)

args <- commandArgs(trailingOnly = TRUE)

#correspondence_aux_files
genomes <- args[1]
annot <- args[2]
links <- args[3]
output <- args[4]
ancho <- args[5]
largo <- args[6]

s0 <- read_seqs(genomes)
g0 <- read_feats(annot)
l0 <- read_links(links)

pal = c("deepskyblue3", "lightblue2", "tan4", "chocolate2", "peachpuff2", "violetred2", "purple", "#A2CD5A", "snow3","white", "white")

Function <- g0$score

figure <- gggenomes(seqs=s0, genes = g0, links = l0) + geom_seq() + geom_gene(aes(fill=Function)) + geom_link_line(colour="black",linewidth=0.1,linetype="dashed") + scale_fill_manual(values=pal, breaks=c('DNA, RNA and nucleotide metabolism', 'moron, auxiliary metabolic gene and host takeover', 'head and packaging', 'tail', 'connector', 'lysis','integration and excision', 'transcription regulation', 'other', 'unknown function', 'NA'), label=c('DNA RNA and nucleotide metabolism', 'moron auxiliary metabolic gene and host takeover', 'head and packaging', 'tail', 'connector', 'lysis','integration and excision', 'transcription regulation', 'other', 'unknown function', 'NA')) + 
geom_bin_label(size=4, nudge_left=0.01, expand_left =0.015) + theme(legend.key.size = unit(7, 'mm'), legend.text = element_text(size=8,lineheight = 1),  legend.key.height = unit(0.7, "cm"), legend.title = element_text(size=12,face = "bold"), legend.position = "top",legend.box.just = "center",legend.box="vertical", legend.spacing.x = unit(0.2,'cm'),legend.box.margin=margin(-10,0,-20,-5)) + guides(fill = guide_legend(order = 2))

ggsave(
  filename = output,
  plot     = figure,
  width    = as.numeric(ancho), height = as.numeric(largo), units = "mm",
  bg       = "white"   # o "transparent"
)
