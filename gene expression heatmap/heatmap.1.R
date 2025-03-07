# Load necessary libraries
library(ggplot2)
library(reshape2)
library(pheatmap)
?reshape
# Read the dataset (Assuming CSV file is saved as "rice_panicle_blight.csv")
data_std <- read.csv("D:/R codes/ggplot.sumlation.agri/htmap1.csv", fileEncoding = "UTF-8",header = TRUE, row.names = 1)


# Convert all columns to numeric (Avoids NA/NaN errors)
data_std[] <- lapply(data_std, function(x) as.numeric(as.character(x)))

# Remove any rows/columns that contain NA values (if needed)
data_std <- na.omit(data_std)

# Convert dataset to a numeric matrix
data_matrix <- as.matrix(data_std)

# Check for any remaining NA, NaN, or Inf values and replace them (Prevents errors)
data_matrix[is.na(data_matrix)] <- 0

# Create heatmap with hierarchical clustering
pheatmap(
  data_matrix,
  scale = "none",                   # Data is already standardized
  clustering_distance_rows = "euclidean", 
  clustering_distance_cols = "euclidean",
  clustering_method = "ward.D2",     # Effective clustering method
  color = colorRampPalette(c("blue", "white", "red"))(50),  # Low (blue) → Medium (white) → High (red)
  border_color = "black",
  main = "Heatmap of Standardized Rice Panicle Blight Data",
  fontsize_row = 10, 
  fontsize_col = 10
)