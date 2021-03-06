### Hand-in-Exercise 3 ###

### Configuration values:
ds <- read.table(file="StatWiSo2006.txt",header=TRUE,sep="\t")
removeNAs = TRUE

### Task 1
MWs = ds[11:20]
# We could remove all NAs:
if (removeNAs)
{
  MWs <- MWs[complete.cases(MWs),]
}
MWs$Ones = rowSums(MWs[1:10])
MWs$Changes = rowSums(MWs[1:9] != MWs[2:10])

### Task 2
par(mfrow=c(2,2))
Ones.practical = table(factor(MWs$Ones, levels=0:10))
Changes.practical = table(factor(MWs$Changes, levels=0:9))
barplot(Ones.practical, main="Number of heads", col="red")
barplot(Changes.practical, main="Number of changes", col="blue")

### Task 3
# It follows a binomial distribution, see for yourself:
n <- sum(Ones.practical) # = sum(Changes.practical)
Ones.theoretical = dbinom(0:10, 10, 0.5)
Changes.theoretical = dbinom(0:9, 9, 0.5)
barplot(rbind(Ones.practical/n, Ones.theoretical), beside=TRUE, col=c("red","gray"))
barplot(rbind(Changes.practical/n, Changes.theoretical), beside=TRUE, col=c("blue","gray"))

### Task 4
source("MultinomialCBs.R")
MultinomialCBs(Ones.practical, p0=Ones.theoretical, overall.alpha=0.05)
MultinomialCBs(Changes.practical, p0=Changes.theoretical, overall.alpha=0.05)

# 
# Analyze the data set "StatWiSo2006.txt",
# precisely, the variables MW1, MW2, ..., MW10.
# The data set results from questionnaires
# completed by 212 students in economics/social
# sciences in the academic year 2006/2007.
# Each student was asked to imagine tossing a
# coin and to write down a "random" sequence of
# 10 digits in {0,1}. These digits are the
# variables MW1, MW2, ..., MW10.
# 
# Task 1: Generate two new variables "Ones" and
#         "Changes", defined as follows:
#         Ones <- MW1 + MW2 + ... + MW10 ,
#         Changes <- (MW1 != MW2) + (MW2 != MW3) +
#                 ... + (MW9 != MW10) .
#         (Try to use apply() or rowSums().)
# 
# Task 2: Visualize the empirical distributions of
#         Ones and Changes as a factors with possible
#         values in {0, 1, 2, ..., 10} (Ones) and
#         {0, 1, 2, ..., 9} (Changes).
# 
# Task 3: What is the theoretical distribution of
#         Ones and Changes, if MW1, MW2, ..., MW10
#         would really represent random tosses of a
#         fair coin?
# 
# Task 4: Use your program "MultinomialCBs.R" to
#         analyze the empirical distributions of
#         Ones and Changes. Do your results prove
#         significant differences between empirical
#         and theoretical distributions?
# 
# These analyses, including all essential steps
# (loading the data, ...,  compiling the function
#  MultinomialCBs.R via "source", ...) should be
# summarized in an easy-to-read-and-execute
# script file "AnalyzeStatWiSo2006.R".
# 
# 
# Task 5 (voluntary):
# 
# Extend your function MultinomialCBs() such
# that it contains an optional vector p of
# theoretical probability weights. If p is
# specified, it should be easy to see which
# empirical probabilities T[j]/n are
# significantly different from p[j].
# 
# 
# Please submit or present your solutions (i.e. the
# script file AnalyzeStatWiSo2006.R) no later than
# Friday, 15:00.