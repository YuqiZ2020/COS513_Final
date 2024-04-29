library(mutSignatures)

cosmic_sig = read.csv("https://cog.sanger.ac.uk/cosmic-signatures-production/documents/COSMIC_v2_SBS_GRCh38.txt", 
                      sep = "\t", row.names = 1)
cosmic_sig_obj = as.mutation.signatures(as.data.frame(cosmic_sig))

# sig = read.csv("")
msig1 <- matchSignatures(mutSign = blca.analysis$Results$signatures, reference = cosmic_sig_obj, 
                         threshold = 0.45, plot = TRUE) 

