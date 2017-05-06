

devtools::install()
colors      <- list(GREEN="Green",RED="Red")
dataset <- data.frame(x=c(6,5,2),
                      GREEN=c(0.1,0,0.2),
                      RED=c(0.9,1,0.8))

hist_data <- hist(rnorm(1000))
dataset <- data.frame(x=c(6,5,2),
                      GREEN=c(0.1,0,0.2),
                      RED=c(0.9,1,0.8))
rc3::C3BarChart(dataset, 0.5, colors = colors)


dataset <- data.frame(Time=c("2016-01-05","2016-01-12","2016-01-24"),
                      GREEN=c(0.1,0,0.2),
                      RED=c(0.9,1,0.8),
                      Total=c(320,210,190))
colors      <- list(Total="gray",GREEN="Green",RED="Red")
C3LineBarChart(dataset = dataset,colors=colors)

dataset <- data.frame(x = rnorm(100), y = rnorm(100))
colours <- list(y = "red")
C3Scatter(dataset, size = 10, colours)
