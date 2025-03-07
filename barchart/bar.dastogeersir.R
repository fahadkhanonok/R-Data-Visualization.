# Load required libraries
library(ggplot2)
library(dplyr)

# Read dataset (Update file path if needed)
data <- read.csv("D:/R codes/ggplot.sumlation.agri/datdata1.csv", header = TRUE)

# Load required libraries
library(ggplot2)
library(dplyr)

# Create the dataset
data <- data.frame(
  Variety = rep(c("Variety 1", "Variety 2"), each = 4),
  Treatment = rep(c("Control", "Biocontrol", "Fungicide A", "Fungicide B"), 2),
  Mean_di = c(57.67, 50, 40, 28, 63.33, 52.67, 42.33, 30),
  SE_di = c(1.45, 1.15, 1.15, 1.15, 0.88, 1.45, 1.45, 1.15)
)

# Generate the bar plot with standard error bars
ggplot(data, aes(x = Treatment, y = Mean_di, fill = Treatment)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  geom_errorbar(aes(ymin = Mean_di - SE_di, ymax = Mean_di + SE_di), 
                width = 0.2, color = "black") +
  facet_wrap(~ Variety) +  # Create separate graphs for each variety
  labs(
    title = "Disease Severity Under Different Treatments",
    x = "Treatment",
    y = "Mean Disease Severity",
    fill = "Treatment"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    legend.position = "bottom"
  )
