# Importar y exportar datos -----------------------------------------------

library("ggplot2")

data(mtcars) # Incluido en el datasets
?mtcars

write.csv2(mtcars, file = "mtcars.csv")
mtcars1 <- read.csv2("mtcars.csv", header = TRUE)

# Funciones basicas -------------------------------------------------------

# Explorar el data.frame
head(mtcars)
tail(mtcars, 10)
summary(mtcars)

# Funciones basicas
max(mtcars$mpg)
min(mtcars$mpg)
range(mtcars$mpg)
mean(mtcars$mpg)
sd(mtcars$mpg)


# seleccionar filas/columnas

mtcars[1:5, ]
mtcars[1:5, 1:5]
mtcars[1:5, c("mpg", "cyl", "disp", "hp", "am", "gear", "carb")]

# NA
mtcars[1, "cyl"] <- NA
summary(mtcars)
max(mtcars$cyl)
mean(mtcars$cyl, na.rm = TRUE)

is.na(mtcars)

# rbind/cbind
mtcars15 <- mtcars[1:5, ]
mtcars69 <- mtcars[6:9, ]

rbind(mtcars15, mtcars69)
cbind(mtcars, mtcars)

# duplicated/unique/complete cases
mtcars_dup <- rbind(mtcars15, mtcars15)

duplicated(mtcars_dup)
unique(mtcars_dup)

mtcars15[complete.cases(mtcars15), ]

# Aggregates
tapply(mtcars$mpg, list(mtcars$cyl), FUN = "mean")
tapply(mtcars$mpg, list(mtcars$am), FUN = "mean")
tapply(mtcars$mpg, list(mtcars$am, mtcars$cyl), FUN = "mean")

# Graficos ----------------------------------------------------------------

plot(mtcars$mpg, mtcars$cyl)
plot(mtcars$mpg, mtcars$hp, col = "red", pch = 19)
plot(mtcars$mpg, mtcars$hp, col = mtcars$cyl, pch = 19)

pairs(mtcars)

# Regresion lineal --------------------------------------------------------

plot(mtcars$mpg, mtcars$hp)
mod1 <- lm(mpg ~ hp, data = mtcars)
summary(mod1)
residuals(mod1)
plot(residuals(mod1), type = "l")
plot(mod1)

