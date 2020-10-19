# **Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1:**

Create an R script that will count how many of these numbers fall between -1 and 1 and divide by the total quantity of N

You know that: **E(X) = 68.2%**

Check that Mean(Xn)->E(X) as you rerun your script while increasing N

# **Hints:**
1. Initialize sample size
2. Initialize counter
3. Loop for(i in rnorm(size))
4. Check if the iterated variable falls
5. Increase counter if the condition is true
6. return a result <- counter / N

# **Step by step script**

## 1.  Initialize sample size

```{r}
x <- rnorm(10)
y <- dnorm(x, mean = 0, sd = 1)
plot(x,y)
```

## 2. Initialize counter

```{r}
count <- 0
res <- 0
```

## 3.  Loop for(i in rnorm(size))

```{r}
for(i in rnorm(10))
{
  count <- count + 1
  print(count)
```

## 4. Check if the iterated variable falls between -1 and 1

```{r}
if(i <= 1 && i >= -1){
  print(i)
  print("It's between -1 y 1")
```

## 5. Increase counter if the condition results true

```{r}
  res <- res + 1
  }
  else
  {
    print(i)
    print("Out of range")
  }
}
```

## 6. Return a result <- counter / N

```{r}
  Res <- res / count
  print(Res)
```

# **Full Script (the one running on R Studio)**

```{r}
x <- rnorm(10)
y <- dnorm(x, mean = 0, sd = 1)
plot(x,y)

count <- 0
res <- 0

for(i in rnorm(10))
{
  count <- count + 1
  print(count)
  if(i <= 1 && i >= -1){
    print(i)
    print("It's between -1 y 1")
    res <- res + 1
  }
  else
  {
    print(i)
    print("Out of range")
  }
}

Res <- res / count
print(Res)
```