

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




