library(tidyverse)
# 向量
mystring <- "Hello World"
# print(mystring)
print(typeof(mystring))

# 向量组合、命名
a <- c(1, 2, 3)
names(a) <- c("aa", "ab", "ac")
print(a[2])
print(length(a))
print(typeof(c(1, TRUE, "a")))

# 列表
b <- list(
  a = c(5, 10),
  b = c("I", "love", "R", "language", "!"),
  c = c(TRUE, TRUE, FALSE, TRUE)
)
print(typeof(b))
print(list("a", 1))

s <- seq(from = 1, to = 10, by = 0.5)
s3 <- rep(x = c(0, 1), each = 3)
# 数据框
df <- data.frame(
  name      = c("Alice", "Bob", "Carl", "Dave"),
  age       = c(23, 34, 23, 25),
  marriage  = c(TRUE, FALSE, TRUE, FALSE),
  color     = c("red", "blue", "orange", "purple")
)
print(df["name"], df[[1]])

# 矩阵
m <- matrix(
  c(2, 4, 3, 1, 5, 7),
  nrow = 2, 
  ncol = 3,
  byrow = TRUE
)
print(m)

# 函数
sum <- function(x){
  x + 1
}
sum(a)