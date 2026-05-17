# Global-Energy-Data-Analysis-Dashboard

### Dashboard Link : *(To be updated after Power BI Service publication)*

# Problem Statement

This dashboard provides a comprehensive analytical overview of global energy market trends by monitoring critical indicators such as coal prices, crude oil prices, LNG prices, natural gas prices, mining indices and energy stock performance. The objective of this project is to transform complex energy market datasets into actionable business intelligence through interactive visualizations and KPI-driven reporting.

The dashboard enables stakeholders to evaluate commodity price movements, compare energy resources, analyze market volatility and identify long-term pricing trends across multiple global energy sectors.

By integrating historical energy pricing data with stock market indicators and commodity analytics, the report supports data-driven strategic decision-making, energy market monitoring and investment analysis.

# Dataset Overview

The dataset used for this dashboard contains structured global energy market records with the following attributes:

- Date
- Coal_RB_4800_FOB_London_Close_USD
- Coal_RB_5500_FOB_London_Close_USD
- Coal_RB_5700_FOB_London_Close_USD
- Coal_RB_6000_FOB_CurrentWeek_Avg_USD
- Coal_India_5500_CFR_London_Close_USD
- Price_WTI
- Price_Brent_Oil
- Price_Dubai_Brent_Oil
- Price_ExxonMobil
- Price_Shenhua
- Price_All_Share
- Price_Mining
- Price_LNG_Japan_Korea_Marker_PLATTS
- Price_ZAR_USD
- Price_Natural_Gas
- Price_ICE
- Price_Dutch_TTF
- Price_Indian_en_exg_rate

The data was imported into **Power BI Desktop**, transformed using **Power Query**, and modeled for advanced analysis and visualization.

# Steps Followed

## Data Preparation

- Step 1 : Imported global energy datasets into power bi desktop.
- Step 2 : Opened power query editor and enabled column quality, column distribution and column profile for data validation.
- Step 3 : Enabled column profiling for the entire dataset instead of the default 1000 rows.
- Step 4 : Validated and corrected data types for all pricing and numerical fields.
- Step 5 : Handled missing values and removed duplicate records where applicable.
- Step 6 : Standardized date formatting for time-series analysis.

## Data Modeling

- Step 7 : Created relationships between commodity pricing datasets and market indices.
- Step 8 : Developed calculated measures using DAX for Total Coal Price, Oil Price Trends, LNG Analysis and market comparisons.
- Step 9 : Created dynamic date filtering measures for interactive analysis.

## Visualization Development

- Step 10 : Designed a professional dashboard layout with a clean energy-themed interface.
- Step 11 : Added date slicers for dynamic filtering and trend analysis.
- Step 12 : Created KPI cards for Coal RB 6000, Brent Oil, Natural Gas and LNG pricing.
- Step 13 : Built line charts to analyze energy price trends over time.
- Step 14 : Developed bar charts for oil price comparison and stock analysis.
- Step 15 : Created donut charts to visualize coal price contribution by grade.
- Step 16 : Designed comparative visualizations for Mining vs All Share Index analysis.
- Step 17 : Added interactive tabs for Oil, Coal and Gas pricing analytics.
- Step 18 : Created a detailed analytical table for commodity price exploration.

## Deployment

- Step 19 : Published the report to power bi service for interactive business intelligence reporting and stakeholder access.

# Key Performance Indicators (KPIs)

The dashboard presents several key metrics at the top level to provide an executive overview of global energy market performance:

### Coal RB 6000 Price (159.80K)
Represents the aggregated pricing trend of RB 6000 grade coal.

### Brent Oil Price (84.45K)
Indicates overall Brent crude oil pricing performance.

### Natural Gas Price (4.09K)
Shows natural gas market pricing trends.

### LNG Price (19.51K)
Represents LNG Japan Korea Marker pricing analysis.

These KPIs help analysts and stakeholders quickly assess market conditions and pricing volatility.

# Dashboard Snapshot

## Main Dashboard Overview

![Global Energy Dashboard](https://github.com/user-attachments/assets/eca4a69a-cc95-4cf5-9c8c-8de416ecedd4)

# Energy Stock Price Comparison

The dashboard compares stock performance between major energy companies and coal market trends.

### Companies Analyzed:
- ExxonMobil
- Shenhua

### Key Observations:
- Energy stock performance fluctuated significantly between 2020–2024.
- Coal-linked stocks demonstrated strong growth during peak commodity demand periods.
- Market recovery trends are visible after 2021.

![Energy Stock Price Comparison](https://github.com/user-attachments/assets/6920c920-3421-4add-955d-53f470a6e0b0)

# Oil Price Comparison

A comparative analysis of major crude oil benchmarks is included:

- Brent Oil
- WTI
- Dubai Brent Oil

### Key Findings:
- Oil prices peaked during 2022 due to global market volatility.
- Brent and Dubai crude prices maintained similar trend patterns.
- Significant decline observed after peak market periods.

![Oil Price Comparison](https://github.com/user-attachments/assets/341dcb59-8058-4053-8e67-6f578672533d)

# Coal Price Contribution by Grade

A donut chart visualizes the contribution of different coal grades to overall coal pricing.

### Coal Grades Analyzed:
- Coal 4800
- Coal 5500
- Coal 5700
- Coal 5500 CFR
- Coal RB 6000 FOB

This analysis helps identify the most influential coal categories in the global market.

![Coal Price Contribution](https://github.com/user-attachments/assets/af943ccf-a9fe-4469-92c7-7d7f4634d48a)

# Energy Price Trends

A line chart visualizes pricing trends across:

- Coal RB 6000
- Brent Oil
- Natural Gas

### Key Insights:
- Energy commodities experienced high volatility between 2021 and 2023.
- Coal prices showed the strongest growth trend during energy demand surges.
- Natural gas pricing remained comparatively stable.

![Energy Price Trends](https://github.com/user-attachments/assets/39c42778-e2ce-4c87-afa5-74fbcf642043)

# Gas Price Comparison

The dashboard compares:

- Dutch TTF
- Natural Gas
- LNG Prices

### Key Findings:
- Dutch TTF prices experienced significant spikes during 2022.
- LNG prices reflected international market instability.
- Gas markets displayed strong year-over-year fluctuations.

![Gas Price Comparison](https://github.com/user-attachments/assets/da67b6f0-6e65-44d1-8214-a809a894fb66)

# Mining vs All Share Index Analysis

This visualization compares:

- Mining Index
- All Share Market Index

### Insights Generated:
- Mining indices closely followed energy commodity trends.
- Market corrections impacted mining performance after 2023.
- Strong positive correlation observed during commodity growth cycles.

![Mining vs All Share Index](https://github.com/user-attachments/assets/331217d1-b0ad-4358-ac90-8125659ff8d7)

# Oil Prices Over Time

The dashboard includes an interactive section for analyzing oil price trends across multiple years.

### Features Included:
- Dynamic category switching
- Comparative yearly analysis
- Interactive visual exploration

![Oil Prices Over Time](UPLOAD_IMAGE_LINK_HERE)

# Global Energy Price Table

A detailed analytical table allows users to explore commodity pricing records with date-based filtering.

### Features:
- Dynamic filtering
- Multi-column analysis
- Historical price exploration
- Interactive table scrolling

![Global Energy Price Table](UPLOAD_IMAGE_LINK_HERE)

# Filters

The dashboard includes several interactive components for dynamic exploration.

## Slicers

- Date Range Filter
- Commodity Category Filters
- Energy Type Selection Tabs

# Key Business Insights

The dashboard reveals several important insights:

- Coal prices experienced significant growth during global energy demand surges.
- Brent Oil and WTI prices showed strong correlation patterns.
- LNG and Dutch TTF markets displayed high volatility during 2022.
- Mining index performance closely aligned with commodity market trends.
- Interactive analytics improved comparative energy market evaluation.

These insights support energy market monitoring, commodity analysis and strategic investment decision-making.

# Challenges Faced

During project development, several real-world analytical challenges were encountered:

- Handling large multi-source energy datasets.
- Cleaning inconsistent commodity pricing records.
- Managing missing values and duplicate entries.
- Designing dashboards capable of displaying multiple commodity comparisons simultaneously.
- Creating user-friendly visualizations for complex market trends.

# Solutions Implemented

To overcome these challenges:

- Applied data cleaning and transformation techniques using Power Query.
- Standardized pricing formats and date structures.
- Built dynamic DAX measures for advanced calculations.
- Designed interactive visualizations for easier market interpretation.
- Implemented slicers and filtering mechanisms for better analytical flexibility.

# Conclusion

The **Global Energy Data Analysis Power BI Dashboard** provides a powerful analytical platform for monitoring global energy markets and commodity pricing trends.

By integrating coal pricing, crude oil analysis, LNG trends, stock performance and mining market analytics, the dashboard enables stakeholders to:

- Monitor global energy markets
- Analyze commodity volatility
- Compare multi-sector energy trends
- Improve investment and business decisions
- Generate data-driven market insights

Overall, this dashboard demonstrates the practical application of data analytics and business intelligence in solving real-world energy market analysis problems.
