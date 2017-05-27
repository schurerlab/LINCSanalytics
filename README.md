# LINCSanalytics
R package to query and compute data and metadata from LINCS project

To install the package from R use the install_github function from package devtools:<br>
> install.packages("devtools")<br>
> library(devtools)<br>
> install_github("mforlin/LINCSanalytics")<br>
> library(LINCSanalytics)

Current version includes the following functions:<br>
<li>available_data(), lists the available LINCS datasets, their ID and assay name<br>
<li>get_L1000ph1_expression(), retrieves L1000 data from LINCS Phase 1, weighted average of replicates z-scores (level 5)<br>
<li>get_L1000ph2_expression(), retrieves L1000 data from LINCS Phase 2, weighted average of replicates z-scores (level 5)<br>
<li>get_p100_expression(), retrieves P100 data, plate normalized log2 fold change.<br>
<li>get_gcp_expression(), retrieves Global Chromatin Profiling (GCP) data, plate normalized log2 fold change<br>
<li>get_kinomescan(), retrieves KINOMEscan assay data, percent control or Kd.<br>
<li>get_kinatv(), retrieve KiNativ assay data, percent inhibition or IC50<br>
<li>predict_kinase(), predicts kinase inhibition probability for a given small molecule smiles (Knet model, ref)<br>

Help is available using:
> ?function_name
