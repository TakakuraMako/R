library(dplyr)
data <- read.table(here::here("data", "545110-99999-2023"), header = TRUE)

new_col <- c(1, 2)
new <- mutate(data[1:2, ], new_col, col_name = c(1))
print(new)

c(1:10) %>% sum()
# 等价
sum(c(1:10))
c(-10:10) %>% abs() %>% sum() %>% sqrt() #从左到右

print(select(data, 1))
data %>% select(ends_with("r"))
data %>% select(where(is.numeric) & starts_with("2"))
data %>% rename(year = X2023)
data %>% filter(X01.1 == 4)
data %>% group_by(X01) %>% summarise(mean_X.59 = mean(X.59))
data %>% arrange(X.59)

# df1 <- df_new %>% 
#   group_by(name) %>% 
#   summarise( 
#     mean_score = mean(total) 
#   )
