

# Figure 1. Annual UK seafood supply (g/capita/week) between 2009 and 2018----

# Plot annual seafood availability between 2009 and 2018
plot(available ~ Year, data = df_avgSeafood, 
                pch= 20, cex.axis = 1.0, cex.lab = 1.5, 
                ylab = "Seafood available (g/capita/week)", xlab = "Year", 
                ylim = c(0, 300))
lines(available ~ Year, data = df_avgSeafood, col = "black", lwd= 1)

# add in horizontal line marking dietary recommendation
abline(h = 280, col = "red", lty = "dashed") 
points(df_avgSeafood$available, pch= 20)




# Figure 2. Capture and aquaculture production (g/capita/week) between 2009 and 2018----

# Plot production origins (capture and aquaculture data) and total on same graph
plot(Aquaprod ~ Year, data = df_avgSeafood, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "UK seafood production (g/capita/week)", 
     xlab = "Year", ylim = c(0, 85), pch= 20, col = "blue")
lines(Aquaprod ~ Year, data = df_avgSeafood, col = "blue", lwd= 1)
points(CaptureProd ~ Year, data = df_avgSeafood, pch= 20, col = "red")
lines(CaptureProd ~ Year, data = df_avgSeafood, col = "red", lwd= 1)
lines(totProd ~ Year, data = df_avgSeafood, col = "black", lwd= "dashed")


# Figure 3. Capture production SCAN type----
plot(Summed_CProd ~ Year, data = SACN_captProd, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "UK seafood production (g/capita/week)", 
     xlab = "Year", ylim = c(0, 30), pch= 20, col = c("blue", "bluegreen", "red"))
axis(side = 2)
lines(Summed_CProd ~ Year, data = SACN_captProd, 
      col = c("blue", "darkgreen", "red"), lwd= 1)


# Figure 4. Aquaculture production SCAN type----
plot(Summed_AProd ~ Year, data = SACN_aquaProd, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "UK seafood production (g/capita/week)", 
     xlab = "Year", ylim = c(0, 30), pch= 20, col = c("blue", "green", "red"))
axis(side = 2)
lines(Summed_CProd ~ Year, data = SACN_aquaProd, 
      col = c("blue", "darkgreen", "red"), lwd= 1)




# Figure 5. UK seafood supplies----

#Plot bar chart displaying imports (red bar), exports (grey bar), production (orange dot) and dietary recommendation (blue dot)

# Ensure data needed for the figure is all in one data frame


# Figure 6. UK mackerel supplies----

# Check reporting years are all the same (2009 to 2018)
df_captProd_NS_data_200918 <- subset(df_captureProd_NS_clean_data, Year < 2019)
df_aquaProd_eurostat_data_200918 <- subset(df_aquaProd_Eurostat_clean_data, Year < 2019)
df_trade_HMRC_data_200918 <- subset(df_trade_HMRC_clean_data, Year < 2019)

# Subset mackerel capture production
mac_capture <- subset(df_captProd_NS_data_200918, RevisedMCS == "Mackerel")

# Convert to kg
mac_capture$ValueKg <- mac_capture$Value / 1000

# Plot UK mackerel production between 2009 and 2018
plot(ValueKg ~ Year, data = mac_capture, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "Mackerel production (kg)", 
     xlab = "Year", pch= 20)
axis(side = 2)

unique(df_aquaProd_eurostat_data_200918$RevisedMCS) # do not farm mackerel


# Subset imports and exports
seafoodImports <- subset(df_trade_HMRC_data_200918, Commodity == "Imports")
seafoodExports <- subset(df_trade_HMRC_data_200918, Commodity == "Exports")

# Subset mackerel imports
mac_imports <- subset(seafoodImports, RevisedMCS == "Mackerel")

# Convert to kg
mac_imports$ValueKg <- mac_imports$Value / 1000

# Plot UK mackerel imports between 2009 and 2018
plot(ValueKg ~ Year, data = mac_imports, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "Mackerel imports (kg)", 
     xlab = "Year", pch= 20)


# Subset mackerel exports
mac_exports <- subset(seafoodExports, RevisedMCS == "Mackerel")

# Convert to kg
mac_exports$ValueKg <- mac_exports$Value / 1000

# Plot UK mackerel exports between 2009 and 2018
plot(ValueKg ~ Year, data = mac_exports, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "Mackerel exports (kg)", 
     xlab = "Year", pch= 20)


# Combine production and trade data
mac_supplies <- (mac_capture$ValueKg + mac_imports$ValueKg) - mac_exports$ValueKg


# Figure 7. UK herring supplies----

# Subset herring capture production
herring_capture <- subset(df_captProd_NS_data_200918, RevisedMCS == "Herring")

# Convert to kg
herring_capture$ValueKg <- herring_capture$Value / 1000

# Plot UK herring production between 2009 and 2018
plot(ValueKg ~ Year, data = herring_capture, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "Herring capture production (kg)", 
     xlab = "Year", pch= 20)


# Subset herring imports
herring_imports <- subset(seafoodImports, RevisedMCS == "Mackerel")

# Convert to kg
herring_imports$ValueKg <- herring_imports$Value / 1000

# Plot UK herring imports between 2009 and 2018
plot(ValueKg ~ Year, data = herring_imports, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "Herring imports (kg)", 
     xlab = "Year", pch= 20)


# Subset herring exports
herring_exports <- subset(seafoodExports, RevisedMCS == "Herring")

# Convert to kg
herring_exports$ValueKg <- herring_exports$Value / 1000

# Plot UK herring exports between 2009 and 2018
plot(ValueKg ~ Year, data = herring_exports, cex.axis = 1.0, 
     cex.lab = 1.0, ylab = "Herring exports (kg)", 
     xlab = "Year", pch= 20)


# Combine production and trade data
herring_supplies <- (herring_capture$ValueKg + herring_imports$ValueKg) - 
  herring_exports$ValueKg




# END----

#################################################################
imports <- aggregate(list(Imports = seafoodImports$ValueGramsCapitaWeek), 
                     list(Year = seafoodImports$Year), sum)
imports <- subset(imports, Year < 2019) # up to 2018
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
