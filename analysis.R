PATH <- "C:/Bitnami/wampstack-7.0.16-1/apache2/htdocs/AnaliseHolodeck"
setwd(PATH)

library("useful")

data <- read.csv("HoloDeck.csv")


data <- shift.column(data = data, "lucro", newNames = "lucro_1", len = 1L, up = TRUE)

data_sub <- data[data$io == "DEAL_ENTRY_IN",]

data_sub$lucro_bin <- ifelse(data_sub$lucro_1 > 0,1,0)
data_sub$lucro_bin <- factor(data_sub$lucro_bin)


data_sub$io <- NULL
data_sub$ativo <- NULL
data_sub$posicao <- NULL
data_sub$lucro <- NULL

str(data_sub)

boxplot(data_sub$BB_Delta_Bruto_norm~data_sub$lucro_bin)
