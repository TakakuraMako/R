library(dplyr)
data <- read.table(here::here("data", "545110-99999-2023"), header = FALSE)
data <- data[, 1:6]
colnames(data) <- c("year", "month", "day", "hour", "higest", "lowest")
print(data)
data[,5:6] <- data[, 5:6]/10
print(data)
# data %>% is.na()
# new_col <- c(1, 2)
# # 新增列
# new <- mutate(data[1:2, ], new_col, col_name = c(1))
# print(new)

# 选择列
data[1:5, ] %>% select(ends_with("r"))
data[1:5, ] %>% select(where(is.numeric) & starts_with("d"))
data %>% rename(days = day)
data %>% filter(hour == 4)
data %>% group_by(hour) %>% summarise(mean_higest = mean(higest))
data %>% arrange(lowest)
data <- data %>% filter(lowest > -19.8) %>% drop()
print(data)
# df1 <- df_new %>% 
#   group_by(name) %>% 
#   summarise( 
#     mean_score = mean(total) 
#   )
