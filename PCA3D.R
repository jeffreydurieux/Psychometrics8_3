library(GPArotation)
library(plotly)
library(rio)
data <- import("./data/prendt.sav")


# PCA
pca <- princomp(data, scores=T, cor = T)
#pca <- prcomp(data, scale. = T)
# Scores
scores <- pca$scores
x <- scores[,1]
y <- scores[,2]
z <- scores[,3]

# Loadings
loads <- pca$loadings

# Scale factor for loadings
scale.loads <- 1

# 3D plot

#### varimax rotation

Var <- varimax(pca$loadings[,1:2])
loads <- Var$loadings

p2 <- plot_ly()
names <- row.names(pca$loadings)
for (k in 1:nrow(loads)) {
  x <- c(0, loads[k,1])*scale.loads
  y <- c(0, loads[k,2])*scale.loads
  #z <- c(0, loads[k,3])*scale.loads
  p2 <- p2 %>% add_trace(x=x, y=y,
                         type="scatter", mode="lines",
                         line = list(width=8),
                         opacity = 1, name=names[k]) 
}
print(p2)

Var <- varimax(pca$loadings[,1:3])
loads <- Var$loadings
ord <- c(1,5,9,4, 2,6, 13,11,10, 3,12,8,7 ,14,15)
loads <- loads[ord,]
p3 <- plot_ly()
names <- row.names(loads)
for (k in 1:nrow(loads)) {
  x <- c(0, loads[k,1])*scale.loads
  y <- c(0, loads[k,2])*scale.loads
  z <- c(0, loads[k,3])*scale.loads
  p3 <- p3 %>% add_trace(x=x, y=y, z=z,
                         type="scatter3d", mode="lines",
                         line = list(width=8),
                         opacity = 1, name=names[k]) 
}
p3 <- p3 %>% layout(scene = list(
  xaxis = list(range = c(-.5, .5)),
  yaxis = list(range = c(-.5, .5)),
  zaxis = list(range = c(-.5,.5))
))



print(p3)
# chart_link = api_create(p3, filename="scatter3d-pcasolution")
# chart_link
# 
# Sys.setenv("plotly_username" = "durieuxj")
# Sys.setenv("plotly_api_key" = "8nEy4WH8Kwlqyjd1pIf7")
