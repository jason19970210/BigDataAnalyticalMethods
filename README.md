# BigDataAnalyticalMethods

### 教師與課堂資訊
+ 曾意儒


## R Lang.

### Comment
Using `#`

### Variables
+ foo <- 23;
+ foo = 23;
> foo  
> [1] 23

- Find Variables
> apropos("_string_")

+ Numbers
    + numeric 浮點數
    ```R
    class(3) # use `class` check type
    [1] "numeric"
    class(sqrt(5:10))
    [2] "numeric"
    class(1.3:5.3)
    [3] "numeric"
    ```
    + integer 整數
    ```R
    class(3L) # use `L` to declare integer
    [1] "integer"
    class(5:10)
    [2] "integer"
    class(sum(5:10))
    [3] "integer"
    ```
    + complex 複數
    ```R
    class(2 + 3i)
    [1] "complex"
    ```
+ 字元向量
```R
c("Hello", "World")
class(c("Hello", "World"))
[1] "character"
```
+ 因子向量
```R
gender <- factor(c("male", "female", "male"))
gender
[1] male    female male
Levels: female male
```
使用 `levels` 來列出因子變數中所有的類別
使用 `nlevels` 來計算因數變數類別的總數
使用 `as.integer` 查詢名稱背後對應的一些整數資料
```R
levels(gender)
[1] "female" "male"
nlevels(gender)
[2] 2
as.integer(gender)
[3] 2 1 2
```

### Function
+ sum
> sum(1:10) // ：產生連續數列的運算子
> [1] 55
+ sin
> sin(pi/2)
> [1] 1
+ abs 絕對值
> abs(-34)
> [1] 34
+ exp 指數
> exp(1)
> [1] 2.718282
+ mid 中位數
> median(1:5)
> [1] 3
