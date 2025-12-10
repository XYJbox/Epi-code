conda activate pyscenic 
cat >change.py
import os,sys
import loompy as lp;
import numpy as np;
import scanpy as sc;
x=sc.read_csv("for.pyscenic.csv");
row_attrs = {"Gene": np.array(x.var_names),};
col_attrs = {"CellID": np.array(x.obs_names)};
lp.create("sample.loom",x.X.transpose(),row_attrs,ol_attrs)

python change.py

dir=/data_disk/human/ 
tfs=$dir/allTFs_hg38.txt
feather=$dir/hg38_10kbp_up_10kbp_down_full_tx_v10_clust.genes_vs_motifs.rankings.feather
tbl=$dir/motifs-v10nr_clust-nr.hgnc-m0.001-o0.0.tbl
CORE=10

input_loom=./sample.loom
ls $tfs  $feather  $tbl  

pyscenic grn \
--num_workers $CORE \
--output adj.sample.tsv \
--method grnboost2 \
sample.loom \
$tfs

pyscenic ctx \
adj.sample.tsv $feather \
--annotations_fname $tbl \
--expression_mtx_fname $input_loom  \
--mode "dask_multiprocessing" \
--output reg.csv \
--num_workers $CORE  \
--mask_dropouts

pyscenic aucell \
$input_loom \
reg.csv \
--output out_SCENIC.loom \
--num_workers $CORE

nohup bash scenic_human.bash  1>pySCENIC.log 2>&1 &


