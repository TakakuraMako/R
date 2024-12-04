library(readxl)
library(ggplot2)
library(lubridate)
library(dplyr)
library(patchwork) # 用于拼接多个图形
library(viridis)   # 提供渐变色彩方案
library(scales)    # 美化时间轴标签
# 导入数据
data <- read_excel("./data/新疆风电2019.xlsx")
data %>% head(5)

# 数据清理
data <- data %>%
  mutate(
    时间 = ymd_hms(时间),         # 转换时间为日期时间格式
    month = month(时间, label = TRUE), # 提取月份
    hour = hour(时间)              # 提取小时
  )

# 变量的直方图
# 查看实际发电功率（mw）的分布情况：
ggplot(data, aes(x = `实际发电功率（mw）`)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "white") +
  labs(
    title = "实际发电功率分布",
    x = "实际发电功率（MW）",
    y = "频数"
  ) +
  theme_minimal()

# 分组密度图
# 查看不同月份的风速分布（30m风速）：
ggplot(data, aes(x = `测风塔30m风速(m/s)`, fill = month)) +
  geom_density(alpha = 0.6) +
  scale_fill_brewer(palette = "Set3") +
  labs(
    title = "不同月份30米风速分布",
    x = "风速 (m/s)",
    y = "密度",
    fill = "月份"
  ) +
  theme_minimal()

# 按小时聚合的发电功率变化
# 计算每小时的平均发电功率，并绘制趋势图：
hourly_data <- data %>%
  group_by(hour) %>%
  summarise(avg_power = mean(`实际发电功率（mw）`, na.rm = TRUE))

ggplot(hourly_data, aes(x = hour, y = avg_power)) +
  geom_line(color = "darkorange", size = 1) +
  geom_point(color = "darkblue", size = 2) +
  labs(
    title = "一天中不同小时的平均发电功率",
    x = "小时",
    y = "平均发电功率（MW）"
  ) +
  theme_minimal()

# 多变量关系分析
# (1) 温度和湿度的散点图（加色彩编码）
# 通过颜色和透明度直观表示风速对温度与湿度关系的影响：
ggplot(data, aes(x = `温度(°)`, y = `湿度(%)`, color = `测风塔30m风速(m/s)`)) +
  geom_point(alpha = 0.6) +
  scale_color_viridis_c(option = "C") +
  labs(
    title = "温度与湿度的关系（风速编码）",
    x = "温度 (°C)",
    y = "湿度 (%)",
    color = "风速 (m/s)"
  ) +
  theme_minimal()


