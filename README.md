# Week 1 – Data Cleaning and Preliminary Analysis with R

## Project Overview

This project focuses on data cleaning, preprocessing, and preliminary exploratory data analysis using R. The Titanic passenger survival dataset was selected because it contains both numerical and categorical variables along with missing values and an outlier, making it suitable for demonstrating a practical data-cleaning workflow.

The analysis covers dataset inspection, missing-value treatment, outlier detection, numerical scaling, categorical encoding, descriptive statistics, correlation analysis, and visualization.

## Objectives

* Inspect and understand the dataset
* Identify missing values and data-quality issues
* Handle missing numerical and categorical values
* Detect and treat outliers using the IQR method
* Standardize numerical variables
* Convert categorical variables into factors
* Perform preliminary exploratory data analysis
* Generate visualizations and initial insights

## Dataset

The dataset contains information about Titanic passengers, including:

* Passenger ID
* Survival status
* Passenger class
* Sex
* Age
* Number of siblings/spouses aboard
* Number of parents/children aboard
* Fare
* Port of embarkation

The working dataset contains 150 observations and includes missing values in `Age` and `Embarked`, along with an unusually high `Fare` value for outlier analysis.

## Data Cleaning

### Missing Values

* Missing `Age` values were replaced using the median age.
* Missing `Embarked` values were replaced using the mode.

Median imputation was selected for Age because it is less affected by extreme observations than the mean. Mode imputation was used for the categorical Embarked variable.

### Outlier Detection

The Interquartile Range (IQR) method was used to identify unusual Fare values.

The calculated boundaries were:

* Lower bound: Q1 − 1.5 × IQR
* Upper bound: Q3 + 1.5 × IQR

Values outside these boundaries were capped to the corresponding boundary values.

### Numerical Scaling

Z-score standardization was applied to:

* Age
* Cleaned Fare

The transformed variables have approximately a mean of 0 and a standard deviation of 1.

### Categorical Encoding

The following variables were converted into categorical factors in R:

* Sex
* Pclass
* Embarked

## Exploratory Data Analysis

The analysis includes:

* Summary statistics
* Frequency distributions
* Survival-rate analysis
* Correlation analysis
* Boxplots
* Bar charts

## Key Preliminary Insights

The exploratory analysis shows differences in survival rates across passenger sex and passenger class. Female passengers in this working dataset had a higher observed survival rate than male passengers. Survival rates also varied across passenger classes.

These findings are descriptive and indicate patterns within the dataset; they should not be interpreted as causal relationships.

## Technologies Used

* R
* RStudio
* dplyr
* ggplot2
* CSV
* GitHub

## Repository Contents

```text
├── README.md
├── week1_titanic_analysis.R
├── titanic_week1_dataset.csv
├── titanic_cleaned.csv
└── visualizations/
    ├── missing_values_before.png
    ├── fare_outlier.png
    ├── fare_after_cleaning.png
    └── survival_by_sex.png
```

## How to Run

1. Clone or download this repository.
2. Open `week1_titanic_analysis.R` in RStudio.
3. Place the CSV dataset in the same working directory.
4. Install the required packages if they are not already installed:

```r
install.packages("dplyr")
install.packages("ggplot2")
```

5. Run the R script.
6. Review the generated summaries, analysis results, and visualizations.

## Conclusion

This project demonstrates a complete introductory data-cleaning and exploratory-analysis workflow using R. The cleaned dataset can be used as a foundation for further statistical analysis or machine-learning modeling.

---

**Author:** Saravanan
**Project:** Week 1 – Data Cleaning and Preliminary Analysis with R
