To ensure reproducibility of the analysis results,
please refer to the following software versions and environment configurations when running the code:
The computational workflow relies on the tools and packages listed below with their respective versions:

R: ≥4.3.0
Seurat: v5.1.0
scDblFinder: v1.18.0
Nebulosa: v1.14.0
clusterProfiler: v4.12.6
ggplot2: v3.5.1
scProportionTest: (GitHub)
scDist: (GitHub)
CellChat: v1.6.1
pySCENIC: v0.12.1
Monocle: v2.26.0

Note: The code consists of two parts: R code and Python code, both of which need to be executed actively. The processed data used in the analysis is located in the Data/ directory, where you can directly load the Seurat objects by reading "data1_seurat.rds" and "data2_seurat.rds". The R code should be run first to process the data, followed by the Python code for SCENIC analysis. 
