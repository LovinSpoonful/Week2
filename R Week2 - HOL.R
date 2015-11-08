
# ctrl-shift-enter runs all lines of code

# create a function that calculates the mean value of a collection of numbers

cNums <- c(1,2,3,4,5,NA,NA,NA,NA,NA,6,10,678,844,9999,7777)
cNums

fnCalcMean <- function(c) {
  c <- c[!is.na(c)] # remove null values
  iMean <- sum(c)/length(c)
}

fnCalcMedian <- function(c) {
  c <- c[!is.na(c)] # remove null values
  cSorted <- sort(c)  # Sort the list in ascending order
  i <- cSorted[round(length(cSorted)/2)] # take the value in the middle of the list
}

dblMean <- fnCalcMean(cNums)
dblMean

dblMedian <- fnCalcMedian(cNums)
dblMedian

