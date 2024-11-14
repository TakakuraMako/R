a <- function(x, y)
{
  z <- list()
  for(i in x)
  {
    if(i > y){z[[length(z) + 1]] <- 1}
    else{z[[length(z) + 1]] <- -1}
  }
  return(z)
}
x <- 1:10
y <- 5

l <- list(
  "one"   = c("a", "b", "c"),
  "two"   = c(1:5),
  "three" = c(TRUE, FALSE)
)
print(typeof(l[[1]]))
print(typeof(l[1]))

b <- matrix(1:9, nrow = 3)
print(b[1:2, 2:3])