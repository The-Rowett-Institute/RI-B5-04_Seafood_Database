

# Figure 1. Annual UK seafood supply (g/capita/week) between 2009 and 2018

# Plot annual seafood availability between 2009 and 2018
plot(available ~ Year, data = df_avgSeafood, 
                pch= 20, cex.axis = 1.0, cex.lab = 1.5, 
                ylab = "Seafood available (g/capita/week)", xlab = "Year", 
                ylim = c(0, 300))
lines(available ~ Year, data = df_avgSeafood, col = "black", lwd= 1)

# add in horizontal line marking dietary recommendation
abline(h = 280, col = "red", lty = "dashed") 
points(df_avgSeafood$available, pch= 20)




# Figure 2. Capture and aquaculture production (g/capita/week) between 2009 and 2018

# Plot production origins (capture and aquaculture data) and total on same graph
plot(Aquaprod ~ Year, data = df_avgSeafood, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "UK seafood production (g/capita/week)", 
     xlab = "Year", ylim = c(0, 85), pch= 20, col = "blue")
lines(Aquaprod ~ Year, data = df_avgSeafood, col = "blue", lwd= 1)
points(CaptureProd ~ Year, data = df_avgSeafood, pch= 20, col = "red")
lines(CaptureProd ~ Year, data = df_avgSeafood, col = "red", lwd= 1)
lines(totProd ~ Year, data = df_avgSeafood, col = "black", lwd= "dashed")




# Figure 3. Capture production SCAN type
plot(Summed_CProd ~ Year, data = SACN_captProd, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "UK seafood production (g/capita/week)", 
     xlab = "Year", ylim = c(0, 30), pch= 20, col = c("blue", "bluegreen", "red"))
axis(side = 2)
lines(Summed_CProd ~ Year, data = SACN_captProd, 
      col = c("blue", "darkgreen", "red"), lwd= 1)


# Figure 3. Aquaculture production SCAN type
plot(Summed_AProd ~ Year, data = SACN_aquaProd, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "UK seafood production (g/capita/week)", 
     xlab = "Year", ylim = c(0, 30), pch= 20, col = c("blue", "green", "red"))
axis(side = 2)
lines(Summed_CProd ~ Year, data = SACN_aquaProd, 
      col = c("blue", "darkgreen", "red"), lwd= 1)

df_summedSACNTypes

# Plot bar chart displaying imports (red bar), exports (grey bar), production (orange dot) and dietary recommendation (blue dot)

# Ensure data needed for the figure is all in one data frame

# Plot mackerel production data 
colnames(df_captProd_NS_data)
colnames(df_trade_HMRC_data)


unique(df_captProd_NS_data$RevisedMCS)
df_captProd_NS_data <- subset(df_captProd_NS_data, Year < 2020)
unique(df_captProd_NS_data$Year)

# Subset
seafoodImports <- subset(df_trade_HMRC_data, Commodity == "Imports")
seafoodExports <- subset(df_trade_HMRC_data, Commodity == "Exports")

# Subset mackerel production
mac_capture <- subset(df_captProd_NS_data, RevisedMCS == "Mackerel")
mac_capture$ValueKg <- mac_capture$ValueGrams / 1000

plot(ValueKg ~ Year, data = mac_capture, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "Mackerel production (Kg)", 
     xlab = "Year", pch= 20)
axis(side = 2)

# Subset mackerel imports
mac_imports <- subset(seafoodImports, Species == "Mackerel")
mac_imports$ValueKg <- mac_imports$Value / 1000


plot(ValueKg ~ Year, data = mac_imports, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "Mackerel imports (Kg)", 
     xlab = "Year", pch= 20)

# Subset mackerel imports
mac_exports <- subset(seafoodExports, Species == "Mackerel")
mac_exports$ValueKg <- mac_exports$Value / 1000


plot(ValueKg ~ Year, data = mac_exports, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "Mackerel exports (Kg)", 
     xlab = "Year", pch= 20)


# Combine production and trade data
mac_supplies <- cbind(mac_capture, mac_imports[12], mac_exports[12])
str(mac_supplies)

colnames(mac_supplies) <- c("...1", "RevisedMCS", "Year", "ValueGrams",
"EUMOFA_ST", "FAO_ST","ISSCAAP_ST" , "Golden_2021_ST", "Bianchi_2022_ST", 
"WWF_2022_ST", "SACN", "DataSet", "DataSupplier", "Commodity", 
"Flag", "captureValueKg", "importsValueKg", "exportsValueKg")

mac_supplies$supplied <- (mac_supplies$captureValueKg +
                            mac_supplies$importsValueKg) - mac_supplies$exportsValueKg

plot(supplied ~ Year, data = mac_supplies, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "Mackerel supplied (Kg)", 
     xlab = "Year", pch= 20)

# Subset herring 
herring_capture <- subset(df_captProd_NS_data, RevisedMCS == "Herring")
herring_capture$ValueKg <- herring_capture$ValueGrams / 1000

plot(ValueKg ~ Year, data = herring_capture, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "Mackerel production (Kg)", 
     xlab = "Year", pch= 20)
axis(side = 2)

# 

imports <- aggregate(list(Imports = seafoodImports$ValueGramsCapitaWeek), 
                     list(Year = seafoodImports$Year), sum)
imports <- subset(imports, Year < 2019) # up to 2018
