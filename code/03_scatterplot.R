# Loading ggplot2 package
library(ggplot2)

# Creating my scatter plot of age and impact speed
ggplot(data, aes(x = Age, y = Speed_of_Impact)) +
  geom_point() +  # Scatter plot points
  geom_smooth() +
  labs(title = "Speed of Collision vs. Age",
       x = "Age (years)",
       y = "Speed of Collision (miles per hour)" )

#Saving the figure in the output folder of my project directory
ggsave(
  "output/scatter_plot.png",
  plot = scatterplot,
  device = "png"
)
