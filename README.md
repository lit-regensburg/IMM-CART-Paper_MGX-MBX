# README

This repository contains code and resources to reproduce the analyses presented in Perl et al. (2025) "Opposing Functions of Gut Immunomodulatory Metabolites on CAR-T Therapy." The study investigates the interactions between gut microbiome-derived metabolites and CAR-T cell therapy efficacy through integrative metagenomic and metabolomic analyses.

## Repository Structure

- `0_data`: Directory for raw data used in the analysis. 
- `1_code/Analysis_Perl_et_al.qmd`: Quarto script performing the main data analysis.
- `1_code/Figures_Perl_et_al.qmd`: Quarto script with functions and code to generate figures from the analysis output.
- `2_analysis`: Output directory where processed data and figures are saved after running the scripts.
- `3_env/`: Information on the computational environment, including package versions and dependencies.

## Data Availability

Raw and processed data supporting this analysis are currently available only upon reasonable request. This might change after publication. 

## Setup and Usage

1. Install container or required R packages and dependencies listed in `3_env/`.
2. Run `1_code/Analysis_Perl_et_al.qmd` to perform the primary data processing and analysis.
3. Execute `1_code/Figures_Perl_et_al.qmd` to generate all figures for the manuscript. Figures will be saved to `2_analysis/Figures/`.

## Citation

Please cite Perl et al. (2025, currently not published) when using this code or derived results.

---

For questions or issues, please open an issue or contact Markus Perl or Simon Holzinger.