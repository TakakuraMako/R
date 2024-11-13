library(tidyverse)
# 赋值
mystring <- "Hello World"
# print(mystring)

# 向量组合、命名
a <- c(1, 2, 3)
names(a) <- c("aa", "ab", "ac")
print(a)

# 列表
b <- list(
  a = c(5, 10),
  b = c("I", "love", "R", "language", "!"),
  c = c(TRUE, TRUE, FALSE, TRUE)
)

print(b[[1]])

# 数据框
df <- data.frame(
  name      = c("Alice", "Bob", "Carl", "Dave"),
  age       = c(23, 34, 23, 25),
  marriage  = c(TRUE, FALSE, TRUE, FALSE),
  color     = c("red", "blue", "orange", "purple")
)
print(df["name"], df[[1]])
# 函数
sum <- function(x){
  x + 1
}
sum(a)

# 矩阵
m <- matrix(
  c(2, 4, 3, 1, 5, 7),
  nrow = 2, 
  ncol = 3,
  byrow = TRUE
)
print(m)
