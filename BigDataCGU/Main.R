matrix(
  13:16, nrow = 2, byrow = TRUE,
  dimnames = list((c("x","y")),
                  c("p","r"))
)

review <- c("bad","good","good","bad")
factor (review,
        levels = c("bad","good"),
  ordered = TRUE)