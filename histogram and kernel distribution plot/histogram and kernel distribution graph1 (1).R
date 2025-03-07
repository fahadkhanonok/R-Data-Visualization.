set.seed(1234)
rating  <- rnorm(200,mean= 20, sd=21)
head(rating)
#> [1] -1.2070657  0.2774292  1.0844412 -2.3456977  0.4291247  0.5060559

rating2 <- rnorm(200, mean=.8)
head(rating2)

# Make a column to indicate which group each value is in
cond <- factor( rep(c("A","B"), each=200) )

tablesample <- data.frame(cond, rating = c(rating,rating2))
head(tablesample)
tablesample
###

#Sample crop yield data (in tons per hectare)
crop_yield <- c(2.1, 2.5, 2.3, 2.9, 3.0, 1.8, 2.7, 3.1, 2.6, 2.4,
                2.0, 3.2, 3.0, 1.9, 2.8, 2.4, 2.2, 3.3, 2.7, 2.1)


# Create a histogram with additional features
hist(crop_yield,
     main = "Histogram of Crop Yields",
     xlab = "Yield (tons per hectare)",
     ylab = "Frequency",
     col = "green",
     border = "red",
     breaks = 6,                # Number of bins
     xlim = c(1.5, 3.5),        # Set limits for the x-axis
     ylim = c(0, 6))            # Set limits for the y-axis

# Add a grid
grid(nx = NULL, ny = NULL, col = "gray", lty = "dotted", lwd = 1)

# Add a rug plot
rug(crop_yield, col = "red", lwd = 2)

# Add a density curve
lines(density(crop_yield), col = "darkgreen", lwd = 2)

# Annotate with a text box
text(x = 3, y = 5, labels = "Peak Yield", col = "darkred", cex = 1.2)

# Highlight the mean with a vertical line
abline(v = mean(crop_yield), col = "red", lwd = 2, lty = 2)
text(mean(crop_yield), 5.5, labels = "Mean", col = "red", pos = 3)
#color bar
bar_colors <- rainbow(6)  # Generate 6 different colors
# Sample crop yield data for multiple distributions
crop_yield_1 <- c(2.1, 2.5, 2.3, 2.9, 3.0, 1.8, 2.7, 3.1, 2.6, 2.4)
crop_yield_2 <- c(2.0, 2.3, 2.7, 2.8, 3.2, 3.5, 2.4, 2.2, 3.0, 3.1)

# Create the first kernel density plot
dens1 <- density(crop_yield_1)

# Create the second kernel density plot
dens2 <- density(crop_yield_2)

# Plot the first density
plot(dens1, 
     main = "Multiple Kernel Density Plots of Crop Yields",  # Title
     xlab = "Yield (tons per hectare)", 
     ylab = "Density",
     col = "blue",       # Color of the first density plot
     lwd = 2,            # Line width for the first density plot
     lty = 1,            # Line type (solid) for the first density plot
     xlim = c(1.5, 3.5), # X-axis limits (to zoom in on relevant range)
     ylim = c(0, 1.5),   # Y-axis limits
     cex.main = 1.5,     # Font size of the title
     cex.lab = 1.2,      # Font size of the labels
     cex.sub = 1)        # Font size of the subtitle

# Add the second density plot to the same graph
lines(dens2, col = "red", lwd = 2, lty = 2) # Red line with dashed style

# Add a legend to the top right of the plot
legend("topright", 
       legend = c("Yield Set 1", "Yield Set 2"), 
       col = c("blue", "red"), 
       lwd = 2, 
       lty = c(1, 2),       # Solid line for the first set, dashed for the second
       title = "Density Plots") # Title of the legend

# Add grid lines to make the plot easier to read
grid(nx = NULL, ny = NULL, col = "gray", lty = "dotted")
