# BigDataAnalyticalMethods

### 教師與課堂資訊
+ 曾意儒
+ github.com/CGUIM-BigDataAnalysis/BigDataCGUIM/blob/master/107/04_R_Prog_101.md
+ 期中考：2019/04/25
+ 助教：邱業詠
+ E-mail:lawrance39@gmail.com

### Big Data 4V
+ Volume 數據產生的量
+ Variety 數據的多樣性
+ Velocity 數據產生的速度
+ Veracity 數據的正確性

### Cloud Storage
+ AWS Amazon Web Service - Simple Storage Service(S3)
+ Azure
+ GCP Google Cloud Platform


## R Lang.
[pref_pdf_R_in_a_nutshell](http://rbasicsworkshop.weebly.com/uploads/1/8/6/0/18603232/adler_2009_r-inanutshell.pdf)

## R Markdown
[R Markdown Chunk Examples](https://medium.com/datainpoint/rmarkdown-%E5%B7%A7%E5%A6%99%E5%9C%B0%E5%9C%A8%E6%96%87%E4%BB%B6%E4%B8%AD%E5%B5%8C%E5%85%A5%E7%A8%8B%E5%BC%8F-b4144b08582d)

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
+ 因子向量 Factor
```R
gender <- factor(c("male", "female", "male"))
gender
[1] male    female male
Levels: female male
```

使用 `levels` 來列出因子變數中所有的類別
使用 `nlevels` 來計算因數變數類別的總數
使用 `as.integer` 查詢名稱背後對應的一些整數資料
使用 `table` 來計算 elements 的個數

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
> [1] 1
+ abs 絕對值
> abs(-34)
> [1] 34
+ exp 指數
> exp(1)
> [1] 2.718282
+ mid 中位數
> median(1:5)
> [1] 3

### 爬蟲
#### Extension (CSS Selector & XPath)
+ Google Extension: Seletorgadget
+ Firefox Extension: Scrapemate (Beta)
---
+ using library `httr` for handle https
+ using library `jsonlite` to import json file 
+ reading `xml` file by using library `xml2`
+ 
