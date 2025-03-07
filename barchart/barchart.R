# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read the dataset (adjust file path accordingly)
rdsa.b <- read.csv("D:/R codes/ggplot.sumlation.agri/rdrsa2.csv", fileEncoding = "UTF-8")

# Convert categorical variables to factors
rdsa.b$Pesticide_Type <- factor(rdsa.b$Pesticide_Type, levels = c(1, 2), labels = c("Biopesticide", "Chemical"))

# Create bar plot for average yield per pesticide type
ggplot(rdsa.b, aes(x = Pesticide_Type, y = Yield..kg.ha., fill = Pesticide_Type)) +
  geom_bar(stat = "summary", fun = "mean", width = 0.6) +  # Mean yield per pesticide type
  scale_fill_manual(values = c("green", "orange")) +  # Custom colors
  labs(
    title = "Average Yield per Pesticide Type",
    x = "Pesticide Type",
    y = "Average Yield (kg/ha)"
  ) +
  theme_minimal(base_size = 14) +  # Clean theme
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    legend.position = "none"
  )
#or
# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read dataset
rdsa.b <- read.csv("D:/R codes/ggplot.sumlation.agri/rdrsa2.csv", fileEncoding = "UTF-8")

# Convert pesticide column (assumed to be in column 3) into a factor
rdsa.b$Pesticide_Name <- as.factor(rdsa.b[[3]])  # Ensure pesticide names are treated as categories

# Summarize data (average yield per pesticide)
avg_yield <- rdsa.b %>%
  group_by(Pesticide_Name) %>%
  summarise(Average_Yield = mean(Yield..kg.ha., na.rm = TRUE))

# Create bar plot
ggplot(avg_yield, aes(x = reorder(Pesticide_Name, -Average_Yield), y = Average_Yield, fill = Pesticide_Name)) +
  geom_bar(stat = "identity", width = 0.6, color = "black", show.legend = FALSE) +
  geom_text(aes(label = round(Average_Yield, 1)), vjust = -0.5, size = 5, fontface = "bold") +  # Show yield values on bars
  scale_fill_manual(values = colorRampPalette(c("blue", "green", "red", "purple", "pink"))(length(unique(avg_yield$Pesticide_Name)))) +  # Assign distinct colors
  labs(
    title = "Yield Performance of Different Pesticides",
    x = "Pesticide Name",
    y = "Average Yield (kg/ha)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, size = 12),  # Rotate x-axis labels for readability
    plot.title = element_text(hjust = 0.5, face = "bold")
  )
