# ==============================
# BUSINFO 703 - Crypto Regime Analysis
# ==============================

# Load Libraries
library(dplyr)
library(readr)
library(lubridate)
library(factoextra)
library(cluster)
library(ggplot2)
library(ggfortify)
library(plotly)
library(tidyr)
library(zoo)
library(depmixS4)     # For HMM
library(tsmp)         # For motif discovery

# ==============================
# Load & Merge Data
# ==============================
btc <- read_csv("CryptoData.csv")
sp500 <- read_csv("SP500Data.csv")
gold <- read_csv("GoldData.csv")
usd <- read_csv("USDindexData.csv")
vix <- read_csv("VIXData.csv")

btc$Date <- dmy(btc$Date)
sp500$Date <- dmy(sp500$Date)
gold$Date <- dmy(gold$Date)
usd$Date <- dmy(usd$Date)
vix$Date <- dmy(vix$Date)

btc   <- dplyr::select(btc, Date, BTC_Return = Daily_Return)
sp500 <- dplyr::select(sp500, Date, SP500_Return = SP500_Daily_Return)
gold  <- dplyr::select(gold, Date, Gold_Return = Gold_Daily_Return)
usd   <- dplyr::select(usd, Date, USD_Return = USD_Daily_Return)
vix   <- dplyr::select(vix, Date, VIX_Return = VIX_Daily_Return)


merged <- btc %>%
  inner_join(sp500, by = "Date") %>%
  inner_join(gold, by = "Date") %>%
  inner_join(usd, by = "Date") %>%
  inner_join(vix, by = "Date") %>%
  drop_na()

write_csv(merged, "TimePoint_Asset_Returns.csv")

# ==============================
# Clustering & PCA
# ==============================
returns_scaled <- scale(merged[, -1])
pca <- prcomp(returns_scaled, center = TRUE, scale. = TRUE)
eig_ratio <- cumsum(pca$sdev^2 / sum(pca$sdev^2))
k_limit <- which(eig_ratio > 0.9)[1]
pca_data <- pca$x[, 1:k_limit]

fviz_nbclust(pca_data, kmeans, method = "wss")

set.seed(123)
km <- kmeans(pca_data, centers = 3, nstart = 25)

merged$Cluster <- as.factor(km$cluster)
merged$Regime <- case_when(
  merged$Cluster == 1 ~ "Correction Regime",
  merged$Cluster == 2 ~ "Fear Regime",
  merged$Cluster == 3 ~ "BTC-Led Rally"
)

# ==============================
# PCA Plot
# ==============================
pca_df <- data.frame(PC1 = pca$x[, 1], PC2 = pca$x[, 2], Cluster = merged$Cluster)
ggplot(pca_df, aes(x = PC1, y = PC2, color = Cluster)) +
  geom_point(size = 2, alpha = 0.7) +
  theme_minimal() +
  labs(title = "PCA - Market Regimes", x = "PC1", y = "PC2")

# ==============================
# Regime Over Time
# ==============================
merged <- merged %>%
  mutate(Regime = factor(Regime, levels = c("BTC-Led Rally", "Correction Regime", "Fear Regime")),
         Regime_Num = as.numeric(Regime))

ggplot(merged, aes(x = Date, y = Regime_Num, color = Regime)) +
  geom_jitter(height = 0.3, size = 1.5, alpha = 0.7) +
  scale_y_continuous(breaks = 1:3, labels = levels(merged$Regime)) +
  labs(title = "Market Regimes Over Time", y = "Regime", x = "Date") +
  theme_minimal()

# ==============================
# Cluster Summary
# ==============================
summary_table <- merged %>%
  group_by(Cluster) %>%
  summarise(across(contains("_Return"), mean), Days = n())
print(summary_table)

# ==============================
# Motif Discovery (BTC Only)
# ==============================
library(tsmp)

# Step 1: Convert BTC returns to time series
btc_ts <- merged$BTC_Return

# Step 2: Compute Matrix Profile
mp <- tsmp(btc_ts, window_size = 30, mode = "stomp")

# Step 3: Find top 2 motifs using `find_motifs()`
motif_result <- find_motif(mp, n_motifs = 2)

# Step 4: Plot motifs
plot(motif_result)

# ==============================
# Hidden Markov Model (HMM)
# ==============================
set.seed(123)
hmm_model <- depmix(BTC_Return ~ 1, data = merged, nstates = 3, family = gaussian())
hmm_fit <- fit(hmm_model)
merged$HMM_State <- posterior(hmm_fit)$state

ggplot(merged, aes(x = Date, y = BTC_Return, color = as.factor(HMM_State))) +
  geom_line() +
  labs(title = "BTC Return with HMM States", color = "State") +
  theme_minimal()


