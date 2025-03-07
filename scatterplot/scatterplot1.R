# Sample data for crop yield and fertilizer amount

x <- c(2.1, 2.5, 2.3, 2.9, 3.0, 1.8, 2.7, 3.1, 2.6, 2.4)  # X-axis (crop yield)
y <- c(5.1, 6.2, 5.9, 6.8, 7.0, 4.9, 6.5, 7.2, 6.6, 6.1)  # Y-axis (fertilizer amount)

# Create a scatter plot with customized options
plot(x, y,
     main = "Scatter Plot of Crop Yield vs Fertilizer",
     xlab = "Crop Yield (tons per hectare)",   # X-axis label
     ylab = "Fertilizer Amount (kg/ha)",       # Y-axis label
     pch = 19,                                # Point shape (solid circle)
     col = rgb(0, 0, 1, 0.5),                 # Transparent blue color for points
     cex = 1.5,                               # Size of points
     xlim = c(1.5, 3.5),                      # X-axis limits
     ylim = c(4.5, 7.5),                      # Y-axis limits
     las = 1,                                 # Rotate axis labels to horizontal
     bg = "lightgray",                        # Background color of the plot area
     xaxt = "n",                              # Hide the default x-axis
     yaxt = "n")                              # Hide the default y-axis

# Customize the x-axis and y-axis ticks
axis(1, at = seq(1.5, 3.5, by = 0.5))         # Custom x-axis ticks
axis(2, at = seq(4.5, 7.5, by = 0.5))         # Custom y-axis ticks

# Add a regression line
model <- lm(y ~ x)                           # Fit a linear regression model
abline(model, col = "red", lwd = 2)          # Add the regression line in red

# Add grid lines for better readability
grid(nx = NULL, ny = NULL, col = "gray", lty = "dotted")

# Add a legend
legend("topright", legend = c("Data points", "Regression line"), 
       col = c(rgb(0, 0, 1, 0.5), "red"), pch = 19, lwd = 2, bg = "white")
