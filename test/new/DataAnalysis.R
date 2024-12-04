# 导入程序包
library(ggplot2)
library(dplyr)

# 导入内置数据集diamonds
data <- diamonds
head(data)
str(data)

# 缺失值统计
data %>% summarise(
  across(everything(), ~ sum(is.na(.))))

# 条形图
#钻石总深度百分比及顶部相对于最宽点的宽度分布条形图
data %>% 
  summarise(depth_median=median(depth),
            table_median=median(table))
par(mfrow=c(1,2))
hist(data$depth,breaks = 40)
hist(data$table,breaks = 20)
#钻石的重量分布条形图
ggplot(data)+
  geom_histogram(aes(x=carat),binwidth=0.1)

# 饼图
#不同切割类型个数所占饼图
data %>%
  count(cut, sort = T)
pie(table(data$cut),labels=names(table(data$cut)))
#不同颜色个数所占比例饼图
data %>%
  count(color, sort = T)
pie(table(data$color),labels=names(table(data$color)))
#不同清晰度个数所占比例饼图
data %>%
  count(clarity, sort = T)
pie(table(data$clarity),labels=names(table(data$clarity)))

# 条形图
#理想切割、颜色和清晰度最好的钻石的价格分布条形图
data %>% 
  filter(cut=='Ideal',color=='D',clarity=='IF') %>% 
  summarise(average_price=mean(price),
            median_price=median(price),
            max_price=max(price),
            min_price=min(price))
ggplot(data %>% filter(cut=='Ideal',color=='D',clarity=='IF'))+
  geom_histogram(aes(x=price),bins=28)

# 小提琴图
#钻石切割情况与价格
ggplot(data)+
  geom_violin(aes(x=cut,y=sqrt(price),color=cut))

# 箱线图
#钻石颜色与价格
ggplot(data)+
  geom_boxplot(aes(x=color,y=sqrt(price),color=color))
#钻石清晰度与价格
ggplot(data)+
  geom_boxplot(aes(x=clarity,y=sqrt(price),color=clarity))

# 散点折线图
#钻石克重、价格与切割情况的散点折线图
ggplot(data)+
  geom_point(aes(x=carat,y=price,color=cut),alpha=0.5)+
  geom_smooth(aes(x=carat,y=price))
#钻石克重、价格与颜色的散点折线图
ggplot(data)+
  geom_point(aes(x=carat,y=price,color=color),alpha=0.5)+
  geom_smooth(aes(x=carat,y=price))
#钻石克重、价格与清晰度的散点折线图
ggplot(data)+
  geom_point(aes(x=carat,y=price,color=clarity),alpha=0.5)+
  geom_smooth(aes(x=carat,y=price))

# 折线图
#钻石清晰度、切割情况与价格的折线图
data %>% 
  group_by(clarity, cut) %>% 
  summarize(m = mean(price)) %>% 
  ggplot(aes(x = clarity, y = m, group = cut, color = cut)) +
  geom_point() +
  geom_line(linetype = 2)
#钻石清晰度、颜色与价格的折线图
data %>% 
  group_by(clarity, color) %>% 
  summarize(m = mean(price)) %>% 
  ggplot(aes(x = clarity, y = m, group = color, color = color)) +
  geom_point() +
  geom_line(linetype = 2)
#钻石切割情况、颜色与价格的折线图
data %>% 
  group_by(cut, color) %>% 
  summarize(m = mean(price)) %>% 
  ggplot(aes(x = cut, y = m, group = color, color = color)) +
  geom_point() +
  geom_line(linetype = 2)

# 核密度图（价格）
ggplot(data)+
  geom_histogram(aes(x=price,y=..density..),fill="#247BA0",binwidth=300)+
  geom_density(aes(x=price),size=1,alpha=.5,ajust=4,col='grey',fill='grey')

# 价格分布图
#不同切割情况的钻石价格分布图
ggplot(data)+
  geom_histogram(aes(x=price,fill=cut,color=cut))+
  facet_wrap(~cut)
#不同颜色的钻石价格分布图
ggplot(data)+
  geom_histogram(aes(x=price,fill=color,color=color))+
  facet_wrap(~color)
#不同清晰度的钻石价格分布图
ggplot(data)+
  geom_histogram(aes(x=price,fill=clarity,color=clarity))+
  facet_wrap(~clarity)

# 散点图
#钻石长度、宽度与价格的散点图
ggplot(data)+
  geom_point(aes(x=x,y=y,col=price))
#钻石长度、深度与价格的散点图
ggplot(data)+
  geom_point(aes(x=x,y=z,col=price))
#钻石宽度、深度与价格的散点图
ggplot(data)+
  geom_point(aes(x=y,y=z,col=price))

# 热图
df <- diamonds[c("carat","depth","table","price")]
heatmap(as.matrix(df),Rowv=NA,Colv=NA,col=heat.colors(256),scale="column",margins=c(2,8),main="")