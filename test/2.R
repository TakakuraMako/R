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

# z-score标准化
v <- c(1, 2, 3, 4, 4)
std = sd(v)
mean1 = mean(v)
z = (v - mean1)/std
print(z)