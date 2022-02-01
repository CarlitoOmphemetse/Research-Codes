
df <- read.csv('shap_60.csv')

head(df)

shapiro.test(df$uncertainty)

shapiro.test(df$program_runtime)

shapiro.test(df$memory_usage)
