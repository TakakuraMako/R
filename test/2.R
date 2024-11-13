df <- data.frame(
  x = c(1, 2, 3),
  a = c("a", "b", "c")
)
print(df)

list1 <- list(
  name = c("a", "b"),
  age = c(18, 20)
)
print(list1)

m <- matrix(
  c(1, 2, 3, 4, 5, 6),
  nrow = 3,
  ncol = 2,
  byrow = FALSE
)
m2 <- matrix(1:9, nrow = 3)

for(i in df){
  print(i)
  for(j in i){
    print(j)
  }
}
# z-score标准化
z_score <- function(data){
  (data - mean(data)) / sd(data)
}
print(z_score(v))

# 创建一个学生信息的data.frame，包含姓名、性别、年龄，成绩等变量
student <- data.frame(
  Name = c("Alice", "Bob"),
  Gender = c("Fmale", "Male"),
  Age = c(18, 19),
  score = c(60, 100)
)

v_a = 1:4
v_b = 10:13
# 求余
print(v_a %% v_b)
# 求商
print(v_a %/% v_b)
# 内积
print(v_a %*% v_b)
print(m2 %*% m2)
# 指数
print(v_a ^ v_b)
# 长度不同循环补齐,输出的结果以长的为准
v_c = 1:2
print(v_c + v_a)

# 关系运算
print(v_a > v_b)
# 逻辑运算
bool_a = c(1, 1, 0)
bool_b = c(1, 0, 1)
print(bool_a & bool_b)

#包含, is.na()判断是否为空
print(c(1, 2) %in% c(1, 3))

#NULL 空 NaN 没有数学定义

a <- 1:10
b <- seq(from = 1, to = 10, by = 1)
print(typeof(a))
print(typeof(b))