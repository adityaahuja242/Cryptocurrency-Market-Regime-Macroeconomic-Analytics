# Cryptocurrency Market Regime & Macroeconomic Analytics

## Project Overview

This project analyses cryptocurrency market behaviour using macroeconomic indicators, unsupervised machine learning, sentiment-driven market analysis, and financial time-series modelling.

The objective was to investigate whether Bitcoin behaves as:
- an independent financial asset,
- a speculative risk-on asset,
- or a market-sensitive macroeconomic instrument.

The project combines:
- financial analytics,
- clustering,
- principal component analysis (PCA),
- Hidden Markov Models (HMM),
- motif discovery,
- and business intelligence visualisation

to identify market regimes, volatility behaviour, and macroeconomic relationships affecting cryptocurrency performance.

---

# Business Problem

Cryptocurrency markets are often described as decentralised and independent from traditional financial systems. However, growing institutional participation has raised important questions:

- Does Bitcoin behave independently from traditional markets?
- How does fear and market uncertainty affect cryptocurrency performance?
- Is Bitcoin influenced by macroeconomic conditions such as inflation and USD movement?
- Can machine learning identify recurring market regimes and behavioural patterns?

This project applies advanced analytics and machine learning techniques to evaluate Bitcoin’s relationship with:
- the S&P 500,
- Gold,
- USD Index,
- VIX Fear Index,
- and public search sentiment.

---

# Research Objectives

The project focused on four major analytical themes:

## 1. Fear & Volatility Analysis
Analyse how market fear and volatility (VIX Index) influence Bitcoin and traditional financial assets.

## 2. Macroeconomic Relationships
Evaluate Bitcoin’s relationship with:
- S&P 500,
- Gold,
- USD Index,
- and broader financial market behaviour.

## 3. Public Sentiment & Behaviour
Investigate how public interest and search behaviour impact Bitcoin volatility using Google Trends data.

## 4. Market Regime Identification
Apply unsupervised machine learning techniques to identify recurring cryptocurrency market regimes and behavioural clusters.

---

# Dataset Overview

The project integrated multiple macroeconomic and financial datasets, including:

### Datasets Used
- Bitcoin historical trading data
- S&P 500 market data
- Gold price data
- USD Index data
- VIX Fear Index data
- Google Trends search interest data

### Final Analytical Dataset
- Multi-source financial time-series dataset
- Daily market observations across multiple asset classes
- Structured macroeconomic and behavioural datasets
- Merged and standardised temporal financial data

The project involved:
- data extraction,
- preprocessing,
- cleaning,
- time alignment,
- return calculations,
- and financial data transformation workflows.

---

# Analytical Workflow

## Data Preparation
- Imported and standardised multiple financial datasets
- Converted raw market data into daily return structures
- Merged macroeconomic datasets using time-series alignment
- Cleaned and transformed structured financial datasets
- Created return-based analytical variables

---

# Methods & Techniques

## Unsupervised Machine Learning
Applied clustering techniques to identify hidden market structures and behavioural regimes.

### Techniques Used
- K-Means Clustering
- Principal Component Analysis (PCA)
- Regime Classification

### Identified Market Regimes
- BTC-Led Rally
- Correction Regime
- Fear Regime

---

## Time-Series & Financial Analytics

Performed:
- volatility analysis,
- anomaly detection,
- rolling trend analysis,
- and asset return comparisons.

### Financial Indicators Analysed
- Bitcoin Returns
- S&P 500 Returns
- Gold Returns
- USD Index Returns
- VIX Returns

---

## Hidden Markov Models (HMM)

Implemented Hidden Markov Models to detect hidden market states and regime transitions within Bitcoin returns.

The HMM analysis identified recurring behavioural states associated with:
- volatility spikes,
- market rallies,
- and correction periods.

---

## Motif Discovery

Applied motif discovery techniques using matrix profile analysis to identify repeating patterns and recurring structures in Bitcoin return behaviour.

This helped uncover:
- repeated market structures,
- recurring volatility patterns,
- and cyclical trading behaviour.

---

# Key Findings

## Market Behaviour Insights
- Bitcoin displayed strong correlations with risk-on market behaviour during volatility periods.
- Fear-driven environments produced identifiable market correction regimes.
- Bitcoin increasingly behaved similarly to speculative financial assets rather than an independent hedge instrument.

## Regime Analysis
Three major market regimes were identified:
1. BTC-Led Rally
2. Correction Regime
3. Fear Regime

Each regime demonstrated distinct:
- volatility characteristics,
- macroeconomic relationships,
- and asset return behaviour.

## Macroeconomic Relationships
- Rising VIX levels were associated with increased market instability.
- Bitcoin showed stronger alignment with equity market movements during certain periods.
- USD strength negatively impacted Bitcoin performance in several market conditions.

---

# Visualisation & Business Intelligence

Interactive Power BI dashboards were developed to visualise:
- market regimes,
- volatility trends,
- macroeconomic relationships,
- clustering outputs,
- and asset performance patterns.

The dashboards enabled intuitive exploration of:
- regime transitions,
- financial correlations,
- and behavioural market structures.

---

# Tools & Technologies

## Programming & Analytics
- R
- Python

## Machine Learning & Statistical Analysis
- K-Means Clustering
- Principal Component Analysis (PCA)
- Hidden Markov Models (HMM)
- Motif Discovery
- Time-Series Analysis

## Libraries & Frameworks
- depmixS4
- factoextra
- ggplot2
- plotly
- tsmp
- dplyr
- tidyverse

## Visualisation & Reporting
- Power BI
- ggplot2
- Plotly

---

# Repository Structure

```bash
├── data/
│   ├── sample datasets
│   ├── processed financial data
│
├── scripts/
│   ├── preprocessing.R
│   ├── clustering_analysis.R
│   ├── hmm_analysis.R
│   ├── motif_discovery.R
│
├── dashboards/
│   ├── powerbi_dashboard.pbix
│   ├── dashboard_screenshots
│
├── visualisations/
│   ├── PCA plots
│   ├── regime analysis charts
│   ├── volatility visualisations
│
├── reports/
│   ├── final report
│   ├── presentation slides
│
├── README.md
