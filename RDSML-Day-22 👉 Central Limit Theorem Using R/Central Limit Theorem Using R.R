# ===============================
# Load required libraries
# ===============================
library(dplyr)
library(ggplot2)

# ===============================
# Load dataset
# ===============================
tooth_data <- ToothGrowth

# ===============================
# Create summary data
# (mean and standard deviation)
# ===============================
d_summary <- tooth_data %>%
  group_by(supp, dose) %>%
  summarise(
    len = mean(len, na.rm = TRUE),
    sd  = sd(len, na.rm = TRUE),
    .groups = "drop"
  )

# Convert dose to factor
d_summary$dose <- as.factor(d_summary$dose)

# View summary data
print(d_summary)

# ===============================
# Bar plot with SD error bars
# ===============================
ggplot(d_summary, aes(x = dose, y = len, fill = supp)) +
  geom_bar(
    stat = "identity",
    position = position_dodge()
  ) +
  geom_errorbar(
    aes(ymin = len - sd, ymax = len + sd),
    width = 0.2,
    position = position_dodge(0.9)
  ) +
  labs(
    title = "Tooth Length by Supplement Type and Dose",
    x = "Dose",
    y = "Mean Tooth Length"
  ) +
  scale_fill_brewer(palette = "Paired") +
  theme_minimal()

