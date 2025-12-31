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
# Correct summary function
# (NO ddply, NO plyr)
# ===============================
data_summary <- function(data, varname, groupnames) {
  
  data %>%
    group_by(across(all_of(groupnames))) %>%
    summarise(
      mean = mean(.data[[varname]], na.rm = TRUE),
      sd   = sd(.data[[varname]], na.rm = TRUE),
      .groups = "drop"
    ) %>%
    rename(!!varname := mean)
}

# ===============================
# Run the function
# ===============================
d_summary <- data_summary(
  data = tooth_data,
  varname = "len",
  groupnames = c("supp", "dose")
)

# Convert dose to factor
d_summary$dose <- as.factor(d_summary$dose)

# View output
print(d_summary)

# ===============================
# Bar plot with SD error bars
# ===============================
ggplot(d_summary, aes(x = dose, y = len, fill = supp)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_errorbar(
    aes(ymin = len - sd, ymax = len + sd),
    width = 0.2,
    position = position_dodge(0.9)
  ) +
  scale_fill_brewer(palette = "Paired") +
  theme_minimal() +
  labs(
    title = "Mean Tooth Length by Supplement and Dose",
    x = "Dose",
    y = "Mean Tooth Length"
  )
