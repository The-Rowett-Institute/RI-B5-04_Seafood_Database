**RI-B5-04. Mapping UK seafood supply chains**

<ins>**Introduction**</ins>

Transforming our diets to build a more sustainable food system is paramount to achieving net zero. Arguably, such diets will include more seafood. Here, we provide a high-resolution perspective on United Kingdom (UK) seafood supplies and nutrient flows at species level. We mapped seafood production (capture and aquaculture), trade (imports and exports), purchases (within and out-of-home), and seafood consumption, between 2009 and 2020, for up to 73 seafood species. This repository contains the code and methodology used to clean and merge the secondary data sets used to create the seafood database.

<ins>**Data sources**</ins>
1)	Capture production (Marine Management Organisation)
2)	Aquaculture production (Centre for Environment, Fisheries and Aquaculture Science)
3)	Trade (HM Revenue and Customs) 
4)	Purchases (Department for Environment, Food and Rural Affairs family food)
5)	Consumption (National Dietary and Nutrition Survey)
7)	Population (Office of National Statistics)
8)	Nutrition composition (Department of Health and Social Care and Norwegian data)

<ins>**Edible factions**</ins>

Conversion factors [(Hilborn et al 2018)](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1002/fee.1822) were applied to convert the live weight (whole fish) to edible proportions.

<ins>**Data dictionary**</ins>

*Raw data*

*Capture production* 
MMO_UKV_landingUKAbroad-200913.csv : A local copy of the capture production data (2009 and 2013)  
MMO_UKV_landingUKAbroad-201216.csv : A local copy of the capture production data (2012 and 2016)  
MMO_UKV_landingUKAbroad-201721.csv : A local copy of the capture production data (2017 and 2021)  

*Aquaculture production*
CEFAS_UK_aquaculture-200920.csv : A local copy of the aqauculture data set   

*Trade*
HMRC_trade-2009.csv : A local copy of the trade data (2009)  
HMRC_trade-201011.csv : A local copy of the trade data (2010 and 2011)  
HMRC_trade-201213.csv : A local copy of the trade data (2012 and 2013)  
HMRC_trade-201415.csv : A local copy of the trade data (2014 and 2015)  
HMRC_trade-201617.csv : A local copy of the trade data (2016 and 2017)  
HMRC_trade-201819.csv : A local copy of the trade data (2018 and 2019)  
HMRC_trade-2020.csv : A local copy of the trade data (2020)  

*Purchases*
DEFRA_UK_purchases-201620.csv : A local copy of UK seafood purchase, including within and out-of-home (2016 to 2020)  
DEFRA_UK_household-200915.csv : A local copy of UK seafood purchase data, purchased within home (2009 to 2015)  
DEFRA_UK_eatenOut-200915.csv : A local copy of UK seafood purchase data, purchased out-of-home (2009 to 2015)  

*Consumption*
ndns_rp_yr1-4a_foodleveldietarydata.sav : A local copy of dietary recall of participants (NDNS year 1 to 4)  
ndns_rp_yr5-6a_foodleveldietarydata.sav : A local copy of dietary recall of participants (NDNS year 5 and 6)  
ndns_rp_yr2-8a_foodleveldietarydata.sav : A local copy of dietary recall of participants (NDNS year 8)  
ndns_rp_yr9a_foodleveldietarydata.sav : A local copy of dietary recall of participants (NDNS year 9)  
ndns_rp_yr10a_foodleveldietarydata.sav : A local copy of dietary recall of participants (NDNS year 10)  
ndns_rp_yr11a_foodleveldietarydata.sav : A local copy of dietary recall of participants (NDNS year 11) 
ndns_rp_19_foodleveldietarydata.sav : A local copy of dietary recall of participants (NDNS follow-up)  

*Population*
ONS_UK_population-19712020.csv : A local copy of UK population data  

*Nutrition composition*
PHE_seafoodNutrientContent.csv : A local copy of UK seafood composition tables  
PHE_seafoodFAContent.csv : A local copy of UK seafood fatty acids composition tables  
Norwegian_seafoodNutrientContent.csv : A local copy of Norwegian seafood composition tables  
