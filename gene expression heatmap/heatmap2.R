# Load required libraries
library(pheatmap)
library(RColorBrewer)

# Read the gene expression dataset
gene_data <- read.csv("D:/R codes/ggplot.sumlation.agri/gene_expression_data.csv", row.names = 1)

# Ensure data is numeric
gene_matrix <- as.matrix(gene_data)

# Standardize data (Z-score normalization)
gene_matrix_scaled <- t(scale(t(gene_matrix)))

# Define color gradient for heatmap
heatmap_colors <- colorRampPalette(rev(brewer.pal(n = 9, name = "YlGnBu")))(100)

# Generate heatmap with hierarchical clustering
pheatmap(
  gene_matrix_scaled,
  color = heatmap_colors,
  cluster_rows = TRUE,     # Cluster genes
  cluster_cols = TRUE,     # Cluster samples
  scale = "none",          # Already scaled manually
  main = "Gene Expression Heatmap (Carbohydrate Metabolism)",
  fontsize = 10,
  border_color = "black"
)
