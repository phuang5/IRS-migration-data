# Introduction

This repository provides updated data and code for IRS County-to-County Migration Data. This is based on the [**repository**](https://github.com/mathewhauer/IRS-migration-data) developed by [**Hauer & Byars (2017)**](https://doi.org/10.4054/DemRes.2019.40.40). Thank you for publishing this data!

#Updates This updated version resolves a few errors in the previous data, including 1) some mis-coded FIPS codes in Year 1998, 2) one coding error in Year 2003, 3) error messages in processing excel files in Years 1992- and text files in Years 1990,1991, 4) underestimation of unidentified and total migrants in Years 1990,1991, and 5) clarification that the unidentified and total migrants include international migrants.

Detailed information can be found in [**changelog**](https://github.com/phuang5/IRS-migration-data-2.0/changelog.pdf)

### Citation

Please cite both this repository and the previous work by Hauer and Byars: 
>Huang, Peng. *IRS-migration-data-2.0* [Computer Software]. <https://github.com/phuang5/IRS-migration-data-2.0> 
> Hauer, Mathew, and James Byars . (2019). “IRS County-to-County Migration Data, 1990-2010.” *Demographic Research* 40: 1153-1166.

# Organization

Data is organized in identical format as the previous version: - `LATEX` — Contains latex files to reproduce the main manuscript file. - `R` - Contains the R scripts needed to reproduce the flat IRS migration datafile. - `MigData` — Initial data resources, unprocessed. - `DATA-PROCESSED` — Final, post-processed data.

# Use

-   Feel free to create a new branch for further incorporation and analysis.
-   Please properly cite all use of the underlying code or data. Thanks!

# Data

The final IRS migration data can be downloaded at `DATA-PROCESSED/county_migration_data.txt` or reproduced by running the `R/999-master_script.R` file.

# Codebook

`ORIGIN` - Refers to the 5-digit FIPS code for the origin of the migrants.

`DESTINATION` - Refers to the two-digit FIPS code associated with each state.

`1990:2010` - Refers to number of migrants who moved from ORIGIN to DESTINATION in a given year.

-   NOTE: there is an additional 5-digit FIPS code in the both the ORIGIN and DESTINATION field. This is coded as 99999 and is in reference to all migration flows containing less than 10 tax filers as well as international migration flows.

# Correspondence

For any issues with the functionality of these scripts please [create an issue](https://github.com/phuang5/IRS-migration-data-2.0/issues).

## License

The data collected and presented is licensed under the [Creative Commons Attribution 3.0 license](http://creativecommons.org/licenses/by/3.0/us/deed.en_US), and the underlying code used to format, analyze and display that content is licensed under the [MIT license](http://opensource.org/licenses/mit-license.php).
