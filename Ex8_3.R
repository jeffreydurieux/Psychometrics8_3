# Mon Oct 30 13:56:00 2017 ------------------------------

# Jeffrey Durieux (j.durieux@fsw.leidenuniv.nl)
# Script for plotting data in three dimensions
# Used for assignment 8.3 of the psychometrics course

# selfcontained script: one-click proof when -rgl- package (and dependencies)... 
# ... are installed. If not: automatic installation when sourcing

# if rgl not in library: install package and dependencies
if (!is.element('plotly', installed.packages()[,1])){
  install.packages('plotly', dep = TRUE)
}

library(plotly)

# The palette with black:
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")


# data from assignment, adjust vectors for other examples
rock <- c(14,11,10)
jazz <- c(13,15,15)
classical <- c(9,15,16)

mat <- cbind(rock,jazz,classical)
row.names(mat) <- c("speed", "basic", "complex")

# animal: Joe 'Animal' von Karajan, the drummer
animal <- c(11,14,13)
mat <- cbind(mat,animal)

mat <- as.data.frame(mat)
mat <- as.data.frame(t(mat))
mat <- cbind(mat, name = c('rock', 'jazz', 'classical', 'joe'))

p <- plot_ly(data = mat, x = ~speed, y = ~basic, z = ~complex,
             color = ~name)
print(p)



