#Reading in the data
here::i_am("code/02_scatterplot.R")
data <- read.csv("data/accident.csv")

# Download and call the ggplot2 package
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)

# Creating my scatter plot of age and impact speed
scatterplot <- ggplot(data, aes(x = Age, y = Speed_of_Impact)) +
  geom_point() +  
  geom_smooth() +
  labs(title = "Speed of Collision vs. Age",
       x = "Age (years)",
       y = "Speed of Collision (miles per hour)" )

#Saving the figure in the output folder
ggsave(
  "output/scatterplot.png",
  plot = scatterplot,
  device = "png"
)
