---
output:
  html_document:
    keep_md: yes
    output: html_document
  pdf_document: default
---

## Project Brief Report

Michael Bankole  
August 03, 2018

### House Prices: Advanced Regression Techniques
This project built an algorithm that determines the value and worth of a house. It uses a machine learning model to predict the prices of homes.

### Loading the data
I loaded both the training and the test dataset into R setting string as factor to be false in order to clean and wrangle it, while I combined them for fast processing. Below is a view of the raw data.
<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:300px; overflow-x: scroll; width:900px; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Head of the dataset</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> Id </th>
   <th style="text-align:right;"> MSSubClass </th>
   <th style="text-align:left;"> MSZoning </th>
   <th style="text-align:right;"> LotFrontage </th>
   <th style="text-align:right;"> LotArea </th>
   <th style="text-align:left;"> Street </th>
   <th style="text-align:left;"> Alley </th>
   <th style="text-align:left;"> LotShape </th>
   <th style="text-align:left;"> LandContour </th>
   <th style="text-align:left;"> Utilities </th>
   <th style="text-align:left;"> LotConfig </th>
   <th style="text-align:left;"> LandSlope </th>
   <th style="text-align:left;"> Neighborhood </th>
   <th style="text-align:left;"> Condition1 </th>
   <th style="text-align:left;"> Condition2 </th>
   <th style="text-align:left;"> BldgType </th>
   <th style="text-align:left;"> HouseStyle </th>
   <th style="text-align:right;"> OverallQual </th>
   <th style="text-align:right;"> OverallCond </th>
   <th style="text-align:right;"> YearBuilt </th>
   <th style="text-align:right;"> YearRemodAdd </th>
   <th style="text-align:left;"> RoofStyle </th>
   <th style="text-align:left;"> RoofMatl </th>
   <th style="text-align:left;"> Exterior1st </th>
   <th style="text-align:left;"> Exterior2nd </th>
   <th style="text-align:left;"> MasVnrType </th>
   <th style="text-align:right;"> MasVnrArea </th>
   <th style="text-align:left;"> ExterQual </th>
   <th style="text-align:left;"> ExterCond </th>
   <th style="text-align:left;"> Foundation </th>
   <th style="text-align:left;"> BsmtQual </th>
   <th style="text-align:left;"> BsmtCond </th>
   <th style="text-align:left;"> BsmtExposure </th>
   <th style="text-align:left;"> BsmtFinType1 </th>
   <th style="text-align:right;"> BsmtFinSF1 </th>
   <th style="text-align:left;"> BsmtFinType2 </th>
   <th style="text-align:right;"> BsmtFinSF2 </th>
   <th style="text-align:right;"> BsmtUnfSF </th>
   <th style="text-align:right;"> TotalBsmtSF </th>
   <th style="text-align:left;"> Heating </th>
   <th style="text-align:left;"> HeatingQC </th>
   <th style="text-align:left;"> CentralAir </th>
   <th style="text-align:left;"> Electrical </th>
   <th style="text-align:right;"> X1stFlrSF </th>
   <th style="text-align:right;"> X2ndFlrSF </th>
   <th style="text-align:right;"> LowQualFinSF </th>
   <th style="text-align:right;"> GrLivArea </th>
   <th style="text-align:right;"> BsmtFullBath </th>
   <th style="text-align:right;"> BsmtHalfBath </th>
   <th style="text-align:right;"> FullBath </th>
   <th style="text-align:right;"> HalfBath </th>
   <th style="text-align:right;"> BedroomAbvGr </th>
   <th style="text-align:right;"> KitchenAbvGr </th>
   <th style="text-align:left;"> KitchenQual </th>
   <th style="text-align:right;"> TotRmsAbvGrd </th>
   <th style="text-align:left;"> Functional </th>
   <th style="text-align:right;"> Fireplaces </th>
   <th style="text-align:left;"> FireplaceQu </th>
   <th style="text-align:left;"> GarageType </th>
   <th style="text-align:right;"> GarageYrBlt </th>
   <th style="text-align:left;"> GarageFinish </th>
   <th style="text-align:right;"> GarageCars </th>
   <th style="text-align:right;"> GarageArea </th>
   <th style="text-align:left;"> GarageQual </th>
   <th style="text-align:left;"> GarageCond </th>
   <th style="text-align:left;"> PavedDrive </th>
   <th style="text-align:right;"> WoodDeckSF </th>
   <th style="text-align:right;"> OpenPorchSF </th>
   <th style="text-align:right;"> EnclosedPorch </th>
   <th style="text-align:right;"> X3SsnPorch </th>
   <th style="text-align:right;"> ScreenPorch </th>
   <th style="text-align:right;"> PoolArea </th>
   <th style="text-align:left;"> PoolQC </th>
   <th style="text-align:left;"> Fence </th>
   <th style="text-align:left;"> MiscFeature </th>
   <th style="text-align:right;"> MiscVal </th>
   <th style="text-align:right;"> MoSold </th>
   <th style="text-align:right;"> YrSold </th>
   <th style="text-align:left;"> SaleType </th>
   <th style="text-align:left;"> SaleCondition </th>
   <th style="text-align:right;"> SalePrice </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:left;"> RL </td>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:right;"> 8450 </td>
   <td style="text-align:left;"> Pave </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Reg </td>
   <td style="text-align:left;"> Lvl </td>
   <td style="text-align:left;"> AllPub </td>
   <td style="text-align:left;"> Inside </td>
   <td style="text-align:left;"> Gtl </td>
   <td style="text-align:left;"> CollgCr </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> 1Fam </td>
   <td style="text-align:left;"> 2Story </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:left;"> Gable </td>
   <td style="text-align:left;"> CompShg </td>
   <td style="text-align:left;"> VinylSd </td>
   <td style="text-align:left;"> VinylSd </td>
   <td style="text-align:left;"> BrkFace </td>
   <td style="text-align:right;"> 196 </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> PConc </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> No </td>
   <td style="text-align:left;"> GLQ </td>
   <td style="text-align:right;"> 706 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:right;"> 856 </td>
   <td style="text-align:left;"> GasA </td>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:left;"> SBrkr </td>
   <td style="text-align:right;"> 856 </td>
   <td style="text-align:right;"> 854 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1710 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> Typ </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Attchd </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:left;"> RFn </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 548 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 61 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:left;"> WD </td>
   <td style="text-align:left;"> Normal </td>
   <td style="text-align:right;"> 208500 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:left;"> RL </td>
   <td style="text-align:right;"> 80 </td>
   <td style="text-align:right;"> 9600 </td>
   <td style="text-align:left;"> Pave </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Reg </td>
   <td style="text-align:left;"> Lvl </td>
   <td style="text-align:left;"> AllPub </td>
   <td style="text-align:left;"> FR2 </td>
   <td style="text-align:left;"> Gtl </td>
   <td style="text-align:left;"> Veenker </td>
   <td style="text-align:left;"> Feedr </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> 1Fam </td>
   <td style="text-align:left;"> 1Story </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 1976 </td>
   <td style="text-align:right;"> 1976 </td>
   <td style="text-align:left;"> Gable </td>
   <td style="text-align:left;"> CompShg </td>
   <td style="text-align:left;"> MetalSd </td>
   <td style="text-align:left;"> MetalSd </td>
   <td style="text-align:left;"> None </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> CBlock </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> ALQ </td>
   <td style="text-align:right;"> 978 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 284 </td>
   <td style="text-align:right;"> 1262 </td>
   <td style="text-align:left;"> GasA </td>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:left;"> SBrkr </td>
   <td style="text-align:right;"> 1262 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1262 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> Typ </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Attchd </td>
   <td style="text-align:right;"> 1976 </td>
   <td style="text-align:left;"> RFn </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 460 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:right;"> 298 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:left;"> WD </td>
   <td style="text-align:left;"> Normal </td>
   <td style="text-align:right;"> 181500 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:left;"> RL </td>
   <td style="text-align:right;"> 68 </td>
   <td style="text-align:right;"> 11250 </td>
   <td style="text-align:left;"> Pave </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> IR1 </td>
   <td style="text-align:left;"> Lvl </td>
   <td style="text-align:left;"> AllPub </td>
   <td style="text-align:left;"> Inside </td>
   <td style="text-align:left;"> Gtl </td>
   <td style="text-align:left;"> CollgCr </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> 1Fam </td>
   <td style="text-align:left;"> 2Story </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 2002 </td>
   <td style="text-align:left;"> Gable </td>
   <td style="text-align:left;"> CompShg </td>
   <td style="text-align:left;"> VinylSd </td>
   <td style="text-align:left;"> VinylSd </td>
   <td style="text-align:left;"> BrkFace </td>
   <td style="text-align:right;"> 162 </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> PConc </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Mn </td>
   <td style="text-align:left;"> GLQ </td>
   <td style="text-align:right;"> 486 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 434 </td>
   <td style="text-align:right;"> 920 </td>
   <td style="text-align:left;"> GasA </td>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:left;"> SBrkr </td>
   <td style="text-align:right;"> 920 </td>
   <td style="text-align:right;"> 866 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1786 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> Typ </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Attchd </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:left;"> RFn </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 608 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 42 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:left;"> WD </td>
   <td style="text-align:left;"> Normal </td>
   <td style="text-align:right;"> 223500 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 70 </td>
   <td style="text-align:left;"> RL </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:right;"> 9550 </td>
   <td style="text-align:left;"> Pave </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> IR1 </td>
   <td style="text-align:left;"> Lvl </td>
   <td style="text-align:left;"> AllPub </td>
   <td style="text-align:left;"> Corner </td>
   <td style="text-align:left;"> Gtl </td>
   <td style="text-align:left;"> Crawfor </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> 1Fam </td>
   <td style="text-align:left;"> 2Story </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1915 </td>
   <td style="text-align:right;"> 1970 </td>
   <td style="text-align:left;"> Gable </td>
   <td style="text-align:left;"> CompShg </td>
   <td style="text-align:left;"> Wd Sdng </td>
   <td style="text-align:left;"> Wd Shng </td>
   <td style="text-align:left;"> None </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> BrkTil </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> No </td>
   <td style="text-align:left;"> ALQ </td>
   <td style="text-align:right;"> 216 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 540 </td>
   <td style="text-align:right;"> 756 </td>
   <td style="text-align:left;"> GasA </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:left;"> SBrkr </td>
   <td style="text-align:right;"> 961 </td>
   <td style="text-align:right;"> 756 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1717 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> Typ </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> Detchd </td>
   <td style="text-align:right;"> 1998 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 642 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 35 </td>
   <td style="text-align:right;"> 272 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:left;"> WD </td>
   <td style="text-align:left;"> Abnorml </td>
   <td style="text-align:right;"> 140000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:left;"> RL </td>
   <td style="text-align:right;"> 84 </td>
   <td style="text-align:right;"> 14260 </td>
   <td style="text-align:left;"> Pave </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> IR1 </td>
   <td style="text-align:left;"> Lvl </td>
   <td style="text-align:left;"> AllPub </td>
   <td style="text-align:left;"> FR2 </td>
   <td style="text-align:left;"> Gtl </td>
   <td style="text-align:left;"> NoRidge </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> 1Fam </td>
   <td style="text-align:left;"> 2Story </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> Gable </td>
   <td style="text-align:left;"> CompShg </td>
   <td style="text-align:left;"> VinylSd </td>
   <td style="text-align:left;"> VinylSd </td>
   <td style="text-align:left;"> BrkFace </td>
   <td style="text-align:right;"> 350 </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> PConc </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Av </td>
   <td style="text-align:left;"> GLQ </td>
   <td style="text-align:right;"> 655 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 490 </td>
   <td style="text-align:right;"> 1145 </td>
   <td style="text-align:left;"> GasA </td>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:left;"> SBrkr </td>
   <td style="text-align:right;"> 1145 </td>
   <td style="text-align:right;"> 1053 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2198 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> Typ </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Attchd </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> RFn </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 836 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:right;"> 192 </td>
   <td style="text-align:right;"> 84 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:left;"> WD </td>
   <td style="text-align:left;"> Normal </td>
   <td style="text-align:right;"> 250000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:left;"> RL </td>
   <td style="text-align:right;"> 85 </td>
   <td style="text-align:right;"> 14115 </td>
   <td style="text-align:left;"> Pave </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> IR1 </td>
   <td style="text-align:left;"> Lvl </td>
   <td style="text-align:left;"> AllPub </td>
   <td style="text-align:left;"> Inside </td>
   <td style="text-align:left;"> Gtl </td>
   <td style="text-align:left;"> Mitchel </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> 1Fam </td>
   <td style="text-align:left;"> 1.5Fin </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:left;"> Gable </td>
   <td style="text-align:left;"> CompShg </td>
   <td style="text-align:left;"> VinylSd </td>
   <td style="text-align:left;"> VinylSd </td>
   <td style="text-align:left;"> None </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Wood </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> No </td>
   <td style="text-align:left;"> GLQ </td>
   <td style="text-align:right;"> 732 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:right;"> 796 </td>
   <td style="text-align:left;"> GasA </td>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:left;"> SBrkr </td>
   <td style="text-align:right;"> 796 </td>
   <td style="text-align:right;"> 566 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1362 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> Typ </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Attchd </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 480 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:right;"> 40 </td>
   <td style="text-align:right;"> 30 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 320 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> MnPrv </td>
   <td style="text-align:left;"> Shed </td>
   <td style="text-align:right;"> 700 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 2009 </td>
   <td style="text-align:left;"> WD </td>
   <td style="text-align:left;"> Normal </td>
   <td style="text-align:right;"> 143000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2914 </td>
   <td style="text-align:right;"> 2914 </td>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:left;"> RM </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 1526 </td>
   <td style="text-align:left;"> Pave </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Reg </td>
   <td style="text-align:left;"> Lvl </td>
   <td style="text-align:left;"> AllPub </td>
   <td style="text-align:left;"> Inside </td>
   <td style="text-align:left;"> Gtl </td>
   <td style="text-align:left;"> MeadowV </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> Twnhs </td>
   <td style="text-align:left;"> 2Story </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1970 </td>
   <td style="text-align:right;"> 1970 </td>
   <td style="text-align:left;"> Gable </td>
   <td style="text-align:left;"> CompShg </td>
   <td style="text-align:left;"> CemntBd </td>
   <td style="text-align:left;"> CmentBd </td>
   <td style="text-align:left;"> None </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> CBlock </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> No </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 546 </td>
   <td style="text-align:right;"> 546 </td>
   <td style="text-align:left;"> GasA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:left;"> SBrkr </td>
   <td style="text-align:right;"> 546 </td>
   <td style="text-align:right;"> 546 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1092 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> Typ </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 34 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> GdPrv </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:left;"> WD </td>
   <td style="text-align:left;"> Normal </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2915 </td>
   <td style="text-align:right;"> 2915 </td>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:left;"> RM </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 1936 </td>
   <td style="text-align:left;"> Pave </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Reg </td>
   <td style="text-align:left;"> Lvl </td>
   <td style="text-align:left;"> AllPub </td>
   <td style="text-align:left;"> Inside </td>
   <td style="text-align:left;"> Gtl </td>
   <td style="text-align:left;"> MeadowV </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> Twnhs </td>
   <td style="text-align:left;"> 2Story </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 1970 </td>
   <td style="text-align:right;"> 1970 </td>
   <td style="text-align:left;"> Gable </td>
   <td style="text-align:left;"> CompShg </td>
   <td style="text-align:left;"> CemntBd </td>
   <td style="text-align:left;"> CmentBd </td>
   <td style="text-align:left;"> None </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> CBlock </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> No </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 546 </td>
   <td style="text-align:right;"> 546 </td>
   <td style="text-align:left;"> GasA </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:left;"> SBrkr </td>
   <td style="text-align:right;"> 546 </td>
   <td style="text-align:right;"> 546 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1092 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> Typ </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:left;"> WD </td>
   <td style="text-align:left;"> Normal </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2916 </td>
   <td style="text-align:right;"> 2916 </td>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:left;"> RM </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 1894 </td>
   <td style="text-align:left;"> Pave </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Reg </td>
   <td style="text-align:left;"> Lvl </td>
   <td style="text-align:left;"> AllPub </td>
   <td style="text-align:left;"> Inside </td>
   <td style="text-align:left;"> Gtl </td>
   <td style="text-align:left;"> MeadowV </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> TwnhsE </td>
   <td style="text-align:left;"> 2Story </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1970 </td>
   <td style="text-align:right;"> 1970 </td>
   <td style="text-align:left;"> Gable </td>
   <td style="text-align:left;"> CompShg </td>
   <td style="text-align:left;"> CemntBd </td>
   <td style="text-align:left;"> CmentBd </td>
   <td style="text-align:left;"> None </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> CBlock </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> No </td>
   <td style="text-align:left;"> Rec </td>
   <td style="text-align:right;"> 252 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 294 </td>
   <td style="text-align:right;"> 546 </td>
   <td style="text-align:left;"> GasA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:left;"> SBrkr </td>
   <td style="text-align:right;"> 546 </td>
   <td style="text-align:right;"> 546 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1092 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> Typ </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> CarPort </td>
   <td style="text-align:right;"> 1970 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 286 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 24 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:left;"> WD </td>
   <td style="text-align:left;"> Abnorml </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2917 </td>
   <td style="text-align:right;"> 2917 </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:left;"> RL </td>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 20000 </td>
   <td style="text-align:left;"> Pave </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Reg </td>
   <td style="text-align:left;"> Lvl </td>
   <td style="text-align:left;"> AllPub </td>
   <td style="text-align:left;"> Inside </td>
   <td style="text-align:left;"> Gtl </td>
   <td style="text-align:left;"> Mitchel </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> 1Fam </td>
   <td style="text-align:left;"> 1Story </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 1960 </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:left;"> Gable </td>
   <td style="text-align:left;"> CompShg </td>
   <td style="text-align:left;"> VinylSd </td>
   <td style="text-align:left;"> VinylSd </td>
   <td style="text-align:left;"> None </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> CBlock </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> No </td>
   <td style="text-align:left;"> ALQ </td>
   <td style="text-align:right;"> 1224 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1224 </td>
   <td style="text-align:left;"> GasA </td>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:left;"> SBrkr </td>
   <td style="text-align:right;"> 1224 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1224 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> Typ </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Detchd </td>
   <td style="text-align:right;"> 1960 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 576 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:right;"> 474 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:left;"> WD </td>
   <td style="text-align:left;"> Abnorml </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2918 </td>
   <td style="text-align:right;"> 2918 </td>
   <td style="text-align:right;"> 85 </td>
   <td style="text-align:left;"> RL </td>
   <td style="text-align:right;"> 62 </td>
   <td style="text-align:right;"> 10441 </td>
   <td style="text-align:left;"> Pave </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Reg </td>
   <td style="text-align:left;"> Lvl </td>
   <td style="text-align:left;"> AllPub </td>
   <td style="text-align:left;"> Inside </td>
   <td style="text-align:left;"> Gtl </td>
   <td style="text-align:left;"> Mitchel </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> 1Fam </td>
   <td style="text-align:left;"> SFoyer </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:left;"> Gable </td>
   <td style="text-align:left;"> CompShg </td>
   <td style="text-align:left;"> HdBoard </td>
   <td style="text-align:left;"> Wd Shng </td>
   <td style="text-align:left;"> None </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> PConc </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Av </td>
   <td style="text-align:left;"> GLQ </td>
   <td style="text-align:right;"> 337 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 575 </td>
   <td style="text-align:right;"> 912 </td>
   <td style="text-align:left;"> GasA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:left;"> SBrkr </td>
   <td style="text-align:right;"> 970 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 970 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> Typ </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:right;"> 80 </td>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> MnPrv </td>
   <td style="text-align:left;"> Shed </td>
   <td style="text-align:right;"> 700 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:left;"> WD </td>
   <td style="text-align:left;"> Normal </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2919 </td>
   <td style="text-align:right;"> 2919 </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:left;"> RL </td>
   <td style="text-align:right;"> 74 </td>
   <td style="text-align:right;"> 9627 </td>
   <td style="text-align:left;"> Pave </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Reg </td>
   <td style="text-align:left;"> Lvl </td>
   <td style="text-align:left;"> AllPub </td>
   <td style="text-align:left;"> Inside </td>
   <td style="text-align:left;"> Mod </td>
   <td style="text-align:left;"> Mitchel </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> 1Fam </td>
   <td style="text-align:left;"> 2Story </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:left;"> Gable </td>
   <td style="text-align:left;"> CompShg </td>
   <td style="text-align:left;"> HdBoard </td>
   <td style="text-align:left;"> HdBoard </td>
   <td style="text-align:left;"> BrkFace </td>
   <td style="text-align:right;"> 94 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> PConc </td>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Av </td>
   <td style="text-align:left;"> LwQ </td>
   <td style="text-align:right;"> 758 </td>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 238 </td>
   <td style="text-align:right;"> 996 </td>
   <td style="text-align:left;"> GasA </td>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:left;"> SBrkr </td>
   <td style="text-align:right;"> 996 </td>
   <td style="text-align:right;"> 1004 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> Typ </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Attchd </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:left;"> Fin </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 650 </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:right;"> 190 </td>
   <td style="text-align:right;"> 48 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:left;"> WD </td>
   <td style="text-align:left;"> Normal </td>
   <td style="text-align:right;"> NA </td>
  </tr>
</tbody>
</table></div>

### Analysing the Data
I tried to do some statistical summary of the data in order to get a better understanding of the dataset. A good insight of it.

'data.frame':	2919 obs. of  81 variables:
 $ Id           : int  1 2 3 4 5 6 7 8 9 10 ...
 $ MSSubClass   : int  60 20 60 70 60 50 20 60 50 190 ...
 $ MSZoning     : chr  "RL" "RL" "RL" "RL" ...
 $ LotFrontage  : int  65 80 68 60 84 85 75 NA 51 50 ...
 $ LotArea      : int  8450 9600 11250 9550 14260 14115 10084 10382 6120 7420 ...
 $ Street       : chr  "Pave" "Pave" "Pave" "Pave" ...
 $ Alley        : chr  NA NA NA NA ...
 $ LotShape     : chr  "Reg" "Reg" "IR1" "IR1" ...
 $ LandContour  : chr  "Lvl" "Lvl" "Lvl" "Lvl" ...
 $ Utilities    : chr  "AllPub" "AllPub" "AllPub" "AllPub" ...
 $ LotConfig    : chr  "Inside" "FR2" "Inside" "Corner" ...
 $ LandSlope    : chr  "Gtl" "Gtl" "Gtl" "Gtl" ...
 $ Neighborhood : chr  "CollgCr" "Veenker" "CollgCr" "Crawfor" ...
 $ Condition1   : chr  "Norm" "Feedr" "Norm" "Norm" ...
 $ Condition2   : chr  "Norm" "Norm" "Norm" "Norm" ...
 $ BldgType     : chr  "1Fam" "1Fam" "1Fam" "1Fam" ...
 $ HouseStyle   : chr  "2Story" "1Story" "2Story" "2Story" ...
 $ OverallQual  : int  7 6 7 7 8 5 8 7 7 5 ...
 $ OverallCond  : int  5 8 5 5 5 5 5 6 5 6 ...
 $ YearBuilt    : int  2003 1976 2001 1915 2000 1993 2004 1973 1931 1939 ...
 $ YearRemodAdd : int  2003 1976 2002 1970 2000 1995 2005 1973 1950 1950 ...
 $ RoofStyle    : chr  "Gable" "Gable" "Gable" "Gable" ...
 $ RoofMatl     : chr  "CompShg" "CompShg" "CompShg" "CompShg" ...
 $ Exterior1st  : chr  "VinylSd" "MetalSd" "VinylSd" "Wd Sdng" ...
 $ Exterior2nd  : chr  "VinylSd" "MetalSd" "VinylSd" "Wd Shng" ...
 $ MasVnrType   : chr  "BrkFace" "None" "BrkFace" "None" ...
 $ MasVnrArea   : int  196 0 162 0 350 0 186 240 0 0 ...
 $ ExterQual    : chr  "Gd" "TA" "Gd" "TA" ...
 $ ExterCond    : chr  "TA" "TA" "TA" "TA" ...
 $ Foundation   : chr  "PConc" "CBlock" "PConc" "BrkTil" ...
 $ BsmtQual     : chr  "Gd" "Gd" "Gd" "TA" ...
 $ BsmtCond     : chr  "TA" "TA" "TA" "Gd" ...
 $ BsmtExposure : chr  "No" "Gd" "Mn" "No" ...
 $ BsmtFinType1 : chr  "GLQ" "ALQ" "GLQ" "ALQ" ...
 $ BsmtFinSF1   : int  706 978 486 216 655 732 1369 859 0 851 ...
 $ BsmtFinType2 : chr  "Unf" "Unf" "Unf" "Unf" ...
 $ BsmtFinSF2   : int  0 0 0 0 0 0 0 32 0 0 ...
 $ BsmtUnfSF    : int  150 284 434 540 490 64 317 216 952 140 ...
 $ TotalBsmtSF  : int  856 1262 920 756 1145 796 1686 1107 952 991 ...
 $ Heating      : chr  "GasA" "GasA" "GasA" "GasA" ...
 $ HeatingQC    : chr  "Ex" "Ex" "Ex" "Gd" ...
 $ CentralAir   : chr  "Y" "Y" "Y" "Y" ...
 $ Electrical   : chr  "SBrkr" "SBrkr" "SBrkr" "SBrkr" ...
 $ X1stFlrSF    : int  856 1262 920 961 1145 796 1694 1107 1022 1077 ...
 $ X2ndFlrSF    : int  854 0 866 756 1053 566 0 983 752 0 ...
 $ LowQualFinSF : int  0 0 0 0 0 0 0 0 0 0 ...
 $ GrLivArea    : int  1710 1262 1786 1717 2198 1362 1694 2090 1774 1077 ...
 $ BsmtFullBath : int  1 0 1 1 1 1 1 1 0 1 ...
 $ BsmtHalfBath : int  0 1 0 0 0 0 0 0 0 0 ...
 $ FullBath     : int  2 2 2 1 2 1 2 2 2 1 ...
 $ HalfBath     : int  1 0 1 0 1 1 0 1 0 0 ...
 $ BedroomAbvGr : int  3 3 3 3 4 1 3 3 2 2 ...
 $ KitchenAbvGr : int  1 1 1 1 1 1 1 1 2 2 ...
 $ KitchenQual  : chr  "Gd" "TA" "Gd" "Gd" ...
 $ TotRmsAbvGrd : int  8 6 6 7 9 5 7 7 8 5 ...
 $ Functional   : chr  "Typ" "Typ" "Typ" "Typ" ...
 $ Fireplaces   : int  0 1 1 1 1 0 1 2 2 2 ...
 $ FireplaceQu  : chr  NA "TA" "TA" "Gd" ...
 $ GarageType   : chr  "Attchd" "Attchd" "Attchd" "Detchd" ...
 $ GarageYrBlt  : int  2003 1976 2001 1998 2000 1993 2004 1973 1931 1939 ...
 $ GarageFinish : chr  "RFn" "RFn" "RFn" "Unf" ...
 $ GarageCars   : int  2 2 2 3 3 2 2 2 2 1 ...
 $ GarageArea   : int  548 460 608 642 836 480 636 484 468 205 ...
 $ GarageQual   : chr  "TA" "TA" "TA" "TA" ...
 $ GarageCond   : chr  "TA" "TA" "TA" "TA" ...
 $ PavedDrive   : chr  "Y" "Y" "Y" "Y" ...
 $ WoodDeckSF   : int  0 298 0 0 192 40 255 235 90 0 ...
 $ OpenPorchSF  : int  61 0 42 35 84 30 57 204 0 4 ...
 $ EnclosedPorch: int  0 0 0 272 0 0 0 228 205 0 ...
 $ X3SsnPorch   : int  0 0 0 0 0 320 0 0 0 0 ...
 $ ScreenPorch  : int  0 0 0 0 0 0 0 0 0 0 ...
 $ PoolArea     : int  0 0 0 0 0 0 0 0 0 0 ...
 $ PoolQC       : chr  NA NA NA NA ...
 $ Fence        : chr  NA NA NA NA ...
 $ MiscFeature  : chr  NA NA NA NA ...
 $ MiscVal      : int  0 0 0 0 0 700 0 350 0 0 ...
 $ MoSold       : int  2 5 9 2 12 10 8 11 4 1 ...
 $ YrSold       : int  2008 2007 2008 2006 2008 2009 2007 2009 2008 2008 ...
 $ SaleType     : chr  "WD" "WD" "WD" "WD" ...
 $ SaleCondition: chr  "Normal" "Normal" "Normal" "Abnorml" ...
 $ SalePrice    : int  208500 181500 223500 140000 250000 143000 307000 200000 129900 118000 ...
       Id           MSSubClass       MSZoning          LotFrontage    
 Min.   :   1.0   Min.   : 20.00   Length:2919        Min.   : 21.00  
 1st Qu.: 730.5   1st Qu.: 20.00   Class :character   1st Qu.: 59.00  
 Median :1460.0   Median : 50.00   Mode  :character   Median : 68.00  
 Mean   :1460.0   Mean   : 57.14                      Mean   : 69.31  
 3rd Qu.:2189.5   3rd Qu.: 70.00                      3rd Qu.: 80.00  
 Max.   :2919.0   Max.   :190.00                      Max.   :313.00  
                                                      NA's   :486     
    LotArea          Street             Alley             LotShape        
 Min.   :  1300   Length:2919        Length:2919        Length:2919       
 1st Qu.:  7478   Class :character   Class :character   Class :character  
 Median :  9453   Mode  :character   Mode  :character   Mode  :character  
 Mean   : 10168                                                           
 3rd Qu.: 11570                                                           
 Max.   :215245                                                           
                                                                          
 LandContour         Utilities          LotConfig        
 Length:2919        Length:2919        Length:2919       
 Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character  
                                                         
                                                         
                                                         
                                                         
  LandSlope         Neighborhood        Condition1       
 Length:2919        Length:2919        Length:2919       
 Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character  
                                                         
                                                         
                                                         
                                                         
  Condition2          BldgType          HouseStyle         OverallQual    
 Length:2919        Length:2919        Length:2919        Min.   : 1.000  
 Class :character   Class :character   Class :character   1st Qu.: 5.000  
 Mode  :character   Mode  :character   Mode  :character   Median : 6.000  
                                                          Mean   : 6.089  
                                                          3rd Qu.: 7.000  
                                                          Max.   :10.000  
                                                                          
  OverallCond      YearBuilt     YearRemodAdd   RoofStyle        
 Min.   :1.000   Min.   :1872   Min.   :1950   Length:2919       
 1st Qu.:5.000   1st Qu.:1954   1st Qu.:1965   Class :character  
 Median :5.000   Median :1973   Median :1993   Mode  :character  
 Mean   :5.565   Mean   :1971   Mean   :1984                     
 3rd Qu.:6.000   3rd Qu.:2001   3rd Qu.:2004                     
 Max.   :9.000   Max.   :2010   Max.   :2010                     
                                                                 
   RoofMatl         Exterior1st        Exterior2nd       
 Length:2919        Length:2919        Length:2919       
 Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character  
                                                         
                                                         
                                                         
                                                         
  MasVnrType          MasVnrArea      ExterQual          ExterCond        
 Length:2919        Min.   :   0.0   Length:2919        Length:2919       
 Class :character   1st Qu.:   0.0   Class :character   Class :character  
 Mode  :character   Median :   0.0   Mode  :character   Mode  :character  
                    Mean   : 102.2                                        
                    3rd Qu.: 164.0                                        
                    Max.   :1600.0                                        
                    NA's   :23                                            
  Foundation          BsmtQual           BsmtCond        
 Length:2919        Length:2919        Length:2919       
 Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character  
                                                         
                                                         
                                                         
                                                         
 BsmtExposure       BsmtFinType1         BsmtFinSF1     BsmtFinType2      
 Length:2919        Length:2919        Min.   :   0.0   Length:2919       
 Class :character   Class :character   1st Qu.:   0.0   Class :character  
 Mode  :character   Mode  :character   Median : 368.5   Mode  :character  
                                       Mean   : 441.4                     
                                       3rd Qu.: 733.0                     
                                       Max.   :5644.0                     
                                       NA's   :1                          
   BsmtFinSF2        BsmtUnfSF       TotalBsmtSF       Heating         
 Min.   :   0.00   Min.   :   0.0   Min.   :   0.0   Length:2919       
 1st Qu.:   0.00   1st Qu.: 220.0   1st Qu.: 793.0   Class :character  
 Median :   0.00   Median : 467.0   Median : 989.5   Mode  :character  
 Mean   :  49.58   Mean   : 560.8   Mean   :1051.8                     
 3rd Qu.:   0.00   3rd Qu.: 805.5   3rd Qu.:1302.0                     
 Max.   :1526.00   Max.   :2336.0   Max.   :6110.0                     
 NA's   :1         NA's   :1        NA's   :1                          
  HeatingQC          CentralAir         Electrical          X1stFlrSF   
 Length:2919        Length:2919        Length:2919        Min.   : 334  
 Class :character   Class :character   Class :character   1st Qu.: 876  
 Mode  :character   Mode  :character   Mode  :character   Median :1082  
                                                          Mean   :1160  
                                                          3rd Qu.:1388  
                                                          Max.   :5095  
                                                                        
   X2ndFlrSF       LowQualFinSF        GrLivArea     BsmtFullBath   
 Min.   :   0.0   Min.   :   0.000   Min.   : 334   Min.   :0.0000  
 1st Qu.:   0.0   1st Qu.:   0.000   1st Qu.:1126   1st Qu.:0.0000  
 Median :   0.0   Median :   0.000   Median :1444   Median :0.0000  
 Mean   : 336.5   Mean   :   4.694   Mean   :1501   Mean   :0.4299  
 3rd Qu.: 704.0   3rd Qu.:   0.000   3rd Qu.:1744   3rd Qu.:1.0000  
 Max.   :2065.0   Max.   :1064.000   Max.   :5642   Max.   :3.0000  
                                                    NA's   :2       
  BsmtHalfBath        FullBath        HalfBath       BedroomAbvGr 
 Min.   :0.00000   Min.   :0.000   Min.   :0.0000   Min.   :0.00  
 1st Qu.:0.00000   1st Qu.:1.000   1st Qu.:0.0000   1st Qu.:2.00  
 Median :0.00000   Median :2.000   Median :0.0000   Median :3.00  
 Mean   :0.06136   Mean   :1.568   Mean   :0.3803   Mean   :2.86  
 3rd Qu.:0.00000   3rd Qu.:2.000   3rd Qu.:1.0000   3rd Qu.:3.00  
 Max.   :2.00000   Max.   :4.000   Max.   :2.0000   Max.   :8.00  
 NA's   :2                                                        
  KitchenAbvGr   KitchenQual         TotRmsAbvGrd     Functional       
 Min.   :0.000   Length:2919        Min.   : 2.000   Length:2919       
 1st Qu.:1.000   Class :character   1st Qu.: 5.000   Class :character  
 Median :1.000   Mode  :character   Median : 6.000   Mode  :character  
 Mean   :1.045                      Mean   : 6.452                     
 3rd Qu.:1.000                      3rd Qu.: 7.000                     
 Max.   :3.000                      Max.   :15.000                     
                                                                       
   Fireplaces     FireplaceQu         GarageType         GarageYrBlt  
 Min.   :0.0000   Length:2919        Length:2919        Min.   :1895  
 1st Qu.:0.0000   Class :character   Class :character   1st Qu.:1960  
 Median :1.0000   Mode  :character   Mode  :character   Median :1979  
 Mean   :0.5971                                         Mean   :1978  
 3rd Qu.:1.0000                                         3rd Qu.:2002  
 Max.   :4.0000                                         Max.   :2207  
                                                        NA's   :159   
 GarageFinish         GarageCars      GarageArea      GarageQual       
 Length:2919        Min.   :0.000   Min.   :   0.0   Length:2919       
 Class :character   1st Qu.:1.000   1st Qu.: 320.0   Class :character  
 Mode  :character   Median :2.000   Median : 480.0   Mode  :character  
                    Mean   :1.767   Mean   : 472.9                     
                    3rd Qu.:2.000   3rd Qu.: 576.0                     
                    Max.   :5.000   Max.   :1488.0                     
                    NA's   :1       NA's   :1                          
  GarageCond         PavedDrive          WoodDeckSF       OpenPorchSF    
 Length:2919        Length:2919        Min.   :   0.00   Min.   :  0.00  
 Class :character   Class :character   1st Qu.:   0.00   1st Qu.:  0.00  
 Mode  :character   Mode  :character   Median :   0.00   Median : 26.00  
                                       Mean   :  93.71   Mean   : 47.49  
                                       3rd Qu.: 168.00   3rd Qu.: 70.00  
                                       Max.   :1424.00   Max.   :742.00  
                                                                         
 EnclosedPorch      X3SsnPorch       ScreenPorch        PoolArea      
 Min.   :   0.0   Min.   :  0.000   Min.   :  0.00   Min.   :  0.000  
 1st Qu.:   0.0   1st Qu.:  0.000   1st Qu.:  0.00   1st Qu.:  0.000  
 Median :   0.0   Median :  0.000   Median :  0.00   Median :  0.000  
 Mean   :  23.1   Mean   :  2.602   Mean   : 16.06   Mean   :  2.252  
 3rd Qu.:   0.0   3rd Qu.:  0.000   3rd Qu.:  0.00   3rd Qu.:  0.000  
 Max.   :1012.0   Max.   :508.000   Max.   :576.00   Max.   :800.000  
                                                                      
    PoolQC             Fence           MiscFeature       
 Length:2919        Length:2919        Length:2919       
 Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character  
                                                         
                                                         
                                                         
                                                         
    MiscVal             MoSold           YrSold       SaleType        
 Min.   :    0.00   Min.   : 1.000   Min.   :2006   Length:2919       
 1st Qu.:    0.00   1st Qu.: 4.000   1st Qu.:2007   Class :character  
 Median :    0.00   Median : 6.000   Median :2008   Mode  :character  
 Mean   :   50.83   Mean   : 6.213   Mean   :2008                     
 3rd Qu.:    0.00   3rd Qu.: 8.000   3rd Qu.:2009                     
 Max.   :17000.00   Max.   :12.000   Max.   :2010                     
                                                                      
 SaleCondition        SalePrice     
 Length:2919        Min.   : 34900  
 Class :character   1st Qu.:129975  
 Mode  :character   Median :163000  
                    Mean   :180921  
                    3rd Qu.:214000  
                    Max.   :755000  
                    NA's   :1459    
$Id
NULL

$MSSubClass
var
  20   30   40   45   50   60   70   75   80   85   90  120  150  160  180 
1079  139    6   18  287  575  128   23  118   48  109  182    1  128   17 
 190 
  61 

$MSZoning
var
C (all)      FV      RH      RL      RM 
     25     139      26    2265     460 

$LotFrontage
NULL

$LotArea
NULL

$Street
var
Grvl Pave 
  12 2907 

$Alley
var
Grvl Pave 
 120   78 

$LotShape
var
 IR1  IR2  IR3  Reg 
 968   76   16 1859 

$LandContour
var
 Bnk  HLS  Low  Lvl 
 117  120   60 2622 

$Utilities
var
AllPub NoSeWa 
  2916      1 

$LotConfig
var
 Corner CulDSac     FR2     FR3  Inside 
    511     176      85      14    2133 

$LandSlope
var
 Gtl  Mod  Sev 
2778  125   16 

$Neighborhood
NULL

$Condition1
var
Artery  Feedr   Norm   PosA   PosN   RRAe   RRAn   RRNe   RRNn 
    92    164   2511     20     39     28     50      6      9 

$Condition2
var
Artery  Feedr   Norm   PosA   PosN   RRAe   RRAn   RRNn 
     5     13   2889      4      4      1      1      2 

$BldgType
var
  1Fam 2fmCon Duplex  Twnhs TwnhsE 
  2425     62    109     96    227 

$HouseStyle
var
1.5Fin 1.5Unf 1Story 2.5Fin 2.5Unf 2Story SFoyer   SLvl 
   314     19   1471      8     24    872     83    128 

$OverallQual
var
  1   2   3   4   5   6   7   8   9  10 
  4  13  40 226 825 731 600 342 107  31 

$OverallCond
var
   1    2    3    4    5    6    7    8    9 
   7   10   50  101 1645  531  390  144   41 

$YearBuilt
NULL

$YearRemodAdd
NULL

$RoofStyle
var
   Flat   Gable Gambrel     Hip Mansard    Shed 
     20    2310      22     551      11       5 

$RoofMatl
var
ClyTile CompShg Membran   Metal    Roll Tar&Grv WdShake WdShngl 
      1    2876       1       1       1      23       9       7 

$Exterior1st
var
AsbShng AsphShn BrkComm BrkFace  CBlock CemntBd HdBoard ImStucc MetalSd 
     44       2       6      87       2     126     442       1     450 
Plywood   Stone  Stucco VinylSd Wd Sdng WdShing 
    221       2      43    1025     411      56 

$Exterior2nd
var
AsbShng AsphShn Brk Cmn BrkFace  CBlock CmentBd HdBoard ImStucc MetalSd 
     38       4      22      47       3     126     406      15     447 
  Other Plywood   Stone  Stucco VinylSd Wd Sdng Wd Shng 
      1     270       6      47    1014     391      81 

$MasVnrType
var
 BrkCmn BrkFace    None   Stone 
     25     879    1742     249 

$MasVnrArea
NULL

$ExterQual
var
  Ex   Fa   Gd   TA 
 107   35  979 1798 

$ExterCond
var
  Ex   Fa   Gd   Po   TA 
  12   67  299    3 2538 

$Foundation
var
BrkTil CBlock  PConc   Slab  Stone   Wood 
   311   1235   1308     49     11      5 

$BsmtQual
var
  Ex   Fa   Gd   TA 
 258   88 1209 1283 

$BsmtCond
var
  Fa   Gd   Po   TA 
 104  122    5 2606 

$BsmtExposure
var
  Av   Gd   Mn   No 
 418  276  239 1904 

$BsmtFinType1
var
ALQ BLQ GLQ LwQ Rec Unf 
429 269 849 154 288 851 

$BsmtFinSF1
NULL

$BsmtFinType2
var
 ALQ  BLQ  GLQ  LwQ  Rec  Unf 
  52   68   34   87  105 2493 

$BsmtFinSF2
NULL

$BsmtUnfSF
NULL

$TotalBsmtSF
NULL

$Heating
var
Floor  GasA  GasW  Grav  OthW  Wall 
    1  2874    27     9     2     6 

$HeatingQC
var
  Ex   Fa   Gd   Po   TA 
1493   92  474    3  857 

$CentralAir
var
   N    Y 
 196 2723 

$Electrical
var
FuseA FuseF FuseP   Mix SBrkr 
  188    50     8     1  2671 

$X1stFlrSF
NULL

$X2ndFlrSF
NULL

$LowQualFinSF
NULL

$GrLivArea
NULL

$BsmtFullBath
var
   0    1    2    3 
1705 1172   38    2 

$BsmtHalfBath
var
   0    1    2 
2742  171    4 

$FullBath
var
   0    1    2    3    4 
  12 1309 1530   64    4 

$HalfBath
var
   0    1    2 
1834 1060   25 

$BedroomAbvGr
var
   0    1    2    3    4    5    6    8 
   8  103  742 1596  400   48   21    1 

$KitchenAbvGr
var
   0    1    2    3 
   3 2785  129    2 

$KitchenQual
var
  Ex   Fa   Gd   TA 
 205   70 1151 1492 

$TotRmsAbvGrd
var
  2   3   4   5   6   7   8   9  10  11  12  13  14  15 
  1  25 196 583 844 649 347 143  80  32  16   1   1   1 

$Functional
var
Maj1 Maj2 Min1 Min2  Mod  Sev  Typ 
  19    9   65   70   35    2 2717 

$Fireplaces
var
   0    1    2    3    4 
1420 1268  219   11    1 

$FireplaceQu
var
 Ex  Fa  Gd  Po  TA 
 43  74 744  46 592 

$GarageType
var
 2Types  Attchd Basment BuiltIn CarPort  Detchd 
     23    1723      36     186      15     779 

$GarageYrBlt
NULL

$GarageFinish
var
 Fin  RFn  Unf 
 719  811 1230 

$GarageCars
var
   0    1    2    3    4    5 
 157  776 1594  374   16    1 

$GarageArea
NULL

$GarageQual
var
  Ex   Fa   Gd   Po   TA 
   3  124   24    5 2604 

$GarageCond
var
  Ex   Fa   Gd   Po   TA 
   3   74   15   14 2654 

$PavedDrive
var
   N    P    Y 
 216   62 2641 

$WoodDeckSF
NULL

$OpenPorchSF
NULL

$EnclosedPorch
NULL

$X3SsnPorch
NULL

$ScreenPorch
NULL

$PoolArea
var
   0  144  228  368  444  480  512  519  555  561  576  648  738  800 
2906    1    1    1    1    1    1    1    1    1    1    1    1    1 

$PoolQC
var
Ex Fa Gd 
 4  2  4 

$Fence
var
GdPrv  GdWo MnPrv  MnWw 
  118   112   329    12 

$MiscFeature
var
Gar2 Othr Shed TenC 
   5    4   95    1 

$MiscVal
NULL

$MoSold
var
  1   2   3   4   5   6   7   8   9  10  11  12 
122 133 232 279 394 503 446 233 158 173 142 104 

$YrSold
var
2006 2007 2008 2009 2010 
 619  692  622  647  339 

$SaleType
var
  COD   Con ConLD ConLI ConLw   CWD   New   Oth    WD 
   87     5    26     9     8    12   239     7  2525 

$SaleCondition
var
Abnorml AdjLand  Alloca  Family  Normal Partial 
    190      12      24      46    2402     245 

$SalePrice
NULL

### EAD

I tried to do some basic graph to understand the data more and to discover some relationship between the different observations in the dataset.

**GrLivArea, SalePrice Relationship**

```
## Warning: Removed 1459 rows containing missing values (geom_point).
```

![](Project_Summary_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

The above plot shows the relationship between the different categories of GrLiveArea (Above grade (ground) living area square feet and the salePrice of homes. There tend to be a padering of positive regression between some of the different categories of GrLivArea and the SalePrice. This variable kind of show a rate of importance towards the model.

**Neighborhood, SalePrice Relationship**
![](Project_Summary_files/figure-html/unnamed-chunk-4-1.png)<!-- -->
This is also a good variable that shows some strength towards the model that will be built. It shows a good relationship towards knowing the price of houses in different area in the region. Although, there seems to be some outliers in the variable which could also be seen in the statistical summary of the dataset.

**HouseStyle, SalePrice Relationship**
![](Project_Summary_files/figure-html/unnamed-chunk-5-1.png)<!-- -->
Wheather it is a one story building or two, this boxplot shows the relationship between the HouseStyle and the SalePrice of homes in this area. It has some good view of the average prices of any kind of house in this area which could also be a good fit towards the goal of this project. It has some outliers in it as well.

![](Project_Summary_files/figure-html/unnamed-chunk-6-1.png)<!-- -->
Doing some more exploratory analysis on the data, the guassian method was used to do some data transformation which could be seen in the graph above. The graph is an histogram used to do some statistical analysis on the dataset. It is a comparison of the normal data histogram and also apply the gaussian on the data with different variables.

### Outliers
The data has some quite number outliers. First, there was a little bit of feature engineering being done. Some of the observations has a lot of zeros that do not relate to the dataset that converted into NA's before treating the outliers accordingly with a function that detect and print out the outliers and another function was written that fix the outliers by converting them into NA's in the data.

### Missing values
The data also has a lot of missing data. Also, while engineering some features especially from the categorical variables, many of which the NA's are engineered into 'None' due to the viewing and understanding of the dataset. Below are the percentages of missing data of each variable in the dataset.
[1] 0.05980216

Total number of missing data of each variable
           Id    MSSubClass      MSZoning   LotFrontage       LotArea 
            0             0             4           486             0 
       Street         Alley      LotShape   LandContour     Utilities 
            0          2721             0             0             2 
    LotConfig     LandSlope  Neighborhood    Condition1    Condition2 
            0             0             0             0             0 
     BldgType    HouseStyle   OverallQual   OverallCond     YearBuilt 
            0             0             0             0             0 
 YearRemodAdd     RoofStyle      RoofMatl   Exterior1st   Exterior2nd 
            0             0             0             1             1 
   MasVnrType    MasVnrArea     ExterQual     ExterCond    Foundation 
           24            23             0             0             0 
     BsmtQual      BsmtCond  BsmtExposure  BsmtFinType1    BsmtFinSF1 
           81            82            82            79             1 
 BsmtFinType2    BsmtFinSF2     BsmtUnfSF   TotalBsmtSF       Heating 
           80             1             1             1             0 
    HeatingQC    CentralAir    Electrical     X1stFlrSF     X2ndFlrSF 
            0             0             1             0             0 
 LowQualFinSF     GrLivArea  BsmtFullBath  BsmtHalfBath      FullBath 
            0             0             2             2             0 
     HalfBath  BedroomAbvGr  KitchenAbvGr   KitchenQual  TotRmsAbvGrd 
            0             0             0             1             0 
   Functional    Fireplaces   FireplaceQu    GarageType   GarageYrBlt 
            2             0          1420           157           159 
 GarageFinish    GarageCars    GarageArea    GarageQual    GarageCond 
          159             1             1           159           159 
   PavedDrive    WoodDeckSF   OpenPorchSF EnclosedPorch    X3SsnPorch 
            0             0             0             0             0 
  ScreenPorch      PoolArea        PoolQC         Fence   MiscFeature 
            0             0          2909          2348          2814 
      MiscVal        MoSold        YrSold      SaleType SaleCondition 
            0             0             0             1             0 

The missing data were fixed using imputation. I used the randomForest to do this with the missForest.

### Correlataions
![](Project_Summary_files/figure-html/unnamed-chunk-9-1.png)<!-- -->

This is the correlation plot between the different continuous variables in the dataset. Some of the variables are strongly correlated with some are sligthly correlated with each other.

### Skewing the dataset
The dataset is skewwed for more statistical preparation of the dataset for normal propability distribution. With this the data wasn't perfectly symmetrical but tend to be highly skewed.

## Building the model

### Cross Validation for LR, Ridge, Lasso and Elastic Reg
I used cross validation for the dataset in final preparation on it before building the model. 10k fold cross validation after which the model was built.

### Linear regression
Linear regression was used to build the model with three other.
+ Fold01.Rep01: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold01.Rep01: intercept=TRUE 
+ Fold02.Rep01: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold02.Rep01: intercept=TRUE 
+ Fold03.Rep01: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold03.Rep01: intercept=TRUE 
+ Fold04.Rep01: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold04.Rep01: intercept=TRUE 
+ Fold05.Rep01: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold05.Rep01: intercept=TRUE 
+ Fold06.Rep01: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold06.Rep01: intercept=TRUE 
+ Fold07.Rep01: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold07.Rep01: intercept=TRUE 
+ Fold08.Rep01: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold08.Rep01: intercept=TRUE 
+ Fold09.Rep01: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold09.Rep01: intercept=TRUE 
+ Fold10.Rep01: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold10.Rep01: intercept=TRUE 
+ Fold01.Rep02: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold01.Rep02: intercept=TRUE 
+ Fold02.Rep02: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold02.Rep02: intercept=TRUE 
+ Fold03.Rep02: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold03.Rep02: intercept=TRUE 
+ Fold04.Rep02: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold04.Rep02: intercept=TRUE 
+ Fold05.Rep02: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold05.Rep02: intercept=TRUE 
+ Fold06.Rep02: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold06.Rep02: intercept=TRUE 
+ Fold07.Rep02: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold07.Rep02: intercept=TRUE 
+ Fold08.Rep02: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold08.Rep02: intercept=TRUE 
+ Fold09.Rep02: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold09.Rep02: intercept=TRUE 
+ Fold10.Rep02: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold10.Rep02: intercept=TRUE 
+ Fold01.Rep03: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold01.Rep03: intercept=TRUE 
+ Fold02.Rep03: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold02.Rep03: intercept=TRUE 
+ Fold03.Rep03: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold03.Rep03: intercept=TRUE 
+ Fold04.Rep03: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold04.Rep03: intercept=TRUE 
+ Fold05.Rep03: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold05.Rep03: intercept=TRUE 
+ Fold06.Rep03: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold06.Rep03: intercept=TRUE 
+ Fold07.Rep03: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold07.Rep03: intercept=TRUE 
+ Fold08.Rep03: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold08.Rep03: intercept=TRUE 
+ Fold09.Rep03: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold09.Rep03: intercept=TRUE 
+ Fold10.Rep03: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold10.Rep03: intercept=TRUE 
+ Fold01.Rep04: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold01.Rep04: intercept=TRUE 
+ Fold02.Rep04: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold02.Rep04: intercept=TRUE 
+ Fold03.Rep04: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold03.Rep04: intercept=TRUE 
+ Fold04.Rep04: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold04.Rep04: intercept=TRUE 
+ Fold05.Rep04: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold05.Rep04: intercept=TRUE 
+ Fold06.Rep04: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold06.Rep04: intercept=TRUE 
+ Fold07.Rep04: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold07.Rep04: intercept=TRUE 
+ Fold08.Rep04: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold08.Rep04: intercept=TRUE 
+ Fold09.Rep04: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold09.Rep04: intercept=TRUE 
+ Fold10.Rep04: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold10.Rep04: intercept=TRUE 
+ Fold01.Rep05: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold01.Rep05: intercept=TRUE 
+ Fold02.Rep05: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold02.Rep05: intercept=TRUE 
+ Fold03.Rep05: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold03.Rep05: intercept=TRUE 
+ Fold04.Rep05: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold04.Rep05: intercept=TRUE 
+ Fold05.Rep05: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold05.Rep05: intercept=TRUE 
+ Fold06.Rep05: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold06.Rep05: intercept=TRUE 
+ Fold07.Rep05: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold07.Rep05: intercept=TRUE 
+ Fold08.Rep05: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold08.Rep05: intercept=TRUE 
+ Fold09.Rep05: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold09.Rep05: intercept=TRUE 
+ Fold10.Rep05: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold10.Rep05: intercept=TRUE 
+ Fold01.Rep06: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold01.Rep06: intercept=TRUE 
+ Fold02.Rep06: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold02.Rep06: intercept=TRUE 
+ Fold03.Rep06: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold03.Rep06: intercept=TRUE 
+ Fold04.Rep06: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold04.Rep06: intercept=TRUE 
+ Fold05.Rep06: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold05.Rep06: intercept=TRUE 
+ Fold06.Rep06: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold06.Rep06: intercept=TRUE 
+ Fold07.Rep06: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold07.Rep06: intercept=TRUE 
+ Fold08.Rep06: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold08.Rep06: intercept=TRUE 
+ Fold09.Rep06: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold09.Rep06: intercept=TRUE 
+ Fold10.Rep06: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold10.Rep06: intercept=TRUE 
+ Fold01.Rep07: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold01.Rep07: intercept=TRUE 
+ Fold02.Rep07: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold02.Rep07: intercept=TRUE 
+ Fold03.Rep07: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold03.Rep07: intercept=TRUE 
+ Fold04.Rep07: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold04.Rep07: intercept=TRUE 
+ Fold05.Rep07: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold05.Rep07: intercept=TRUE 
+ Fold06.Rep07: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold06.Rep07: intercept=TRUE 
+ Fold07.Rep07: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold07.Rep07: intercept=TRUE 
+ Fold08.Rep07: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold08.Rep07: intercept=TRUE 
+ Fold09.Rep07: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold09.Rep07: intercept=TRUE 
+ Fold10.Rep07: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold10.Rep07: intercept=TRUE 
+ Fold01.Rep08: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold01.Rep08: intercept=TRUE 
+ Fold02.Rep08: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold02.Rep08: intercept=TRUE 
+ Fold03.Rep08: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold03.Rep08: intercept=TRUE 
+ Fold04.Rep08: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold04.Rep08: intercept=TRUE 
+ Fold05.Rep08: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold05.Rep08: intercept=TRUE 
+ Fold06.Rep08: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold06.Rep08: intercept=TRUE 
+ Fold07.Rep08: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold07.Rep08: intercept=TRUE 
+ Fold08.Rep08: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold08.Rep08: intercept=TRUE 
+ Fold09.Rep08: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold09.Rep08: intercept=TRUE 
+ Fold10.Rep08: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold10.Rep08: intercept=TRUE 
+ Fold01.Rep09: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold01.Rep09: intercept=TRUE 
+ Fold02.Rep09: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold02.Rep09: intercept=TRUE 
+ Fold03.Rep09: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold03.Rep09: intercept=TRUE 
+ Fold04.Rep09: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold04.Rep09: intercept=TRUE 
+ Fold05.Rep09: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold05.Rep09: intercept=TRUE 
+ Fold06.Rep09: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold06.Rep09: intercept=TRUE 
+ Fold07.Rep09: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold07.Rep09: intercept=TRUE 
+ Fold08.Rep09: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold08.Rep09: intercept=TRUE 
+ Fold09.Rep09: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold09.Rep09: intercept=TRUE 
+ Fold10.Rep09: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold10.Rep09: intercept=TRUE 
+ Fold01.Rep10: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold01.Rep10: intercept=TRUE 
+ Fold02.Rep10: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold02.Rep10: intercept=TRUE 
+ Fold03.Rep10: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold03.Rep10: intercept=TRUE 
+ Fold04.Rep10: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold04.Rep10: intercept=TRUE 
+ Fold05.Rep10: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold05.Rep10: intercept=TRUE 
+ Fold06.Rep10: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold06.Rep10: intercept=TRUE 
+ Fold07.Rep10: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold07.Rep10: intercept=TRUE 
+ Fold08.Rep10: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold08.Rep10: intercept=TRUE 
+ Fold09.Rep10: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold09.Rep10: intercept=TRUE 
+ Fold10.Rep10: intercept=TRUE 

```
## Warning in predict.lm(modelFit, newdata): prediction from a rank-deficient
## fit may be misleading
```

- Fold10.Rep10: intercept=TRUE 
Aggregating results
Fitting final model on full training set

```
## Warning: not plotting observations with leverage one:
##   121, 186, 251, 272, 326, 333, 347, 376, 399, 584, 596, 667, 811, 945, 1004, 1012, 1188, 1231, 1271, 1276, 1299, 1322, 1371, 1387
```

![](Project_Summary_files/figure-html/unnamed-chunk-10-1.png)<!-- -->![](Project_Summary_files/figure-html/unnamed-chunk-10-2.png)<!-- -->

```
## Warning: not plotting observations with leverage one:
##   121, 186, 251, 272, 326, 333, 347, 376, 399, 584, 596, 667, 811, 945, 1004, 1012, 1188, 1231, 1271, 1276, 1299, 1322, 1371, 1387
```

![](Project_Summary_files/figure-html/unnamed-chunk-10-3.png)<!-- -->![](Project_Summary_files/figure-html/unnamed-chunk-10-4.png)<!-- -->

### Ridge regression model
+ Fold01.Rep01: alpha=0, lambda=1 
- Fold01.Rep01: alpha=0, lambda=1 
+ Fold02.Rep01: alpha=0, lambda=1 
- Fold02.Rep01: alpha=0, lambda=1 
+ Fold03.Rep01: alpha=0, lambda=1 
- Fold03.Rep01: alpha=0, lambda=1 
+ Fold04.Rep01: alpha=0, lambda=1 
- Fold04.Rep01: alpha=0, lambda=1 
+ Fold05.Rep01: alpha=0, lambda=1 
- Fold05.Rep01: alpha=0, lambda=1 
+ Fold06.Rep01: alpha=0, lambda=1 
- Fold06.Rep01: alpha=0, lambda=1 
+ Fold07.Rep01: alpha=0, lambda=1 
- Fold07.Rep01: alpha=0, lambda=1 
+ Fold08.Rep01: alpha=0, lambda=1 
- Fold08.Rep01: alpha=0, lambda=1 
+ Fold09.Rep01: alpha=0, lambda=1 
- Fold09.Rep01: alpha=0, lambda=1 
+ Fold10.Rep01: alpha=0, lambda=1 
- Fold10.Rep01: alpha=0, lambda=1 
+ Fold01.Rep02: alpha=0, lambda=1 
- Fold01.Rep02: alpha=0, lambda=1 
+ Fold02.Rep02: alpha=0, lambda=1 
- Fold02.Rep02: alpha=0, lambda=1 
+ Fold03.Rep02: alpha=0, lambda=1 
- Fold03.Rep02: alpha=0, lambda=1 
+ Fold04.Rep02: alpha=0, lambda=1 
- Fold04.Rep02: alpha=0, lambda=1 
+ Fold05.Rep02: alpha=0, lambda=1 
- Fold05.Rep02: alpha=0, lambda=1 
+ Fold06.Rep02: alpha=0, lambda=1 
- Fold06.Rep02: alpha=0, lambda=1 
+ Fold07.Rep02: alpha=0, lambda=1 
- Fold07.Rep02: alpha=0, lambda=1 
+ Fold08.Rep02: alpha=0, lambda=1 
- Fold08.Rep02: alpha=0, lambda=1 
+ Fold09.Rep02: alpha=0, lambda=1 
- Fold09.Rep02: alpha=0, lambda=1 
+ Fold10.Rep02: alpha=0, lambda=1 
- Fold10.Rep02: alpha=0, lambda=1 
+ Fold01.Rep03: alpha=0, lambda=1 
- Fold01.Rep03: alpha=0, lambda=1 
+ Fold02.Rep03: alpha=0, lambda=1 
- Fold02.Rep03: alpha=0, lambda=1 
+ Fold03.Rep03: alpha=0, lambda=1 
- Fold03.Rep03: alpha=0, lambda=1 
+ Fold04.Rep03: alpha=0, lambda=1 
- Fold04.Rep03: alpha=0, lambda=1 
+ Fold05.Rep03: alpha=0, lambda=1 
- Fold05.Rep03: alpha=0, lambda=1 
+ Fold06.Rep03: alpha=0, lambda=1 
- Fold06.Rep03: alpha=0, lambda=1 
+ Fold07.Rep03: alpha=0, lambda=1 
- Fold07.Rep03: alpha=0, lambda=1 
+ Fold08.Rep03: alpha=0, lambda=1 
- Fold08.Rep03: alpha=0, lambda=1 
+ Fold09.Rep03: alpha=0, lambda=1 
- Fold09.Rep03: alpha=0, lambda=1 
+ Fold10.Rep03: alpha=0, lambda=1 
- Fold10.Rep03: alpha=0, lambda=1 
+ Fold01.Rep04: alpha=0, lambda=1 
- Fold01.Rep04: alpha=0, lambda=1 
+ Fold02.Rep04: alpha=0, lambda=1 
- Fold02.Rep04: alpha=0, lambda=1 
+ Fold03.Rep04: alpha=0, lambda=1 
- Fold03.Rep04: alpha=0, lambda=1 
+ Fold04.Rep04: alpha=0, lambda=1 
- Fold04.Rep04: alpha=0, lambda=1 
+ Fold05.Rep04: alpha=0, lambda=1 
- Fold05.Rep04: alpha=0, lambda=1 
+ Fold06.Rep04: alpha=0, lambda=1 
- Fold06.Rep04: alpha=0, lambda=1 
+ Fold07.Rep04: alpha=0, lambda=1 
- Fold07.Rep04: alpha=0, lambda=1 
+ Fold08.Rep04: alpha=0, lambda=1 
- Fold08.Rep04: alpha=0, lambda=1 
+ Fold09.Rep04: alpha=0, lambda=1 
- Fold09.Rep04: alpha=0, lambda=1 
+ Fold10.Rep04: alpha=0, lambda=1 
- Fold10.Rep04: alpha=0, lambda=1 
+ Fold01.Rep05: alpha=0, lambda=1 
- Fold01.Rep05: alpha=0, lambda=1 
+ Fold02.Rep05: alpha=0, lambda=1 
- Fold02.Rep05: alpha=0, lambda=1 
+ Fold03.Rep05: alpha=0, lambda=1 
- Fold03.Rep05: alpha=0, lambda=1 
+ Fold04.Rep05: alpha=0, lambda=1 
- Fold04.Rep05: alpha=0, lambda=1 
+ Fold05.Rep05: alpha=0, lambda=1 
- Fold05.Rep05: alpha=0, lambda=1 
+ Fold06.Rep05: alpha=0, lambda=1 
- Fold06.Rep05: alpha=0, lambda=1 
+ Fold07.Rep05: alpha=0, lambda=1 
- Fold07.Rep05: alpha=0, lambda=1 
+ Fold08.Rep05: alpha=0, lambda=1 
- Fold08.Rep05: alpha=0, lambda=1 
+ Fold09.Rep05: alpha=0, lambda=1 
- Fold09.Rep05: alpha=0, lambda=1 
+ Fold10.Rep05: alpha=0, lambda=1 
- Fold10.Rep05: alpha=0, lambda=1 
+ Fold01.Rep06: alpha=0, lambda=1 
- Fold01.Rep06: alpha=0, lambda=1 
+ Fold02.Rep06: alpha=0, lambda=1 
- Fold02.Rep06: alpha=0, lambda=1 
+ Fold03.Rep06: alpha=0, lambda=1 
- Fold03.Rep06: alpha=0, lambda=1 
+ Fold04.Rep06: alpha=0, lambda=1 
- Fold04.Rep06: alpha=0, lambda=1 
+ Fold05.Rep06: alpha=0, lambda=1 
- Fold05.Rep06: alpha=0, lambda=1 
+ Fold06.Rep06: alpha=0, lambda=1 
- Fold06.Rep06: alpha=0, lambda=1 
+ Fold07.Rep06: alpha=0, lambda=1 
- Fold07.Rep06: alpha=0, lambda=1 
+ Fold08.Rep06: alpha=0, lambda=1 
- Fold08.Rep06: alpha=0, lambda=1 
+ Fold09.Rep06: alpha=0, lambda=1 
- Fold09.Rep06: alpha=0, lambda=1 
+ Fold10.Rep06: alpha=0, lambda=1 
- Fold10.Rep06: alpha=0, lambda=1 
+ Fold01.Rep07: alpha=0, lambda=1 
- Fold01.Rep07: alpha=0, lambda=1 
+ Fold02.Rep07: alpha=0, lambda=1 
- Fold02.Rep07: alpha=0, lambda=1 
+ Fold03.Rep07: alpha=0, lambda=1 
- Fold03.Rep07: alpha=0, lambda=1 
+ Fold04.Rep07: alpha=0, lambda=1 
- Fold04.Rep07: alpha=0, lambda=1 
+ Fold05.Rep07: alpha=0, lambda=1 
- Fold05.Rep07: alpha=0, lambda=1 
+ Fold06.Rep07: alpha=0, lambda=1 
- Fold06.Rep07: alpha=0, lambda=1 
+ Fold07.Rep07: alpha=0, lambda=1 
- Fold07.Rep07: alpha=0, lambda=1 
+ Fold08.Rep07: alpha=0, lambda=1 
- Fold08.Rep07: alpha=0, lambda=1 
+ Fold09.Rep07: alpha=0, lambda=1 
- Fold09.Rep07: alpha=0, lambda=1 
+ Fold10.Rep07: alpha=0, lambda=1 
- Fold10.Rep07: alpha=0, lambda=1 
+ Fold01.Rep08: alpha=0, lambda=1 
- Fold01.Rep08: alpha=0, lambda=1 
+ Fold02.Rep08: alpha=0, lambda=1 
- Fold02.Rep08: alpha=0, lambda=1 
+ Fold03.Rep08: alpha=0, lambda=1 
- Fold03.Rep08: alpha=0, lambda=1 
+ Fold04.Rep08: alpha=0, lambda=1 
- Fold04.Rep08: alpha=0, lambda=1 
+ Fold05.Rep08: alpha=0, lambda=1 
- Fold05.Rep08: alpha=0, lambda=1 
+ Fold06.Rep08: alpha=0, lambda=1 
- Fold06.Rep08: alpha=0, lambda=1 
+ Fold07.Rep08: alpha=0, lambda=1 
- Fold07.Rep08: alpha=0, lambda=1 
+ Fold08.Rep08: alpha=0, lambda=1 
- Fold08.Rep08: alpha=0, lambda=1 
+ Fold09.Rep08: alpha=0, lambda=1 
- Fold09.Rep08: alpha=0, lambda=1 
+ Fold10.Rep08: alpha=0, lambda=1 
- Fold10.Rep08: alpha=0, lambda=1 
+ Fold01.Rep09: alpha=0, lambda=1 
- Fold01.Rep09: alpha=0, lambda=1 
+ Fold02.Rep09: alpha=0, lambda=1 
- Fold02.Rep09: alpha=0, lambda=1 
+ Fold03.Rep09: alpha=0, lambda=1 
- Fold03.Rep09: alpha=0, lambda=1 
+ Fold04.Rep09: alpha=0, lambda=1 
- Fold04.Rep09: alpha=0, lambda=1 
+ Fold05.Rep09: alpha=0, lambda=1 
- Fold05.Rep09: alpha=0, lambda=1 
+ Fold06.Rep09: alpha=0, lambda=1 
- Fold06.Rep09: alpha=0, lambda=1 
+ Fold07.Rep09: alpha=0, lambda=1 
- Fold07.Rep09: alpha=0, lambda=1 
+ Fold08.Rep09: alpha=0, lambda=1 
- Fold08.Rep09: alpha=0, lambda=1 
+ Fold09.Rep09: alpha=0, lambda=1 
- Fold09.Rep09: alpha=0, lambda=1 
+ Fold10.Rep09: alpha=0, lambda=1 
- Fold10.Rep09: alpha=0, lambda=1 
+ Fold01.Rep10: alpha=0, lambda=1 
- Fold01.Rep10: alpha=0, lambda=1 
+ Fold02.Rep10: alpha=0, lambda=1 
- Fold02.Rep10: alpha=0, lambda=1 
+ Fold03.Rep10: alpha=0, lambda=1 
- Fold03.Rep10: alpha=0, lambda=1 
+ Fold04.Rep10: alpha=0, lambda=1 
- Fold04.Rep10: alpha=0, lambda=1 
+ Fold05.Rep10: alpha=0, lambda=1 
- Fold05.Rep10: alpha=0, lambda=1 
+ Fold06.Rep10: alpha=0, lambda=1 
- Fold06.Rep10: alpha=0, lambda=1 
+ Fold07.Rep10: alpha=0, lambda=1 
- Fold07.Rep10: alpha=0, lambda=1 
+ Fold08.Rep10: alpha=0, lambda=1 
- Fold08.Rep10: alpha=0, lambda=1 
+ Fold09.Rep10: alpha=0, lambda=1 
- Fold09.Rep10: alpha=0, lambda=1 
+ Fold10.Rep10: alpha=0, lambda=1 
- Fold10.Rep10: alpha=0, lambda=1 
Aggregating results
Selecting tuning parameters
Fitting alpha = 0, lambda = 1 on full training set
![](Project_Summary_files/figure-html/unnamed-chunk-11-1.png)<!-- -->![](Project_Summary_files/figure-html/unnamed-chunk-11-2.png)<!-- -->

### Lasso regression model
+ Fold01.Rep01: alpha=1, lambda=0.5 
- Fold01.Rep01: alpha=1, lambda=0.5 
+ Fold02.Rep01: alpha=1, lambda=0.5 
- Fold02.Rep01: alpha=1, lambda=0.5 
+ Fold03.Rep01: alpha=1, lambda=0.5 
- Fold03.Rep01: alpha=1, lambda=0.5 
+ Fold04.Rep01: alpha=1, lambda=0.5 
- Fold04.Rep01: alpha=1, lambda=0.5 
+ Fold05.Rep01: alpha=1, lambda=0.5 
- Fold05.Rep01: alpha=1, lambda=0.5 
+ Fold06.Rep01: alpha=1, lambda=0.5 
- Fold06.Rep01: alpha=1, lambda=0.5 
+ Fold07.Rep01: alpha=1, lambda=0.5 
- Fold07.Rep01: alpha=1, lambda=0.5 
+ Fold08.Rep01: alpha=1, lambda=0.5 
- Fold08.Rep01: alpha=1, lambda=0.5 
+ Fold09.Rep01: alpha=1, lambda=0.5 
- Fold09.Rep01: alpha=1, lambda=0.5 
+ Fold10.Rep01: alpha=1, lambda=0.5 
- Fold10.Rep01: alpha=1, lambda=0.5 
+ Fold01.Rep02: alpha=1, lambda=0.5 
- Fold01.Rep02: alpha=1, lambda=0.5 
+ Fold02.Rep02: alpha=1, lambda=0.5 
- Fold02.Rep02: alpha=1, lambda=0.5 
+ Fold03.Rep02: alpha=1, lambda=0.5 
- Fold03.Rep02: alpha=1, lambda=0.5 
+ Fold04.Rep02: alpha=1, lambda=0.5 
- Fold04.Rep02: alpha=1, lambda=0.5 
+ Fold05.Rep02: alpha=1, lambda=0.5 
- Fold05.Rep02: alpha=1, lambda=0.5 
+ Fold06.Rep02: alpha=1, lambda=0.5 
- Fold06.Rep02: alpha=1, lambda=0.5 
+ Fold07.Rep02: alpha=1, lambda=0.5 
- Fold07.Rep02: alpha=1, lambda=0.5 
+ Fold08.Rep02: alpha=1, lambda=0.5 
- Fold08.Rep02: alpha=1, lambda=0.5 
+ Fold09.Rep02: alpha=1, lambda=0.5 
- Fold09.Rep02: alpha=1, lambda=0.5 
+ Fold10.Rep02: alpha=1, lambda=0.5 
- Fold10.Rep02: alpha=1, lambda=0.5 
+ Fold01.Rep03: alpha=1, lambda=0.5 
- Fold01.Rep03: alpha=1, lambda=0.5 
+ Fold02.Rep03: alpha=1, lambda=0.5 
- Fold02.Rep03: alpha=1, lambda=0.5 
+ Fold03.Rep03: alpha=1, lambda=0.5 
- Fold03.Rep03: alpha=1, lambda=0.5 
+ Fold04.Rep03: alpha=1, lambda=0.5 
- Fold04.Rep03: alpha=1, lambda=0.5 
+ Fold05.Rep03: alpha=1, lambda=0.5 
- Fold05.Rep03: alpha=1, lambda=0.5 
+ Fold06.Rep03: alpha=1, lambda=0.5 
- Fold06.Rep03: alpha=1, lambda=0.5 
+ Fold07.Rep03: alpha=1, lambda=0.5 
- Fold07.Rep03: alpha=1, lambda=0.5 
+ Fold08.Rep03: alpha=1, lambda=0.5 
- Fold08.Rep03: alpha=1, lambda=0.5 
+ Fold09.Rep03: alpha=1, lambda=0.5 
- Fold09.Rep03: alpha=1, lambda=0.5 
+ Fold10.Rep03: alpha=1, lambda=0.5 
- Fold10.Rep03: alpha=1, lambda=0.5 
+ Fold01.Rep04: alpha=1, lambda=0.5 
- Fold01.Rep04: alpha=1, lambda=0.5 
+ Fold02.Rep04: alpha=1, lambda=0.5 
- Fold02.Rep04: alpha=1, lambda=0.5 
+ Fold03.Rep04: alpha=1, lambda=0.5 
- Fold03.Rep04: alpha=1, lambda=0.5 
+ Fold04.Rep04: alpha=1, lambda=0.5 
- Fold04.Rep04: alpha=1, lambda=0.5 
+ Fold05.Rep04: alpha=1, lambda=0.5 
- Fold05.Rep04: alpha=1, lambda=0.5 
+ Fold06.Rep04: alpha=1, lambda=0.5 
- Fold06.Rep04: alpha=1, lambda=0.5 
+ Fold07.Rep04: alpha=1, lambda=0.5 
- Fold07.Rep04: alpha=1, lambda=0.5 
+ Fold08.Rep04: alpha=1, lambda=0.5 
- Fold08.Rep04: alpha=1, lambda=0.5 
+ Fold09.Rep04: alpha=1, lambda=0.5 
- Fold09.Rep04: alpha=1, lambda=0.5 
+ Fold10.Rep04: alpha=1, lambda=0.5 
- Fold10.Rep04: alpha=1, lambda=0.5 
+ Fold01.Rep05: alpha=1, lambda=0.5 
- Fold01.Rep05: alpha=1, lambda=0.5 
+ Fold02.Rep05: alpha=1, lambda=0.5 
- Fold02.Rep05: alpha=1, lambda=0.5 
+ Fold03.Rep05: alpha=1, lambda=0.5 
- Fold03.Rep05: alpha=1, lambda=0.5 
+ Fold04.Rep05: alpha=1, lambda=0.5 
- Fold04.Rep05: alpha=1, lambda=0.5 
+ Fold05.Rep05: alpha=1, lambda=0.5 
- Fold05.Rep05: alpha=1, lambda=0.5 
+ Fold06.Rep05: alpha=1, lambda=0.5 
- Fold06.Rep05: alpha=1, lambda=0.5 
+ Fold07.Rep05: alpha=1, lambda=0.5 
- Fold07.Rep05: alpha=1, lambda=0.5 
+ Fold08.Rep05: alpha=1, lambda=0.5 
- Fold08.Rep05: alpha=1, lambda=0.5 
+ Fold09.Rep05: alpha=1, lambda=0.5 
- Fold09.Rep05: alpha=1, lambda=0.5 
+ Fold10.Rep05: alpha=1, lambda=0.5 
- Fold10.Rep05: alpha=1, lambda=0.5 
+ Fold01.Rep06: alpha=1, lambda=0.5 
- Fold01.Rep06: alpha=1, lambda=0.5 
+ Fold02.Rep06: alpha=1, lambda=0.5 
- Fold02.Rep06: alpha=1, lambda=0.5 
+ Fold03.Rep06: alpha=1, lambda=0.5 
- Fold03.Rep06: alpha=1, lambda=0.5 
+ Fold04.Rep06: alpha=1, lambda=0.5 
- Fold04.Rep06: alpha=1, lambda=0.5 
+ Fold05.Rep06: alpha=1, lambda=0.5 
- Fold05.Rep06: alpha=1, lambda=0.5 
+ Fold06.Rep06: alpha=1, lambda=0.5 
- Fold06.Rep06: alpha=1, lambda=0.5 
+ Fold07.Rep06: alpha=1, lambda=0.5 
- Fold07.Rep06: alpha=1, lambda=0.5 
+ Fold08.Rep06: alpha=1, lambda=0.5 
- Fold08.Rep06: alpha=1, lambda=0.5 
+ Fold09.Rep06: alpha=1, lambda=0.5 
- Fold09.Rep06: alpha=1, lambda=0.5 
+ Fold10.Rep06: alpha=1, lambda=0.5 
- Fold10.Rep06: alpha=1, lambda=0.5 
+ Fold01.Rep07: alpha=1, lambda=0.5 
- Fold01.Rep07: alpha=1, lambda=0.5 
+ Fold02.Rep07: alpha=1, lambda=0.5 
- Fold02.Rep07: alpha=1, lambda=0.5 
+ Fold03.Rep07: alpha=1, lambda=0.5 
- Fold03.Rep07: alpha=1, lambda=0.5 
+ Fold04.Rep07: alpha=1, lambda=0.5 
- Fold04.Rep07: alpha=1, lambda=0.5 
+ Fold05.Rep07: alpha=1, lambda=0.5 
- Fold05.Rep07: alpha=1, lambda=0.5 
+ Fold06.Rep07: alpha=1, lambda=0.5 
- Fold06.Rep07: alpha=1, lambda=0.5 
+ Fold07.Rep07: alpha=1, lambda=0.5 
- Fold07.Rep07: alpha=1, lambda=0.5 
+ Fold08.Rep07: alpha=1, lambda=0.5 
- Fold08.Rep07: alpha=1, lambda=0.5 
+ Fold09.Rep07: alpha=1, lambda=0.5 
- Fold09.Rep07: alpha=1, lambda=0.5 
+ Fold10.Rep07: alpha=1, lambda=0.5 
- Fold10.Rep07: alpha=1, lambda=0.5 
+ Fold01.Rep08: alpha=1, lambda=0.5 
- Fold01.Rep08: alpha=1, lambda=0.5 
+ Fold02.Rep08: alpha=1, lambda=0.5 
- Fold02.Rep08: alpha=1, lambda=0.5 
+ Fold03.Rep08: alpha=1, lambda=0.5 
- Fold03.Rep08: alpha=1, lambda=0.5 
+ Fold04.Rep08: alpha=1, lambda=0.5 
- Fold04.Rep08: alpha=1, lambda=0.5 
+ Fold05.Rep08: alpha=1, lambda=0.5 
- Fold05.Rep08: alpha=1, lambda=0.5 
+ Fold06.Rep08: alpha=1, lambda=0.5 
- Fold06.Rep08: alpha=1, lambda=0.5 
+ Fold07.Rep08: alpha=1, lambda=0.5 
- Fold07.Rep08: alpha=1, lambda=0.5 
+ Fold08.Rep08: alpha=1, lambda=0.5 
- Fold08.Rep08: alpha=1, lambda=0.5 
+ Fold09.Rep08: alpha=1, lambda=0.5 
- Fold09.Rep08: alpha=1, lambda=0.5 
+ Fold10.Rep08: alpha=1, lambda=0.5 
- Fold10.Rep08: alpha=1, lambda=0.5 
+ Fold01.Rep09: alpha=1, lambda=0.5 
- Fold01.Rep09: alpha=1, lambda=0.5 
+ Fold02.Rep09: alpha=1, lambda=0.5 
- Fold02.Rep09: alpha=1, lambda=0.5 
+ Fold03.Rep09: alpha=1, lambda=0.5 
- Fold03.Rep09: alpha=1, lambda=0.5 
+ Fold04.Rep09: alpha=1, lambda=0.5 
- Fold04.Rep09: alpha=1, lambda=0.5 
+ Fold05.Rep09: alpha=1, lambda=0.5 
- Fold05.Rep09: alpha=1, lambda=0.5 
+ Fold06.Rep09: alpha=1, lambda=0.5 
- Fold06.Rep09: alpha=1, lambda=0.5 
+ Fold07.Rep09: alpha=1, lambda=0.5 
- Fold07.Rep09: alpha=1, lambda=0.5 
+ Fold08.Rep09: alpha=1, lambda=0.5 
- Fold08.Rep09: alpha=1, lambda=0.5 
+ Fold09.Rep09: alpha=1, lambda=0.5 
- Fold09.Rep09: alpha=1, lambda=0.5 
+ Fold10.Rep09: alpha=1, lambda=0.5 
- Fold10.Rep09: alpha=1, lambda=0.5 
+ Fold01.Rep10: alpha=1, lambda=0.5 
- Fold01.Rep10: alpha=1, lambda=0.5 
+ Fold02.Rep10: alpha=1, lambda=0.5 
- Fold02.Rep10: alpha=1, lambda=0.5 
+ Fold03.Rep10: alpha=1, lambda=0.5 
- Fold03.Rep10: alpha=1, lambda=0.5 
+ Fold04.Rep10: alpha=1, lambda=0.5 
- Fold04.Rep10: alpha=1, lambda=0.5 
+ Fold05.Rep10: alpha=1, lambda=0.5 
- Fold05.Rep10: alpha=1, lambda=0.5 
+ Fold06.Rep10: alpha=1, lambda=0.5 
- Fold06.Rep10: alpha=1, lambda=0.5 
+ Fold07.Rep10: alpha=1, lambda=0.5 
- Fold07.Rep10: alpha=1, lambda=0.5 
+ Fold08.Rep10: alpha=1, lambda=0.5 
- Fold08.Rep10: alpha=1, lambda=0.5 
+ Fold09.Rep10: alpha=1, lambda=0.5 
- Fold09.Rep10: alpha=1, lambda=0.5 
+ Fold10.Rep10: alpha=1, lambda=0.5 
- Fold10.Rep10: alpha=1, lambda=0.5 
Aggregating results
Selecting tuning parameters
Fitting alpha = 1, lambda = 0.5 on full training set
![](Project_Summary_files/figure-html/unnamed-chunk-12-1.png)<!-- -->![](Project_Summary_files/figure-html/unnamed-chunk-12-2.png)<!-- -->

### Elastic net regression
+ Fold01.Rep01: alpha=0.0000, lambda=0.5 
- Fold01.Rep01: alpha=0.0000, lambda=0.5 
+ Fold01.Rep01: alpha=0.1111, lambda=0.5 
- Fold01.Rep01: alpha=0.1111, lambda=0.5 
+ Fold01.Rep01: alpha=0.2222, lambda=0.5 
- Fold01.Rep01: alpha=0.2222, lambda=0.5 
+ Fold01.Rep01: alpha=0.3333, lambda=0.5 
- Fold01.Rep01: alpha=0.3333, lambda=0.5 
+ Fold01.Rep01: alpha=0.4444, lambda=0.5 
- Fold01.Rep01: alpha=0.4444, lambda=0.5 
+ Fold01.Rep01: alpha=0.5556, lambda=0.5 
- Fold01.Rep01: alpha=0.5556, lambda=0.5 
+ Fold01.Rep01: alpha=0.6667, lambda=0.5 
- Fold01.Rep01: alpha=0.6667, lambda=0.5 
+ Fold01.Rep01: alpha=0.7778, lambda=0.5 
- Fold01.Rep01: alpha=0.7778, lambda=0.5 
+ Fold01.Rep01: alpha=0.8889, lambda=0.5 
- Fold01.Rep01: alpha=0.8889, lambda=0.5 
+ Fold01.Rep01: alpha=1.0000, lambda=0.5 
- Fold01.Rep01: alpha=1.0000, lambda=0.5 
+ Fold02.Rep01: alpha=0.0000, lambda=0.5 
- Fold02.Rep01: alpha=0.0000, lambda=0.5 
+ Fold02.Rep01: alpha=0.1111, lambda=0.5 
- Fold02.Rep01: alpha=0.1111, lambda=0.5 
+ Fold02.Rep01: alpha=0.2222, lambda=0.5 
- Fold02.Rep01: alpha=0.2222, lambda=0.5 
+ Fold02.Rep01: alpha=0.3333, lambda=0.5 
- Fold02.Rep01: alpha=0.3333, lambda=0.5 
+ Fold02.Rep01: alpha=0.4444, lambda=0.5 
- Fold02.Rep01: alpha=0.4444, lambda=0.5 
+ Fold02.Rep01: alpha=0.5556, lambda=0.5 
- Fold02.Rep01: alpha=0.5556, lambda=0.5 
+ Fold02.Rep01: alpha=0.6667, lambda=0.5 
- Fold02.Rep01: alpha=0.6667, lambda=0.5 
+ Fold02.Rep01: alpha=0.7778, lambda=0.5 
- Fold02.Rep01: alpha=0.7778, lambda=0.5 
+ Fold02.Rep01: alpha=0.8889, lambda=0.5 
- Fold02.Rep01: alpha=0.8889, lambda=0.5 
+ Fold02.Rep01: alpha=1.0000, lambda=0.5 
- Fold02.Rep01: alpha=1.0000, lambda=0.5 
+ Fold03.Rep01: alpha=0.0000, lambda=0.5 
- Fold03.Rep01: alpha=0.0000, lambda=0.5 
+ Fold03.Rep01: alpha=0.1111, lambda=0.5 
- Fold03.Rep01: alpha=0.1111, lambda=0.5 
+ Fold03.Rep01: alpha=0.2222, lambda=0.5 
- Fold03.Rep01: alpha=0.2222, lambda=0.5 
+ Fold03.Rep01: alpha=0.3333, lambda=0.5 
- Fold03.Rep01: alpha=0.3333, lambda=0.5 
+ Fold03.Rep01: alpha=0.4444, lambda=0.5 
- Fold03.Rep01: alpha=0.4444, lambda=0.5 
+ Fold03.Rep01: alpha=0.5556, lambda=0.5 
- Fold03.Rep01: alpha=0.5556, lambda=0.5 
+ Fold03.Rep01: alpha=0.6667, lambda=0.5 
- Fold03.Rep01: alpha=0.6667, lambda=0.5 
+ Fold03.Rep01: alpha=0.7778, lambda=0.5 
- Fold03.Rep01: alpha=0.7778, lambda=0.5 
+ Fold03.Rep01: alpha=0.8889, lambda=0.5 
- Fold03.Rep01: alpha=0.8889, lambda=0.5 
+ Fold03.Rep01: alpha=1.0000, lambda=0.5 
- Fold03.Rep01: alpha=1.0000, lambda=0.5 
+ Fold04.Rep01: alpha=0.0000, lambda=0.5 
- Fold04.Rep01: alpha=0.0000, lambda=0.5 
+ Fold04.Rep01: alpha=0.1111, lambda=0.5 
- Fold04.Rep01: alpha=0.1111, lambda=0.5 
+ Fold04.Rep01: alpha=0.2222, lambda=0.5 
- Fold04.Rep01: alpha=0.2222, lambda=0.5 
+ Fold04.Rep01: alpha=0.3333, lambda=0.5 
- Fold04.Rep01: alpha=0.3333, lambda=0.5 
+ Fold04.Rep01: alpha=0.4444, lambda=0.5 
- Fold04.Rep01: alpha=0.4444, lambda=0.5 
+ Fold04.Rep01: alpha=0.5556, lambda=0.5 
- Fold04.Rep01: alpha=0.5556, lambda=0.5 
+ Fold04.Rep01: alpha=0.6667, lambda=0.5 
- Fold04.Rep01: alpha=0.6667, lambda=0.5 
+ Fold04.Rep01: alpha=0.7778, lambda=0.5 
- Fold04.Rep01: alpha=0.7778, lambda=0.5 
+ Fold04.Rep01: alpha=0.8889, lambda=0.5 
- Fold04.Rep01: alpha=0.8889, lambda=0.5 
+ Fold04.Rep01: alpha=1.0000, lambda=0.5 
- Fold04.Rep01: alpha=1.0000, lambda=0.5 
+ Fold05.Rep01: alpha=0.0000, lambda=0.5 
- Fold05.Rep01: alpha=0.0000, lambda=0.5 
+ Fold05.Rep01: alpha=0.1111, lambda=0.5 
- Fold05.Rep01: alpha=0.1111, lambda=0.5 
+ Fold05.Rep01: alpha=0.2222, lambda=0.5 
- Fold05.Rep01: alpha=0.2222, lambda=0.5 
+ Fold05.Rep01: alpha=0.3333, lambda=0.5 
- Fold05.Rep01: alpha=0.3333, lambda=0.5 
+ Fold05.Rep01: alpha=0.4444, lambda=0.5 
- Fold05.Rep01: alpha=0.4444, lambda=0.5 
+ Fold05.Rep01: alpha=0.5556, lambda=0.5 
- Fold05.Rep01: alpha=0.5556, lambda=0.5 
+ Fold05.Rep01: alpha=0.6667, lambda=0.5 
- Fold05.Rep01: alpha=0.6667, lambda=0.5 
+ Fold05.Rep01: alpha=0.7778, lambda=0.5 
- Fold05.Rep01: alpha=0.7778, lambda=0.5 
+ Fold05.Rep01: alpha=0.8889, lambda=0.5 
- Fold05.Rep01: alpha=0.8889, lambda=0.5 
+ Fold05.Rep01: alpha=1.0000, lambda=0.5 
- Fold05.Rep01: alpha=1.0000, lambda=0.5 
+ Fold06.Rep01: alpha=0.0000, lambda=0.5 
- Fold06.Rep01: alpha=0.0000, lambda=0.5 
+ Fold06.Rep01: alpha=0.1111, lambda=0.5 
- Fold06.Rep01: alpha=0.1111, lambda=0.5 
+ Fold06.Rep01: alpha=0.2222, lambda=0.5 
- Fold06.Rep01: alpha=0.2222, lambda=0.5 
+ Fold06.Rep01: alpha=0.3333, lambda=0.5 
- Fold06.Rep01: alpha=0.3333, lambda=0.5 
+ Fold06.Rep01: alpha=0.4444, lambda=0.5 
- Fold06.Rep01: alpha=0.4444, lambda=0.5 
+ Fold06.Rep01: alpha=0.5556, lambda=0.5 
- Fold06.Rep01: alpha=0.5556, lambda=0.5 
+ Fold06.Rep01: alpha=0.6667, lambda=0.5 
- Fold06.Rep01: alpha=0.6667, lambda=0.5 
+ Fold06.Rep01: alpha=0.7778, lambda=0.5 
- Fold06.Rep01: alpha=0.7778, lambda=0.5 
+ Fold06.Rep01: alpha=0.8889, lambda=0.5 
- Fold06.Rep01: alpha=0.8889, lambda=0.5 
+ Fold06.Rep01: alpha=1.0000, lambda=0.5 
- Fold06.Rep01: alpha=1.0000, lambda=0.5 
+ Fold07.Rep01: alpha=0.0000, lambda=0.5 
- Fold07.Rep01: alpha=0.0000, lambda=0.5 
+ Fold07.Rep01: alpha=0.1111, lambda=0.5 
- Fold07.Rep01: alpha=0.1111, lambda=0.5 
+ Fold07.Rep01: alpha=0.2222, lambda=0.5 
- Fold07.Rep01: alpha=0.2222, lambda=0.5 
+ Fold07.Rep01: alpha=0.3333, lambda=0.5 
- Fold07.Rep01: alpha=0.3333, lambda=0.5 
+ Fold07.Rep01: alpha=0.4444, lambda=0.5 
- Fold07.Rep01: alpha=0.4444, lambda=0.5 
+ Fold07.Rep01: alpha=0.5556, lambda=0.5 
- Fold07.Rep01: alpha=0.5556, lambda=0.5 
+ Fold07.Rep01: alpha=0.6667, lambda=0.5 
- Fold07.Rep01: alpha=0.6667, lambda=0.5 
+ Fold07.Rep01: alpha=0.7778, lambda=0.5 
- Fold07.Rep01: alpha=0.7778, lambda=0.5 
+ Fold07.Rep01: alpha=0.8889, lambda=0.5 
- Fold07.Rep01: alpha=0.8889, lambda=0.5 
+ Fold07.Rep01: alpha=1.0000, lambda=0.5 
- Fold07.Rep01: alpha=1.0000, lambda=0.5 
+ Fold08.Rep01: alpha=0.0000, lambda=0.5 
- Fold08.Rep01: alpha=0.0000, lambda=0.5 
+ Fold08.Rep01: alpha=0.1111, lambda=0.5 
- Fold08.Rep01: alpha=0.1111, lambda=0.5 
+ Fold08.Rep01: alpha=0.2222, lambda=0.5 
- Fold08.Rep01: alpha=0.2222, lambda=0.5 
+ Fold08.Rep01: alpha=0.3333, lambda=0.5 
- Fold08.Rep01: alpha=0.3333, lambda=0.5 
+ Fold08.Rep01: alpha=0.4444, lambda=0.5 
- Fold08.Rep01: alpha=0.4444, lambda=0.5 
+ Fold08.Rep01: alpha=0.5556, lambda=0.5 
- Fold08.Rep01: alpha=0.5556, lambda=0.5 
+ Fold08.Rep01: alpha=0.6667, lambda=0.5 
- Fold08.Rep01: alpha=0.6667, lambda=0.5 
+ Fold08.Rep01: alpha=0.7778, lambda=0.5 
- Fold08.Rep01: alpha=0.7778, lambda=0.5 
+ Fold08.Rep01: alpha=0.8889, lambda=0.5 
- Fold08.Rep01: alpha=0.8889, lambda=0.5 
+ Fold08.Rep01: alpha=1.0000, lambda=0.5 
- Fold08.Rep01: alpha=1.0000, lambda=0.5 
+ Fold09.Rep01: alpha=0.0000, lambda=0.5 
- Fold09.Rep01: alpha=0.0000, lambda=0.5 
+ Fold09.Rep01: alpha=0.1111, lambda=0.5 
- Fold09.Rep01: alpha=0.1111, lambda=0.5 
+ Fold09.Rep01: alpha=0.2222, lambda=0.5 
- Fold09.Rep01: alpha=0.2222, lambda=0.5 
+ Fold09.Rep01: alpha=0.3333, lambda=0.5 
- Fold09.Rep01: alpha=0.3333, lambda=0.5 
+ Fold09.Rep01: alpha=0.4444, lambda=0.5 
- Fold09.Rep01: alpha=0.4444, lambda=0.5 
+ Fold09.Rep01: alpha=0.5556, lambda=0.5 
- Fold09.Rep01: alpha=0.5556, lambda=0.5 
+ Fold09.Rep01: alpha=0.6667, lambda=0.5 
- Fold09.Rep01: alpha=0.6667, lambda=0.5 
+ Fold09.Rep01: alpha=0.7778, lambda=0.5 
- Fold09.Rep01: alpha=0.7778, lambda=0.5 
+ Fold09.Rep01: alpha=0.8889, lambda=0.5 
- Fold09.Rep01: alpha=0.8889, lambda=0.5 
+ Fold09.Rep01: alpha=1.0000, lambda=0.5 
- Fold09.Rep01: alpha=1.0000, lambda=0.5 
+ Fold10.Rep01: alpha=0.0000, lambda=0.5 
- Fold10.Rep01: alpha=0.0000, lambda=0.5 
+ Fold10.Rep01: alpha=0.1111, lambda=0.5 
- Fold10.Rep01: alpha=0.1111, lambda=0.5 
+ Fold10.Rep01: alpha=0.2222, lambda=0.5 
- Fold10.Rep01: alpha=0.2222, lambda=0.5 
+ Fold10.Rep01: alpha=0.3333, lambda=0.5 
- Fold10.Rep01: alpha=0.3333, lambda=0.5 
+ Fold10.Rep01: alpha=0.4444, lambda=0.5 
- Fold10.Rep01: alpha=0.4444, lambda=0.5 
+ Fold10.Rep01: alpha=0.5556, lambda=0.5 
- Fold10.Rep01: alpha=0.5556, lambda=0.5 
+ Fold10.Rep01: alpha=0.6667, lambda=0.5 
- Fold10.Rep01: alpha=0.6667, lambda=0.5 
+ Fold10.Rep01: alpha=0.7778, lambda=0.5 
- Fold10.Rep01: alpha=0.7778, lambda=0.5 
+ Fold10.Rep01: alpha=0.8889, lambda=0.5 
- Fold10.Rep01: alpha=0.8889, lambda=0.5 
+ Fold10.Rep01: alpha=1.0000, lambda=0.5 
- Fold10.Rep01: alpha=1.0000, lambda=0.5 
+ Fold01.Rep02: alpha=0.0000, lambda=0.5 
- Fold01.Rep02: alpha=0.0000, lambda=0.5 
+ Fold01.Rep02: alpha=0.1111, lambda=0.5 
- Fold01.Rep02: alpha=0.1111, lambda=0.5 
+ Fold01.Rep02: alpha=0.2222, lambda=0.5 
- Fold01.Rep02: alpha=0.2222, lambda=0.5 
+ Fold01.Rep02: alpha=0.3333, lambda=0.5 
- Fold01.Rep02: alpha=0.3333, lambda=0.5 
+ Fold01.Rep02: alpha=0.4444, lambda=0.5 
- Fold01.Rep02: alpha=0.4444, lambda=0.5 
+ Fold01.Rep02: alpha=0.5556, lambda=0.5 
- Fold01.Rep02: alpha=0.5556, lambda=0.5 
+ Fold01.Rep02: alpha=0.6667, lambda=0.5 
- Fold01.Rep02: alpha=0.6667, lambda=0.5 
+ Fold01.Rep02: alpha=0.7778, lambda=0.5 
- Fold01.Rep02: alpha=0.7778, lambda=0.5 
+ Fold01.Rep02: alpha=0.8889, lambda=0.5 
- Fold01.Rep02: alpha=0.8889, lambda=0.5 
+ Fold01.Rep02: alpha=1.0000, lambda=0.5 
- Fold01.Rep02: alpha=1.0000, lambda=0.5 
+ Fold02.Rep02: alpha=0.0000, lambda=0.5 
- Fold02.Rep02: alpha=0.0000, lambda=0.5 
+ Fold02.Rep02: alpha=0.1111, lambda=0.5 
- Fold02.Rep02: alpha=0.1111, lambda=0.5 
+ Fold02.Rep02: alpha=0.2222, lambda=0.5 
- Fold02.Rep02: alpha=0.2222, lambda=0.5 
+ Fold02.Rep02: alpha=0.3333, lambda=0.5 
- Fold02.Rep02: alpha=0.3333, lambda=0.5 
+ Fold02.Rep02: alpha=0.4444, lambda=0.5 
- Fold02.Rep02: alpha=0.4444, lambda=0.5 
+ Fold02.Rep02: alpha=0.5556, lambda=0.5 
- Fold02.Rep02: alpha=0.5556, lambda=0.5 
+ Fold02.Rep02: alpha=0.6667, lambda=0.5 
- Fold02.Rep02: alpha=0.6667, lambda=0.5 
+ Fold02.Rep02: alpha=0.7778, lambda=0.5 
- Fold02.Rep02: alpha=0.7778, lambda=0.5 
+ Fold02.Rep02: alpha=0.8889, lambda=0.5 
- Fold02.Rep02: alpha=0.8889, lambda=0.5 
+ Fold02.Rep02: alpha=1.0000, lambda=0.5 
- Fold02.Rep02: alpha=1.0000, lambda=0.5 
+ Fold03.Rep02: alpha=0.0000, lambda=0.5 
- Fold03.Rep02: alpha=0.0000, lambda=0.5 
+ Fold03.Rep02: alpha=0.1111, lambda=0.5 
- Fold03.Rep02: alpha=0.1111, lambda=0.5 
+ Fold03.Rep02: alpha=0.2222, lambda=0.5 
- Fold03.Rep02: alpha=0.2222, lambda=0.5 
+ Fold03.Rep02: alpha=0.3333, lambda=0.5 
- Fold03.Rep02: alpha=0.3333, lambda=0.5 
+ Fold03.Rep02: alpha=0.4444, lambda=0.5 
- Fold03.Rep02: alpha=0.4444, lambda=0.5 
+ Fold03.Rep02: alpha=0.5556, lambda=0.5 
- Fold03.Rep02: alpha=0.5556, lambda=0.5 
+ Fold03.Rep02: alpha=0.6667, lambda=0.5 
- Fold03.Rep02: alpha=0.6667, lambda=0.5 
+ Fold03.Rep02: alpha=0.7778, lambda=0.5 
- Fold03.Rep02: alpha=0.7778, lambda=0.5 
+ Fold03.Rep02: alpha=0.8889, lambda=0.5 
- Fold03.Rep02: alpha=0.8889, lambda=0.5 
+ Fold03.Rep02: alpha=1.0000, lambda=0.5 
- Fold03.Rep02: alpha=1.0000, lambda=0.5 
+ Fold04.Rep02: alpha=0.0000, lambda=0.5 
- Fold04.Rep02: alpha=0.0000, lambda=0.5 
+ Fold04.Rep02: alpha=0.1111, lambda=0.5 
- Fold04.Rep02: alpha=0.1111, lambda=0.5 
+ Fold04.Rep02: alpha=0.2222, lambda=0.5 
- Fold04.Rep02: alpha=0.2222, lambda=0.5 
+ Fold04.Rep02: alpha=0.3333, lambda=0.5 
- Fold04.Rep02: alpha=0.3333, lambda=0.5 
+ Fold04.Rep02: alpha=0.4444, lambda=0.5 
- Fold04.Rep02: alpha=0.4444, lambda=0.5 
+ Fold04.Rep02: alpha=0.5556, lambda=0.5 
- Fold04.Rep02: alpha=0.5556, lambda=0.5 
+ Fold04.Rep02: alpha=0.6667, lambda=0.5 
- Fold04.Rep02: alpha=0.6667, lambda=0.5 
+ Fold04.Rep02: alpha=0.7778, lambda=0.5 
- Fold04.Rep02: alpha=0.7778, lambda=0.5 
+ Fold04.Rep02: alpha=0.8889, lambda=0.5 
- Fold04.Rep02: alpha=0.8889, lambda=0.5 
+ Fold04.Rep02: alpha=1.0000, lambda=0.5 
- Fold04.Rep02: alpha=1.0000, lambda=0.5 
+ Fold05.Rep02: alpha=0.0000, lambda=0.5 
- Fold05.Rep02: alpha=0.0000, lambda=0.5 
+ Fold05.Rep02: alpha=0.1111, lambda=0.5 
- Fold05.Rep02: alpha=0.1111, lambda=0.5 
+ Fold05.Rep02: alpha=0.2222, lambda=0.5 
- Fold05.Rep02: alpha=0.2222, lambda=0.5 
+ Fold05.Rep02: alpha=0.3333, lambda=0.5 
- Fold05.Rep02: alpha=0.3333, lambda=0.5 
+ Fold05.Rep02: alpha=0.4444, lambda=0.5 
- Fold05.Rep02: alpha=0.4444, lambda=0.5 
+ Fold05.Rep02: alpha=0.5556, lambda=0.5 
- Fold05.Rep02: alpha=0.5556, lambda=0.5 
+ Fold05.Rep02: alpha=0.6667, lambda=0.5 
- Fold05.Rep02: alpha=0.6667, lambda=0.5 
+ Fold05.Rep02: alpha=0.7778, lambda=0.5 
- Fold05.Rep02: alpha=0.7778, lambda=0.5 
+ Fold05.Rep02: alpha=0.8889, lambda=0.5 
- Fold05.Rep02: alpha=0.8889, lambda=0.5 
+ Fold05.Rep02: alpha=1.0000, lambda=0.5 
- Fold05.Rep02: alpha=1.0000, lambda=0.5 
+ Fold06.Rep02: alpha=0.0000, lambda=0.5 
- Fold06.Rep02: alpha=0.0000, lambda=0.5 
+ Fold06.Rep02: alpha=0.1111, lambda=0.5 
- Fold06.Rep02: alpha=0.1111, lambda=0.5 
+ Fold06.Rep02: alpha=0.2222, lambda=0.5 
- Fold06.Rep02: alpha=0.2222, lambda=0.5 
+ Fold06.Rep02: alpha=0.3333, lambda=0.5 
- Fold06.Rep02: alpha=0.3333, lambda=0.5 
+ Fold06.Rep02: alpha=0.4444, lambda=0.5 
- Fold06.Rep02: alpha=0.4444, lambda=0.5 
+ Fold06.Rep02: alpha=0.5556, lambda=0.5 
- Fold06.Rep02: alpha=0.5556, lambda=0.5 
+ Fold06.Rep02: alpha=0.6667, lambda=0.5 
- Fold06.Rep02: alpha=0.6667, lambda=0.5 
+ Fold06.Rep02: alpha=0.7778, lambda=0.5 
- Fold06.Rep02: alpha=0.7778, lambda=0.5 
+ Fold06.Rep02: alpha=0.8889, lambda=0.5 
- Fold06.Rep02: alpha=0.8889, lambda=0.5 
+ Fold06.Rep02: alpha=1.0000, lambda=0.5 
- Fold06.Rep02: alpha=1.0000, lambda=0.5 
+ Fold07.Rep02: alpha=0.0000, lambda=0.5 
- Fold07.Rep02: alpha=0.0000, lambda=0.5 
+ Fold07.Rep02: alpha=0.1111, lambda=0.5 
- Fold07.Rep02: alpha=0.1111, lambda=0.5 
+ Fold07.Rep02: alpha=0.2222, lambda=0.5 
- Fold07.Rep02: alpha=0.2222, lambda=0.5 
+ Fold07.Rep02: alpha=0.3333, lambda=0.5 
- Fold07.Rep02: alpha=0.3333, lambda=0.5 
+ Fold07.Rep02: alpha=0.4444, lambda=0.5 
- Fold07.Rep02: alpha=0.4444, lambda=0.5 
+ Fold07.Rep02: alpha=0.5556, lambda=0.5 
- Fold07.Rep02: alpha=0.5556, lambda=0.5 
+ Fold07.Rep02: alpha=0.6667, lambda=0.5 
- Fold07.Rep02: alpha=0.6667, lambda=0.5 
+ Fold07.Rep02: alpha=0.7778, lambda=0.5 
- Fold07.Rep02: alpha=0.7778, lambda=0.5 
+ Fold07.Rep02: alpha=0.8889, lambda=0.5 
- Fold07.Rep02: alpha=0.8889, lambda=0.5 
+ Fold07.Rep02: alpha=1.0000, lambda=0.5 
- Fold07.Rep02: alpha=1.0000, lambda=0.5 
+ Fold08.Rep02: alpha=0.0000, lambda=0.5 
- Fold08.Rep02: alpha=0.0000, lambda=0.5 
+ Fold08.Rep02: alpha=0.1111, lambda=0.5 
- Fold08.Rep02: alpha=0.1111, lambda=0.5 
+ Fold08.Rep02: alpha=0.2222, lambda=0.5 
- Fold08.Rep02: alpha=0.2222, lambda=0.5 
+ Fold08.Rep02: alpha=0.3333, lambda=0.5 
- Fold08.Rep02: alpha=0.3333, lambda=0.5 
+ Fold08.Rep02: alpha=0.4444, lambda=0.5 
- Fold08.Rep02: alpha=0.4444, lambda=0.5 
+ Fold08.Rep02: alpha=0.5556, lambda=0.5 
- Fold08.Rep02: alpha=0.5556, lambda=0.5 
+ Fold08.Rep02: alpha=0.6667, lambda=0.5 
- Fold08.Rep02: alpha=0.6667, lambda=0.5 
+ Fold08.Rep02: alpha=0.7778, lambda=0.5 
- Fold08.Rep02: alpha=0.7778, lambda=0.5 
+ Fold08.Rep02: alpha=0.8889, lambda=0.5 
- Fold08.Rep02: alpha=0.8889, lambda=0.5 
+ Fold08.Rep02: alpha=1.0000, lambda=0.5 
- Fold08.Rep02: alpha=1.0000, lambda=0.5 
+ Fold09.Rep02: alpha=0.0000, lambda=0.5 
- Fold09.Rep02: alpha=0.0000, lambda=0.5 
+ Fold09.Rep02: alpha=0.1111, lambda=0.5 
- Fold09.Rep02: alpha=0.1111, lambda=0.5 
+ Fold09.Rep02: alpha=0.2222, lambda=0.5 
- Fold09.Rep02: alpha=0.2222, lambda=0.5 
+ Fold09.Rep02: alpha=0.3333, lambda=0.5 
- Fold09.Rep02: alpha=0.3333, lambda=0.5 
+ Fold09.Rep02: alpha=0.4444, lambda=0.5 
- Fold09.Rep02: alpha=0.4444, lambda=0.5 
+ Fold09.Rep02: alpha=0.5556, lambda=0.5 
- Fold09.Rep02: alpha=0.5556, lambda=0.5 
+ Fold09.Rep02: alpha=0.6667, lambda=0.5 
- Fold09.Rep02: alpha=0.6667, lambda=0.5 
+ Fold09.Rep02: alpha=0.7778, lambda=0.5 
- Fold09.Rep02: alpha=0.7778, lambda=0.5 
+ Fold09.Rep02: alpha=0.8889, lambda=0.5 
- Fold09.Rep02: alpha=0.8889, lambda=0.5 
+ Fold09.Rep02: alpha=1.0000, lambda=0.5 
- Fold09.Rep02: alpha=1.0000, lambda=0.5 
+ Fold10.Rep02: alpha=0.0000, lambda=0.5 
- Fold10.Rep02: alpha=0.0000, lambda=0.5 
+ Fold10.Rep02: alpha=0.1111, lambda=0.5 
- Fold10.Rep02: alpha=0.1111, lambda=0.5 
+ Fold10.Rep02: alpha=0.2222, lambda=0.5 
- Fold10.Rep02: alpha=0.2222, lambda=0.5 
+ Fold10.Rep02: alpha=0.3333, lambda=0.5 
- Fold10.Rep02: alpha=0.3333, lambda=0.5 
+ Fold10.Rep02: alpha=0.4444, lambda=0.5 
- Fold10.Rep02: alpha=0.4444, lambda=0.5 
+ Fold10.Rep02: alpha=0.5556, lambda=0.5 
- Fold10.Rep02: alpha=0.5556, lambda=0.5 
+ Fold10.Rep02: alpha=0.6667, lambda=0.5 
- Fold10.Rep02: alpha=0.6667, lambda=0.5 
+ Fold10.Rep02: alpha=0.7778, lambda=0.5 
- Fold10.Rep02: alpha=0.7778, lambda=0.5 
+ Fold10.Rep02: alpha=0.8889, lambda=0.5 
- Fold10.Rep02: alpha=0.8889, lambda=0.5 
+ Fold10.Rep02: alpha=1.0000, lambda=0.5 
- Fold10.Rep02: alpha=1.0000, lambda=0.5 
+ Fold01.Rep03: alpha=0.0000, lambda=0.5 
- Fold01.Rep03: alpha=0.0000, lambda=0.5 
+ Fold01.Rep03: alpha=0.1111, lambda=0.5 
- Fold01.Rep03: alpha=0.1111, lambda=0.5 
+ Fold01.Rep03: alpha=0.2222, lambda=0.5 
- Fold01.Rep03: alpha=0.2222, lambda=0.5 
+ Fold01.Rep03: alpha=0.3333, lambda=0.5 
- Fold01.Rep03: alpha=0.3333, lambda=0.5 
+ Fold01.Rep03: alpha=0.4444, lambda=0.5 
- Fold01.Rep03: alpha=0.4444, lambda=0.5 
+ Fold01.Rep03: alpha=0.5556, lambda=0.5 
- Fold01.Rep03: alpha=0.5556, lambda=0.5 
+ Fold01.Rep03: alpha=0.6667, lambda=0.5 
- Fold01.Rep03: alpha=0.6667, lambda=0.5 
+ Fold01.Rep03: alpha=0.7778, lambda=0.5 
- Fold01.Rep03: alpha=0.7778, lambda=0.5 
+ Fold01.Rep03: alpha=0.8889, lambda=0.5 
- Fold01.Rep03: alpha=0.8889, lambda=0.5 
+ Fold01.Rep03: alpha=1.0000, lambda=0.5 
- Fold01.Rep03: alpha=1.0000, lambda=0.5 
+ Fold02.Rep03: alpha=0.0000, lambda=0.5 
- Fold02.Rep03: alpha=0.0000, lambda=0.5 
+ Fold02.Rep03: alpha=0.1111, lambda=0.5 
- Fold02.Rep03: alpha=0.1111, lambda=0.5 
+ Fold02.Rep03: alpha=0.2222, lambda=0.5 
- Fold02.Rep03: alpha=0.2222, lambda=0.5 
+ Fold02.Rep03: alpha=0.3333, lambda=0.5 
- Fold02.Rep03: alpha=0.3333, lambda=0.5 
+ Fold02.Rep03: alpha=0.4444, lambda=0.5 
- Fold02.Rep03: alpha=0.4444, lambda=0.5 
+ Fold02.Rep03: alpha=0.5556, lambda=0.5 
- Fold02.Rep03: alpha=0.5556, lambda=0.5 
+ Fold02.Rep03: alpha=0.6667, lambda=0.5 
- Fold02.Rep03: alpha=0.6667, lambda=0.5 
+ Fold02.Rep03: alpha=0.7778, lambda=0.5 
- Fold02.Rep03: alpha=0.7778, lambda=0.5 
+ Fold02.Rep03: alpha=0.8889, lambda=0.5 
- Fold02.Rep03: alpha=0.8889, lambda=0.5 
+ Fold02.Rep03: alpha=1.0000, lambda=0.5 
- Fold02.Rep03: alpha=1.0000, lambda=0.5 
+ Fold03.Rep03: alpha=0.0000, lambda=0.5 
- Fold03.Rep03: alpha=0.0000, lambda=0.5 
+ Fold03.Rep03: alpha=0.1111, lambda=0.5 
- Fold03.Rep03: alpha=0.1111, lambda=0.5 
+ Fold03.Rep03: alpha=0.2222, lambda=0.5 
- Fold03.Rep03: alpha=0.2222, lambda=0.5 
+ Fold03.Rep03: alpha=0.3333, lambda=0.5 
- Fold03.Rep03: alpha=0.3333, lambda=0.5 
+ Fold03.Rep03: alpha=0.4444, lambda=0.5 
- Fold03.Rep03: alpha=0.4444, lambda=0.5 
+ Fold03.Rep03: alpha=0.5556, lambda=0.5 
- Fold03.Rep03: alpha=0.5556, lambda=0.5 
+ Fold03.Rep03: alpha=0.6667, lambda=0.5 
- Fold03.Rep03: alpha=0.6667, lambda=0.5 
+ Fold03.Rep03: alpha=0.7778, lambda=0.5 
- Fold03.Rep03: alpha=0.7778, lambda=0.5 
+ Fold03.Rep03: alpha=0.8889, lambda=0.5 
- Fold03.Rep03: alpha=0.8889, lambda=0.5 
+ Fold03.Rep03: alpha=1.0000, lambda=0.5 
- Fold03.Rep03: alpha=1.0000, lambda=0.5 
+ Fold04.Rep03: alpha=0.0000, lambda=0.5 
- Fold04.Rep03: alpha=0.0000, lambda=0.5 
+ Fold04.Rep03: alpha=0.1111, lambda=0.5 
- Fold04.Rep03: alpha=0.1111, lambda=0.5 
+ Fold04.Rep03: alpha=0.2222, lambda=0.5 
- Fold04.Rep03: alpha=0.2222, lambda=0.5 
+ Fold04.Rep03: alpha=0.3333, lambda=0.5 
- Fold04.Rep03: alpha=0.3333, lambda=0.5 
+ Fold04.Rep03: alpha=0.4444, lambda=0.5 
- Fold04.Rep03: alpha=0.4444, lambda=0.5 
+ Fold04.Rep03: alpha=0.5556, lambda=0.5 
- Fold04.Rep03: alpha=0.5556, lambda=0.5 
+ Fold04.Rep03: alpha=0.6667, lambda=0.5 
- Fold04.Rep03: alpha=0.6667, lambda=0.5 
+ Fold04.Rep03: alpha=0.7778, lambda=0.5 
- Fold04.Rep03: alpha=0.7778, lambda=0.5 
+ Fold04.Rep03: alpha=0.8889, lambda=0.5 
- Fold04.Rep03: alpha=0.8889, lambda=0.5 
+ Fold04.Rep03: alpha=1.0000, lambda=0.5 
- Fold04.Rep03: alpha=1.0000, lambda=0.5 
+ Fold05.Rep03: alpha=0.0000, lambda=0.5 
- Fold05.Rep03: alpha=0.0000, lambda=0.5 
+ Fold05.Rep03: alpha=0.1111, lambda=0.5 
- Fold05.Rep03: alpha=0.1111, lambda=0.5 
+ Fold05.Rep03: alpha=0.2222, lambda=0.5 
- Fold05.Rep03: alpha=0.2222, lambda=0.5 
+ Fold05.Rep03: alpha=0.3333, lambda=0.5 
- Fold05.Rep03: alpha=0.3333, lambda=0.5 
+ Fold05.Rep03: alpha=0.4444, lambda=0.5 
- Fold05.Rep03: alpha=0.4444, lambda=0.5 
+ Fold05.Rep03: alpha=0.5556, lambda=0.5 
- Fold05.Rep03: alpha=0.5556, lambda=0.5 
+ Fold05.Rep03: alpha=0.6667, lambda=0.5 
- Fold05.Rep03: alpha=0.6667, lambda=0.5 
+ Fold05.Rep03: alpha=0.7778, lambda=0.5 
- Fold05.Rep03: alpha=0.7778, lambda=0.5 
+ Fold05.Rep03: alpha=0.8889, lambda=0.5 
- Fold05.Rep03: alpha=0.8889, lambda=0.5 
+ Fold05.Rep03: alpha=1.0000, lambda=0.5 
- Fold05.Rep03: alpha=1.0000, lambda=0.5 
+ Fold06.Rep03: alpha=0.0000, lambda=0.5 
- Fold06.Rep03: alpha=0.0000, lambda=0.5 
+ Fold06.Rep03: alpha=0.1111, lambda=0.5 
- Fold06.Rep03: alpha=0.1111, lambda=0.5 
+ Fold06.Rep03: alpha=0.2222, lambda=0.5 
- Fold06.Rep03: alpha=0.2222, lambda=0.5 
+ Fold06.Rep03: alpha=0.3333, lambda=0.5 
- Fold06.Rep03: alpha=0.3333, lambda=0.5 
+ Fold06.Rep03: alpha=0.4444, lambda=0.5 
- Fold06.Rep03: alpha=0.4444, lambda=0.5 
+ Fold06.Rep03: alpha=0.5556, lambda=0.5 
- Fold06.Rep03: alpha=0.5556, lambda=0.5 
+ Fold06.Rep03: alpha=0.6667, lambda=0.5 
- Fold06.Rep03: alpha=0.6667, lambda=0.5 
+ Fold06.Rep03: alpha=0.7778, lambda=0.5 
- Fold06.Rep03: alpha=0.7778, lambda=0.5 
+ Fold06.Rep03: alpha=0.8889, lambda=0.5 
- Fold06.Rep03: alpha=0.8889, lambda=0.5 
+ Fold06.Rep03: alpha=1.0000, lambda=0.5 
- Fold06.Rep03: alpha=1.0000, lambda=0.5 
+ Fold07.Rep03: alpha=0.0000, lambda=0.5 
- Fold07.Rep03: alpha=0.0000, lambda=0.5 
+ Fold07.Rep03: alpha=0.1111, lambda=0.5 
- Fold07.Rep03: alpha=0.1111, lambda=0.5 
+ Fold07.Rep03: alpha=0.2222, lambda=0.5 
- Fold07.Rep03: alpha=0.2222, lambda=0.5 
+ Fold07.Rep03: alpha=0.3333, lambda=0.5 
- Fold07.Rep03: alpha=0.3333, lambda=0.5 
+ Fold07.Rep03: alpha=0.4444, lambda=0.5 
- Fold07.Rep03: alpha=0.4444, lambda=0.5 
+ Fold07.Rep03: alpha=0.5556, lambda=0.5 
- Fold07.Rep03: alpha=0.5556, lambda=0.5 
+ Fold07.Rep03: alpha=0.6667, lambda=0.5 
- Fold07.Rep03: alpha=0.6667, lambda=0.5 
+ Fold07.Rep03: alpha=0.7778, lambda=0.5 
- Fold07.Rep03: alpha=0.7778, lambda=0.5 
+ Fold07.Rep03: alpha=0.8889, lambda=0.5 
- Fold07.Rep03: alpha=0.8889, lambda=0.5 
+ Fold07.Rep03: alpha=1.0000, lambda=0.5 
- Fold07.Rep03: alpha=1.0000, lambda=0.5 
+ Fold08.Rep03: alpha=0.0000, lambda=0.5 
- Fold08.Rep03: alpha=0.0000, lambda=0.5 
+ Fold08.Rep03: alpha=0.1111, lambda=0.5 
- Fold08.Rep03: alpha=0.1111, lambda=0.5 
+ Fold08.Rep03: alpha=0.2222, lambda=0.5 
- Fold08.Rep03: alpha=0.2222, lambda=0.5 
+ Fold08.Rep03: alpha=0.3333, lambda=0.5 
- Fold08.Rep03: alpha=0.3333, lambda=0.5 
+ Fold08.Rep03: alpha=0.4444, lambda=0.5 
- Fold08.Rep03: alpha=0.4444, lambda=0.5 
+ Fold08.Rep03: alpha=0.5556, lambda=0.5 
- Fold08.Rep03: alpha=0.5556, lambda=0.5 
+ Fold08.Rep03: alpha=0.6667, lambda=0.5 
- Fold08.Rep03: alpha=0.6667, lambda=0.5 
+ Fold08.Rep03: alpha=0.7778, lambda=0.5 
- Fold08.Rep03: alpha=0.7778, lambda=0.5 
+ Fold08.Rep03: alpha=0.8889, lambda=0.5 
- Fold08.Rep03: alpha=0.8889, lambda=0.5 
+ Fold08.Rep03: alpha=1.0000, lambda=0.5 
- Fold08.Rep03: alpha=1.0000, lambda=0.5 
+ Fold09.Rep03: alpha=0.0000, lambda=0.5 
- Fold09.Rep03: alpha=0.0000, lambda=0.5 
+ Fold09.Rep03: alpha=0.1111, lambda=0.5 
- Fold09.Rep03: alpha=0.1111, lambda=0.5 
+ Fold09.Rep03: alpha=0.2222, lambda=0.5 
- Fold09.Rep03: alpha=0.2222, lambda=0.5 
+ Fold09.Rep03: alpha=0.3333, lambda=0.5 
- Fold09.Rep03: alpha=0.3333, lambda=0.5 
+ Fold09.Rep03: alpha=0.4444, lambda=0.5 
- Fold09.Rep03: alpha=0.4444, lambda=0.5 
+ Fold09.Rep03: alpha=0.5556, lambda=0.5 
- Fold09.Rep03: alpha=0.5556, lambda=0.5 
+ Fold09.Rep03: alpha=0.6667, lambda=0.5 
- Fold09.Rep03: alpha=0.6667, lambda=0.5 
+ Fold09.Rep03: alpha=0.7778, lambda=0.5 
- Fold09.Rep03: alpha=0.7778, lambda=0.5 
+ Fold09.Rep03: alpha=0.8889, lambda=0.5 
- Fold09.Rep03: alpha=0.8889, lambda=0.5 
+ Fold09.Rep03: alpha=1.0000, lambda=0.5 
- Fold09.Rep03: alpha=1.0000, lambda=0.5 
+ Fold10.Rep03: alpha=0.0000, lambda=0.5 
- Fold10.Rep03: alpha=0.0000, lambda=0.5 
+ Fold10.Rep03: alpha=0.1111, lambda=0.5 
- Fold10.Rep03: alpha=0.1111, lambda=0.5 
+ Fold10.Rep03: alpha=0.2222, lambda=0.5 
- Fold10.Rep03: alpha=0.2222, lambda=0.5 
+ Fold10.Rep03: alpha=0.3333, lambda=0.5 
- Fold10.Rep03: alpha=0.3333, lambda=0.5 
+ Fold10.Rep03: alpha=0.4444, lambda=0.5 
- Fold10.Rep03: alpha=0.4444, lambda=0.5 
+ Fold10.Rep03: alpha=0.5556, lambda=0.5 
- Fold10.Rep03: alpha=0.5556, lambda=0.5 
+ Fold10.Rep03: alpha=0.6667, lambda=0.5 
- Fold10.Rep03: alpha=0.6667, lambda=0.5 
+ Fold10.Rep03: alpha=0.7778, lambda=0.5 
- Fold10.Rep03: alpha=0.7778, lambda=0.5 
+ Fold10.Rep03: alpha=0.8889, lambda=0.5 
- Fold10.Rep03: alpha=0.8889, lambda=0.5 
+ Fold10.Rep03: alpha=1.0000, lambda=0.5 
- Fold10.Rep03: alpha=1.0000, lambda=0.5 
+ Fold01.Rep04: alpha=0.0000, lambda=0.5 
- Fold01.Rep04: alpha=0.0000, lambda=0.5 
+ Fold01.Rep04: alpha=0.1111, lambda=0.5 
- Fold01.Rep04: alpha=0.1111, lambda=0.5 
+ Fold01.Rep04: alpha=0.2222, lambda=0.5 
- Fold01.Rep04: alpha=0.2222, lambda=0.5 
+ Fold01.Rep04: alpha=0.3333, lambda=0.5 
- Fold01.Rep04: alpha=0.3333, lambda=0.5 
+ Fold01.Rep04: alpha=0.4444, lambda=0.5 
- Fold01.Rep04: alpha=0.4444, lambda=0.5 
+ Fold01.Rep04: alpha=0.5556, lambda=0.5 
- Fold01.Rep04: alpha=0.5556, lambda=0.5 
+ Fold01.Rep04: alpha=0.6667, lambda=0.5 
- Fold01.Rep04: alpha=0.6667, lambda=0.5 
+ Fold01.Rep04: alpha=0.7778, lambda=0.5 
- Fold01.Rep04: alpha=0.7778, lambda=0.5 
+ Fold01.Rep04: alpha=0.8889, lambda=0.5 
- Fold01.Rep04: alpha=0.8889, lambda=0.5 
+ Fold01.Rep04: alpha=1.0000, lambda=0.5 
- Fold01.Rep04: alpha=1.0000, lambda=0.5 
+ Fold02.Rep04: alpha=0.0000, lambda=0.5 
- Fold02.Rep04: alpha=0.0000, lambda=0.5 
+ Fold02.Rep04: alpha=0.1111, lambda=0.5 
- Fold02.Rep04: alpha=0.1111, lambda=0.5 
+ Fold02.Rep04: alpha=0.2222, lambda=0.5 
- Fold02.Rep04: alpha=0.2222, lambda=0.5 
+ Fold02.Rep04: alpha=0.3333, lambda=0.5 
- Fold02.Rep04: alpha=0.3333, lambda=0.5 
+ Fold02.Rep04: alpha=0.4444, lambda=0.5 
- Fold02.Rep04: alpha=0.4444, lambda=0.5 
+ Fold02.Rep04: alpha=0.5556, lambda=0.5 
- Fold02.Rep04: alpha=0.5556, lambda=0.5 
+ Fold02.Rep04: alpha=0.6667, lambda=0.5 
- Fold02.Rep04: alpha=0.6667, lambda=0.5 
+ Fold02.Rep04: alpha=0.7778, lambda=0.5 
- Fold02.Rep04: alpha=0.7778, lambda=0.5 
+ Fold02.Rep04: alpha=0.8889, lambda=0.5 
- Fold02.Rep04: alpha=0.8889, lambda=0.5 
+ Fold02.Rep04: alpha=1.0000, lambda=0.5 
- Fold02.Rep04: alpha=1.0000, lambda=0.5 
+ Fold03.Rep04: alpha=0.0000, lambda=0.5 
- Fold03.Rep04: alpha=0.0000, lambda=0.5 
+ Fold03.Rep04: alpha=0.1111, lambda=0.5 
- Fold03.Rep04: alpha=0.1111, lambda=0.5 
+ Fold03.Rep04: alpha=0.2222, lambda=0.5 
- Fold03.Rep04: alpha=0.2222, lambda=0.5 
+ Fold03.Rep04: alpha=0.3333, lambda=0.5 
- Fold03.Rep04: alpha=0.3333, lambda=0.5 
+ Fold03.Rep04: alpha=0.4444, lambda=0.5 
- Fold03.Rep04: alpha=0.4444, lambda=0.5 
+ Fold03.Rep04: alpha=0.5556, lambda=0.5 
- Fold03.Rep04: alpha=0.5556, lambda=0.5 
+ Fold03.Rep04: alpha=0.6667, lambda=0.5 
- Fold03.Rep04: alpha=0.6667, lambda=0.5 
+ Fold03.Rep04: alpha=0.7778, lambda=0.5 
- Fold03.Rep04: alpha=0.7778, lambda=0.5 
+ Fold03.Rep04: alpha=0.8889, lambda=0.5 
- Fold03.Rep04: alpha=0.8889, lambda=0.5 
+ Fold03.Rep04: alpha=1.0000, lambda=0.5 
- Fold03.Rep04: alpha=1.0000, lambda=0.5 
+ Fold04.Rep04: alpha=0.0000, lambda=0.5 
- Fold04.Rep04: alpha=0.0000, lambda=0.5 
+ Fold04.Rep04: alpha=0.1111, lambda=0.5 
- Fold04.Rep04: alpha=0.1111, lambda=0.5 
+ Fold04.Rep04: alpha=0.2222, lambda=0.5 
- Fold04.Rep04: alpha=0.2222, lambda=0.5 
+ Fold04.Rep04: alpha=0.3333, lambda=0.5 
- Fold04.Rep04: alpha=0.3333, lambda=0.5 
+ Fold04.Rep04: alpha=0.4444, lambda=0.5 
- Fold04.Rep04: alpha=0.4444, lambda=0.5 
+ Fold04.Rep04: alpha=0.5556, lambda=0.5 
- Fold04.Rep04: alpha=0.5556, lambda=0.5 
+ Fold04.Rep04: alpha=0.6667, lambda=0.5 
- Fold04.Rep04: alpha=0.6667, lambda=0.5 
+ Fold04.Rep04: alpha=0.7778, lambda=0.5 
- Fold04.Rep04: alpha=0.7778, lambda=0.5 
+ Fold04.Rep04: alpha=0.8889, lambda=0.5 
- Fold04.Rep04: alpha=0.8889, lambda=0.5 
+ Fold04.Rep04: alpha=1.0000, lambda=0.5 
- Fold04.Rep04: alpha=1.0000, lambda=0.5 
+ Fold05.Rep04: alpha=0.0000, lambda=0.5 
- Fold05.Rep04: alpha=0.0000, lambda=0.5 
+ Fold05.Rep04: alpha=0.1111, lambda=0.5 
- Fold05.Rep04: alpha=0.1111, lambda=0.5 
+ Fold05.Rep04: alpha=0.2222, lambda=0.5 
- Fold05.Rep04: alpha=0.2222, lambda=0.5 
+ Fold05.Rep04: alpha=0.3333, lambda=0.5 
- Fold05.Rep04: alpha=0.3333, lambda=0.5 
+ Fold05.Rep04: alpha=0.4444, lambda=0.5 
- Fold05.Rep04: alpha=0.4444, lambda=0.5 
+ Fold05.Rep04: alpha=0.5556, lambda=0.5 
- Fold05.Rep04: alpha=0.5556, lambda=0.5 
+ Fold05.Rep04: alpha=0.6667, lambda=0.5 
- Fold05.Rep04: alpha=0.6667, lambda=0.5 
+ Fold05.Rep04: alpha=0.7778, lambda=0.5 
- Fold05.Rep04: alpha=0.7778, lambda=0.5 
+ Fold05.Rep04: alpha=0.8889, lambda=0.5 
- Fold05.Rep04: alpha=0.8889, lambda=0.5 
+ Fold05.Rep04: alpha=1.0000, lambda=0.5 
- Fold05.Rep04: alpha=1.0000, lambda=0.5 
+ Fold06.Rep04: alpha=0.0000, lambda=0.5 
- Fold06.Rep04: alpha=0.0000, lambda=0.5 
+ Fold06.Rep04: alpha=0.1111, lambda=0.5 
- Fold06.Rep04: alpha=0.1111, lambda=0.5 
+ Fold06.Rep04: alpha=0.2222, lambda=0.5 
- Fold06.Rep04: alpha=0.2222, lambda=0.5 
+ Fold06.Rep04: alpha=0.3333, lambda=0.5 
- Fold06.Rep04: alpha=0.3333, lambda=0.5 
+ Fold06.Rep04: alpha=0.4444, lambda=0.5 
- Fold06.Rep04: alpha=0.4444, lambda=0.5 
+ Fold06.Rep04: alpha=0.5556, lambda=0.5 
- Fold06.Rep04: alpha=0.5556, lambda=0.5 
+ Fold06.Rep04: alpha=0.6667, lambda=0.5 
- Fold06.Rep04: alpha=0.6667, lambda=0.5 
+ Fold06.Rep04: alpha=0.7778, lambda=0.5 
- Fold06.Rep04: alpha=0.7778, lambda=0.5 
+ Fold06.Rep04: alpha=0.8889, lambda=0.5 
- Fold06.Rep04: alpha=0.8889, lambda=0.5 
+ Fold06.Rep04: alpha=1.0000, lambda=0.5 
- Fold06.Rep04: alpha=1.0000, lambda=0.5 
+ Fold07.Rep04: alpha=0.0000, lambda=0.5 
- Fold07.Rep04: alpha=0.0000, lambda=0.5 
+ Fold07.Rep04: alpha=0.1111, lambda=0.5 
- Fold07.Rep04: alpha=0.1111, lambda=0.5 
+ Fold07.Rep04: alpha=0.2222, lambda=0.5 
- Fold07.Rep04: alpha=0.2222, lambda=0.5 
+ Fold07.Rep04: alpha=0.3333, lambda=0.5 
- Fold07.Rep04: alpha=0.3333, lambda=0.5 
+ Fold07.Rep04: alpha=0.4444, lambda=0.5 
- Fold07.Rep04: alpha=0.4444, lambda=0.5 
+ Fold07.Rep04: alpha=0.5556, lambda=0.5 
- Fold07.Rep04: alpha=0.5556, lambda=0.5 
+ Fold07.Rep04: alpha=0.6667, lambda=0.5 
- Fold07.Rep04: alpha=0.6667, lambda=0.5 
+ Fold07.Rep04: alpha=0.7778, lambda=0.5 
- Fold07.Rep04: alpha=0.7778, lambda=0.5 
+ Fold07.Rep04: alpha=0.8889, lambda=0.5 
- Fold07.Rep04: alpha=0.8889, lambda=0.5 
+ Fold07.Rep04: alpha=1.0000, lambda=0.5 
- Fold07.Rep04: alpha=1.0000, lambda=0.5 
+ Fold08.Rep04: alpha=0.0000, lambda=0.5 
- Fold08.Rep04: alpha=0.0000, lambda=0.5 
+ Fold08.Rep04: alpha=0.1111, lambda=0.5 
- Fold08.Rep04: alpha=0.1111, lambda=0.5 
+ Fold08.Rep04: alpha=0.2222, lambda=0.5 
- Fold08.Rep04: alpha=0.2222, lambda=0.5 
+ Fold08.Rep04: alpha=0.3333, lambda=0.5 
- Fold08.Rep04: alpha=0.3333, lambda=0.5 
+ Fold08.Rep04: alpha=0.4444, lambda=0.5 
- Fold08.Rep04: alpha=0.4444, lambda=0.5 
+ Fold08.Rep04: alpha=0.5556, lambda=0.5 
- Fold08.Rep04: alpha=0.5556, lambda=0.5 
+ Fold08.Rep04: alpha=0.6667, lambda=0.5 
- Fold08.Rep04: alpha=0.6667, lambda=0.5 
+ Fold08.Rep04: alpha=0.7778, lambda=0.5 
- Fold08.Rep04: alpha=0.7778, lambda=0.5 
+ Fold08.Rep04: alpha=0.8889, lambda=0.5 
- Fold08.Rep04: alpha=0.8889, lambda=0.5 
+ Fold08.Rep04: alpha=1.0000, lambda=0.5 
- Fold08.Rep04: alpha=1.0000, lambda=0.5 
+ Fold09.Rep04: alpha=0.0000, lambda=0.5 
- Fold09.Rep04: alpha=0.0000, lambda=0.5 
+ Fold09.Rep04: alpha=0.1111, lambda=0.5 
- Fold09.Rep04: alpha=0.1111, lambda=0.5 
+ Fold09.Rep04: alpha=0.2222, lambda=0.5 
- Fold09.Rep04: alpha=0.2222, lambda=0.5 
+ Fold09.Rep04: alpha=0.3333, lambda=0.5 
- Fold09.Rep04: alpha=0.3333, lambda=0.5 
+ Fold09.Rep04: alpha=0.4444, lambda=0.5 
- Fold09.Rep04: alpha=0.4444, lambda=0.5 
+ Fold09.Rep04: alpha=0.5556, lambda=0.5 
- Fold09.Rep04: alpha=0.5556, lambda=0.5 
+ Fold09.Rep04: alpha=0.6667, lambda=0.5 
- Fold09.Rep04: alpha=0.6667, lambda=0.5 
+ Fold09.Rep04: alpha=0.7778, lambda=0.5 
- Fold09.Rep04: alpha=0.7778, lambda=0.5 
+ Fold09.Rep04: alpha=0.8889, lambda=0.5 
- Fold09.Rep04: alpha=0.8889, lambda=0.5 
+ Fold09.Rep04: alpha=1.0000, lambda=0.5 
- Fold09.Rep04: alpha=1.0000, lambda=0.5 
+ Fold10.Rep04: alpha=0.0000, lambda=0.5 
- Fold10.Rep04: alpha=0.0000, lambda=0.5 
+ Fold10.Rep04: alpha=0.1111, lambda=0.5 
- Fold10.Rep04: alpha=0.1111, lambda=0.5 
+ Fold10.Rep04: alpha=0.2222, lambda=0.5 
- Fold10.Rep04: alpha=0.2222, lambda=0.5 
+ Fold10.Rep04: alpha=0.3333, lambda=0.5 
- Fold10.Rep04: alpha=0.3333, lambda=0.5 
+ Fold10.Rep04: alpha=0.4444, lambda=0.5 
- Fold10.Rep04: alpha=0.4444, lambda=0.5 
+ Fold10.Rep04: alpha=0.5556, lambda=0.5 
- Fold10.Rep04: alpha=0.5556, lambda=0.5 
+ Fold10.Rep04: alpha=0.6667, lambda=0.5 
- Fold10.Rep04: alpha=0.6667, lambda=0.5 
+ Fold10.Rep04: alpha=0.7778, lambda=0.5 
- Fold10.Rep04: alpha=0.7778, lambda=0.5 
+ Fold10.Rep04: alpha=0.8889, lambda=0.5 
- Fold10.Rep04: alpha=0.8889, lambda=0.5 
+ Fold10.Rep04: alpha=1.0000, lambda=0.5 
- Fold10.Rep04: alpha=1.0000, lambda=0.5 
+ Fold01.Rep05: alpha=0.0000, lambda=0.5 
- Fold01.Rep05: alpha=0.0000, lambda=0.5 
+ Fold01.Rep05: alpha=0.1111, lambda=0.5 
- Fold01.Rep05: alpha=0.1111, lambda=0.5 
+ Fold01.Rep05: alpha=0.2222, lambda=0.5 
- Fold01.Rep05: alpha=0.2222, lambda=0.5 
+ Fold01.Rep05: alpha=0.3333, lambda=0.5 
- Fold01.Rep05: alpha=0.3333, lambda=0.5 
+ Fold01.Rep05: alpha=0.4444, lambda=0.5 
- Fold01.Rep05: alpha=0.4444, lambda=0.5 
+ Fold01.Rep05: alpha=0.5556, lambda=0.5 
- Fold01.Rep05: alpha=0.5556, lambda=0.5 
+ Fold01.Rep05: alpha=0.6667, lambda=0.5 
- Fold01.Rep05: alpha=0.6667, lambda=0.5 
+ Fold01.Rep05: alpha=0.7778, lambda=0.5 
- Fold01.Rep05: alpha=0.7778, lambda=0.5 
+ Fold01.Rep05: alpha=0.8889, lambda=0.5 
- Fold01.Rep05: alpha=0.8889, lambda=0.5 
+ Fold01.Rep05: alpha=1.0000, lambda=0.5 
- Fold01.Rep05: alpha=1.0000, lambda=0.5 
+ Fold02.Rep05: alpha=0.0000, lambda=0.5 
- Fold02.Rep05: alpha=0.0000, lambda=0.5 
+ Fold02.Rep05: alpha=0.1111, lambda=0.5 
- Fold02.Rep05: alpha=0.1111, lambda=0.5 
+ Fold02.Rep05: alpha=0.2222, lambda=0.5 
- Fold02.Rep05: alpha=0.2222, lambda=0.5 
+ Fold02.Rep05: alpha=0.3333, lambda=0.5 
- Fold02.Rep05: alpha=0.3333, lambda=0.5 
+ Fold02.Rep05: alpha=0.4444, lambda=0.5 
- Fold02.Rep05: alpha=0.4444, lambda=0.5 
+ Fold02.Rep05: alpha=0.5556, lambda=0.5 
- Fold02.Rep05: alpha=0.5556, lambda=0.5 
+ Fold02.Rep05: alpha=0.6667, lambda=0.5 
- Fold02.Rep05: alpha=0.6667, lambda=0.5 
+ Fold02.Rep05: alpha=0.7778, lambda=0.5 
- Fold02.Rep05: alpha=0.7778, lambda=0.5 
+ Fold02.Rep05: alpha=0.8889, lambda=0.5 
- Fold02.Rep05: alpha=0.8889, lambda=0.5 
+ Fold02.Rep05: alpha=1.0000, lambda=0.5 
- Fold02.Rep05: alpha=1.0000, lambda=0.5 
+ Fold03.Rep05: alpha=0.0000, lambda=0.5 
- Fold03.Rep05: alpha=0.0000, lambda=0.5 
+ Fold03.Rep05: alpha=0.1111, lambda=0.5 
- Fold03.Rep05: alpha=0.1111, lambda=0.5 
+ Fold03.Rep05: alpha=0.2222, lambda=0.5 
- Fold03.Rep05: alpha=0.2222, lambda=0.5 
+ Fold03.Rep05: alpha=0.3333, lambda=0.5 
- Fold03.Rep05: alpha=0.3333, lambda=0.5 
+ Fold03.Rep05: alpha=0.4444, lambda=0.5 
- Fold03.Rep05: alpha=0.4444, lambda=0.5 
+ Fold03.Rep05: alpha=0.5556, lambda=0.5 
- Fold03.Rep05: alpha=0.5556, lambda=0.5 
+ Fold03.Rep05: alpha=0.6667, lambda=0.5 
- Fold03.Rep05: alpha=0.6667, lambda=0.5 
+ Fold03.Rep05: alpha=0.7778, lambda=0.5 
- Fold03.Rep05: alpha=0.7778, lambda=0.5 
+ Fold03.Rep05: alpha=0.8889, lambda=0.5 
- Fold03.Rep05: alpha=0.8889, lambda=0.5 
+ Fold03.Rep05: alpha=1.0000, lambda=0.5 
- Fold03.Rep05: alpha=1.0000, lambda=0.5 
+ Fold04.Rep05: alpha=0.0000, lambda=0.5 
- Fold04.Rep05: alpha=0.0000, lambda=0.5 
+ Fold04.Rep05: alpha=0.1111, lambda=0.5 
- Fold04.Rep05: alpha=0.1111, lambda=0.5 
+ Fold04.Rep05: alpha=0.2222, lambda=0.5 
- Fold04.Rep05: alpha=0.2222, lambda=0.5 
+ Fold04.Rep05: alpha=0.3333, lambda=0.5 
- Fold04.Rep05: alpha=0.3333, lambda=0.5 
+ Fold04.Rep05: alpha=0.4444, lambda=0.5 
- Fold04.Rep05: alpha=0.4444, lambda=0.5 
+ Fold04.Rep05: alpha=0.5556, lambda=0.5 
- Fold04.Rep05: alpha=0.5556, lambda=0.5 
+ Fold04.Rep05: alpha=0.6667, lambda=0.5 
- Fold04.Rep05: alpha=0.6667, lambda=0.5 
+ Fold04.Rep05: alpha=0.7778, lambda=0.5 
- Fold04.Rep05: alpha=0.7778, lambda=0.5 
+ Fold04.Rep05: alpha=0.8889, lambda=0.5 
- Fold04.Rep05: alpha=0.8889, lambda=0.5 
+ Fold04.Rep05: alpha=1.0000, lambda=0.5 
- Fold04.Rep05: alpha=1.0000, lambda=0.5 
+ Fold05.Rep05: alpha=0.0000, lambda=0.5 
- Fold05.Rep05: alpha=0.0000, lambda=0.5 
+ Fold05.Rep05: alpha=0.1111, lambda=0.5 
- Fold05.Rep05: alpha=0.1111, lambda=0.5 
+ Fold05.Rep05: alpha=0.2222, lambda=0.5 
- Fold05.Rep05: alpha=0.2222, lambda=0.5 
+ Fold05.Rep05: alpha=0.3333, lambda=0.5 
- Fold05.Rep05: alpha=0.3333, lambda=0.5 
+ Fold05.Rep05: alpha=0.4444, lambda=0.5 
- Fold05.Rep05: alpha=0.4444, lambda=0.5 
+ Fold05.Rep05: alpha=0.5556, lambda=0.5 
- Fold05.Rep05: alpha=0.5556, lambda=0.5 
+ Fold05.Rep05: alpha=0.6667, lambda=0.5 
- Fold05.Rep05: alpha=0.6667, lambda=0.5 
+ Fold05.Rep05: alpha=0.7778, lambda=0.5 
- Fold05.Rep05: alpha=0.7778, lambda=0.5 
+ Fold05.Rep05: alpha=0.8889, lambda=0.5 
- Fold05.Rep05: alpha=0.8889, lambda=0.5 
+ Fold05.Rep05: alpha=1.0000, lambda=0.5 
- Fold05.Rep05: alpha=1.0000, lambda=0.5 
+ Fold06.Rep05: alpha=0.0000, lambda=0.5 
- Fold06.Rep05: alpha=0.0000, lambda=0.5 
+ Fold06.Rep05: alpha=0.1111, lambda=0.5 
- Fold06.Rep05: alpha=0.1111, lambda=0.5 
+ Fold06.Rep05: alpha=0.2222, lambda=0.5 
- Fold06.Rep05: alpha=0.2222, lambda=0.5 
+ Fold06.Rep05: alpha=0.3333, lambda=0.5 
- Fold06.Rep05: alpha=0.3333, lambda=0.5 
+ Fold06.Rep05: alpha=0.4444, lambda=0.5 
- Fold06.Rep05: alpha=0.4444, lambda=0.5 
+ Fold06.Rep05: alpha=0.5556, lambda=0.5 
- Fold06.Rep05: alpha=0.5556, lambda=0.5 
+ Fold06.Rep05: alpha=0.6667, lambda=0.5 
- Fold06.Rep05: alpha=0.6667, lambda=0.5 
+ Fold06.Rep05: alpha=0.7778, lambda=0.5 
- Fold06.Rep05: alpha=0.7778, lambda=0.5 
+ Fold06.Rep05: alpha=0.8889, lambda=0.5 
- Fold06.Rep05: alpha=0.8889, lambda=0.5 
+ Fold06.Rep05: alpha=1.0000, lambda=0.5 
- Fold06.Rep05: alpha=1.0000, lambda=0.5 
+ Fold07.Rep05: alpha=0.0000, lambda=0.5 
- Fold07.Rep05: alpha=0.0000, lambda=0.5 
+ Fold07.Rep05: alpha=0.1111, lambda=0.5 
- Fold07.Rep05: alpha=0.1111, lambda=0.5 
+ Fold07.Rep05: alpha=0.2222, lambda=0.5 
- Fold07.Rep05: alpha=0.2222, lambda=0.5 
+ Fold07.Rep05: alpha=0.3333, lambda=0.5 
- Fold07.Rep05: alpha=0.3333, lambda=0.5 
+ Fold07.Rep05: alpha=0.4444, lambda=0.5 
- Fold07.Rep05: alpha=0.4444, lambda=0.5 
+ Fold07.Rep05: alpha=0.5556, lambda=0.5 
- Fold07.Rep05: alpha=0.5556, lambda=0.5 
+ Fold07.Rep05: alpha=0.6667, lambda=0.5 
- Fold07.Rep05: alpha=0.6667, lambda=0.5 
+ Fold07.Rep05: alpha=0.7778, lambda=0.5 
- Fold07.Rep05: alpha=0.7778, lambda=0.5 
+ Fold07.Rep05: alpha=0.8889, lambda=0.5 
- Fold07.Rep05: alpha=0.8889, lambda=0.5 
+ Fold07.Rep05: alpha=1.0000, lambda=0.5 
- Fold07.Rep05: alpha=1.0000, lambda=0.5 
+ Fold08.Rep05: alpha=0.0000, lambda=0.5 
- Fold08.Rep05: alpha=0.0000, lambda=0.5 
+ Fold08.Rep05: alpha=0.1111, lambda=0.5 
- Fold08.Rep05: alpha=0.1111, lambda=0.5 
+ Fold08.Rep05: alpha=0.2222, lambda=0.5 
- Fold08.Rep05: alpha=0.2222, lambda=0.5 
+ Fold08.Rep05: alpha=0.3333, lambda=0.5 
- Fold08.Rep05: alpha=0.3333, lambda=0.5 
+ Fold08.Rep05: alpha=0.4444, lambda=0.5 
- Fold08.Rep05: alpha=0.4444, lambda=0.5 
+ Fold08.Rep05: alpha=0.5556, lambda=0.5 
- Fold08.Rep05: alpha=0.5556, lambda=0.5 
+ Fold08.Rep05: alpha=0.6667, lambda=0.5 
- Fold08.Rep05: alpha=0.6667, lambda=0.5 
+ Fold08.Rep05: alpha=0.7778, lambda=0.5 
- Fold08.Rep05: alpha=0.7778, lambda=0.5 
+ Fold08.Rep05: alpha=0.8889, lambda=0.5 
- Fold08.Rep05: alpha=0.8889, lambda=0.5 
+ Fold08.Rep05: alpha=1.0000, lambda=0.5 
- Fold08.Rep05: alpha=1.0000, lambda=0.5 
+ Fold09.Rep05: alpha=0.0000, lambda=0.5 
- Fold09.Rep05: alpha=0.0000, lambda=0.5 
+ Fold09.Rep05: alpha=0.1111, lambda=0.5 
- Fold09.Rep05: alpha=0.1111, lambda=0.5 
+ Fold09.Rep05: alpha=0.2222, lambda=0.5 
- Fold09.Rep05: alpha=0.2222, lambda=0.5 
+ Fold09.Rep05: alpha=0.3333, lambda=0.5 
- Fold09.Rep05: alpha=0.3333, lambda=0.5 
+ Fold09.Rep05: alpha=0.4444, lambda=0.5 
- Fold09.Rep05: alpha=0.4444, lambda=0.5 
+ Fold09.Rep05: alpha=0.5556, lambda=0.5 
- Fold09.Rep05: alpha=0.5556, lambda=0.5 
+ Fold09.Rep05: alpha=0.6667, lambda=0.5 
- Fold09.Rep05: alpha=0.6667, lambda=0.5 
+ Fold09.Rep05: alpha=0.7778, lambda=0.5 
- Fold09.Rep05: alpha=0.7778, lambda=0.5 
+ Fold09.Rep05: alpha=0.8889, lambda=0.5 
- Fold09.Rep05: alpha=0.8889, lambda=0.5 
+ Fold09.Rep05: alpha=1.0000, lambda=0.5 
- Fold09.Rep05: alpha=1.0000, lambda=0.5 
+ Fold10.Rep05: alpha=0.0000, lambda=0.5 
- Fold10.Rep05: alpha=0.0000, lambda=0.5 
+ Fold10.Rep05: alpha=0.1111, lambda=0.5 
- Fold10.Rep05: alpha=0.1111, lambda=0.5 
+ Fold10.Rep05: alpha=0.2222, lambda=0.5 
- Fold10.Rep05: alpha=0.2222, lambda=0.5 
+ Fold10.Rep05: alpha=0.3333, lambda=0.5 
- Fold10.Rep05: alpha=0.3333, lambda=0.5 
+ Fold10.Rep05: alpha=0.4444, lambda=0.5 
- Fold10.Rep05: alpha=0.4444, lambda=0.5 
+ Fold10.Rep05: alpha=0.5556, lambda=0.5 
- Fold10.Rep05: alpha=0.5556, lambda=0.5 
+ Fold10.Rep05: alpha=0.6667, lambda=0.5 
- Fold10.Rep05: alpha=0.6667, lambda=0.5 
+ Fold10.Rep05: alpha=0.7778, lambda=0.5 
- Fold10.Rep05: alpha=0.7778, lambda=0.5 
+ Fold10.Rep05: alpha=0.8889, lambda=0.5 
- Fold10.Rep05: alpha=0.8889, lambda=0.5 
+ Fold10.Rep05: alpha=1.0000, lambda=0.5 
- Fold10.Rep05: alpha=1.0000, lambda=0.5 
+ Fold01.Rep06: alpha=0.0000, lambda=0.5 
- Fold01.Rep06: alpha=0.0000, lambda=0.5 
+ Fold01.Rep06: alpha=0.1111, lambda=0.5 
- Fold01.Rep06: alpha=0.1111, lambda=0.5 
+ Fold01.Rep06: alpha=0.2222, lambda=0.5 
- Fold01.Rep06: alpha=0.2222, lambda=0.5 
+ Fold01.Rep06: alpha=0.3333, lambda=0.5 
- Fold01.Rep06: alpha=0.3333, lambda=0.5 
+ Fold01.Rep06: alpha=0.4444, lambda=0.5 
- Fold01.Rep06: alpha=0.4444, lambda=0.5 
+ Fold01.Rep06: alpha=0.5556, lambda=0.5 
- Fold01.Rep06: alpha=0.5556, lambda=0.5 
+ Fold01.Rep06: alpha=0.6667, lambda=0.5 
- Fold01.Rep06: alpha=0.6667, lambda=0.5 
+ Fold01.Rep06: alpha=0.7778, lambda=0.5 
- Fold01.Rep06: alpha=0.7778, lambda=0.5 
+ Fold01.Rep06: alpha=0.8889, lambda=0.5 
- Fold01.Rep06: alpha=0.8889, lambda=0.5 
+ Fold01.Rep06: alpha=1.0000, lambda=0.5 
- Fold01.Rep06: alpha=1.0000, lambda=0.5 
+ Fold02.Rep06: alpha=0.0000, lambda=0.5 
- Fold02.Rep06: alpha=0.0000, lambda=0.5 
+ Fold02.Rep06: alpha=0.1111, lambda=0.5 
- Fold02.Rep06: alpha=0.1111, lambda=0.5 
+ Fold02.Rep06: alpha=0.2222, lambda=0.5 
- Fold02.Rep06: alpha=0.2222, lambda=0.5 
+ Fold02.Rep06: alpha=0.3333, lambda=0.5 
- Fold02.Rep06: alpha=0.3333, lambda=0.5 
+ Fold02.Rep06: alpha=0.4444, lambda=0.5 
- Fold02.Rep06: alpha=0.4444, lambda=0.5 
+ Fold02.Rep06: alpha=0.5556, lambda=0.5 
- Fold02.Rep06: alpha=0.5556, lambda=0.5 
+ Fold02.Rep06: alpha=0.6667, lambda=0.5 
- Fold02.Rep06: alpha=0.6667, lambda=0.5 
+ Fold02.Rep06: alpha=0.7778, lambda=0.5 
- Fold02.Rep06: alpha=0.7778, lambda=0.5 
+ Fold02.Rep06: alpha=0.8889, lambda=0.5 
- Fold02.Rep06: alpha=0.8889, lambda=0.5 
+ Fold02.Rep06: alpha=1.0000, lambda=0.5 
- Fold02.Rep06: alpha=1.0000, lambda=0.5 
+ Fold03.Rep06: alpha=0.0000, lambda=0.5 
- Fold03.Rep06: alpha=0.0000, lambda=0.5 
+ Fold03.Rep06: alpha=0.1111, lambda=0.5 
- Fold03.Rep06: alpha=0.1111, lambda=0.5 
+ Fold03.Rep06: alpha=0.2222, lambda=0.5 
- Fold03.Rep06: alpha=0.2222, lambda=0.5 
+ Fold03.Rep06: alpha=0.3333, lambda=0.5 
- Fold03.Rep06: alpha=0.3333, lambda=0.5 
+ Fold03.Rep06: alpha=0.4444, lambda=0.5 
- Fold03.Rep06: alpha=0.4444, lambda=0.5 
+ Fold03.Rep06: alpha=0.5556, lambda=0.5 
- Fold03.Rep06: alpha=0.5556, lambda=0.5 
+ Fold03.Rep06: alpha=0.6667, lambda=0.5 
- Fold03.Rep06: alpha=0.6667, lambda=0.5 
+ Fold03.Rep06: alpha=0.7778, lambda=0.5 
- Fold03.Rep06: alpha=0.7778, lambda=0.5 
+ Fold03.Rep06: alpha=0.8889, lambda=0.5 
- Fold03.Rep06: alpha=0.8889, lambda=0.5 
+ Fold03.Rep06: alpha=1.0000, lambda=0.5 
- Fold03.Rep06: alpha=1.0000, lambda=0.5 
+ Fold04.Rep06: alpha=0.0000, lambda=0.5 
- Fold04.Rep06: alpha=0.0000, lambda=0.5 
+ Fold04.Rep06: alpha=0.1111, lambda=0.5 
- Fold04.Rep06: alpha=0.1111, lambda=0.5 
+ Fold04.Rep06: alpha=0.2222, lambda=0.5 
- Fold04.Rep06: alpha=0.2222, lambda=0.5 
+ Fold04.Rep06: alpha=0.3333, lambda=0.5 
- Fold04.Rep06: alpha=0.3333, lambda=0.5 
+ Fold04.Rep06: alpha=0.4444, lambda=0.5 
- Fold04.Rep06: alpha=0.4444, lambda=0.5 
+ Fold04.Rep06: alpha=0.5556, lambda=0.5 
- Fold04.Rep06: alpha=0.5556, lambda=0.5 
+ Fold04.Rep06: alpha=0.6667, lambda=0.5 
- Fold04.Rep06: alpha=0.6667, lambda=0.5 
+ Fold04.Rep06: alpha=0.7778, lambda=0.5 
- Fold04.Rep06: alpha=0.7778, lambda=0.5 
+ Fold04.Rep06: alpha=0.8889, lambda=0.5 
- Fold04.Rep06: alpha=0.8889, lambda=0.5 
+ Fold04.Rep06: alpha=1.0000, lambda=0.5 
- Fold04.Rep06: alpha=1.0000, lambda=0.5 
+ Fold05.Rep06: alpha=0.0000, lambda=0.5 
- Fold05.Rep06: alpha=0.0000, lambda=0.5 
+ Fold05.Rep06: alpha=0.1111, lambda=0.5 
- Fold05.Rep06: alpha=0.1111, lambda=0.5 
+ Fold05.Rep06: alpha=0.2222, lambda=0.5 
- Fold05.Rep06: alpha=0.2222, lambda=0.5 
+ Fold05.Rep06: alpha=0.3333, lambda=0.5 
- Fold05.Rep06: alpha=0.3333, lambda=0.5 
+ Fold05.Rep06: alpha=0.4444, lambda=0.5 
- Fold05.Rep06: alpha=0.4444, lambda=0.5 
+ Fold05.Rep06: alpha=0.5556, lambda=0.5 
- Fold05.Rep06: alpha=0.5556, lambda=0.5 
+ Fold05.Rep06: alpha=0.6667, lambda=0.5 
- Fold05.Rep06: alpha=0.6667, lambda=0.5 
+ Fold05.Rep06: alpha=0.7778, lambda=0.5 
- Fold05.Rep06: alpha=0.7778, lambda=0.5 
+ Fold05.Rep06: alpha=0.8889, lambda=0.5 
- Fold05.Rep06: alpha=0.8889, lambda=0.5 
+ Fold05.Rep06: alpha=1.0000, lambda=0.5 
- Fold05.Rep06: alpha=1.0000, lambda=0.5 
+ Fold06.Rep06: alpha=0.0000, lambda=0.5 
- Fold06.Rep06: alpha=0.0000, lambda=0.5 
+ Fold06.Rep06: alpha=0.1111, lambda=0.5 
- Fold06.Rep06: alpha=0.1111, lambda=0.5 
+ Fold06.Rep06: alpha=0.2222, lambda=0.5 
- Fold06.Rep06: alpha=0.2222, lambda=0.5 
+ Fold06.Rep06: alpha=0.3333, lambda=0.5 
- Fold06.Rep06: alpha=0.3333, lambda=0.5 
+ Fold06.Rep06: alpha=0.4444, lambda=0.5 
- Fold06.Rep06: alpha=0.4444, lambda=0.5 
+ Fold06.Rep06: alpha=0.5556, lambda=0.5 
- Fold06.Rep06: alpha=0.5556, lambda=0.5 
+ Fold06.Rep06: alpha=0.6667, lambda=0.5 
- Fold06.Rep06: alpha=0.6667, lambda=0.5 
+ Fold06.Rep06: alpha=0.7778, lambda=0.5 
- Fold06.Rep06: alpha=0.7778, lambda=0.5 
+ Fold06.Rep06: alpha=0.8889, lambda=0.5 
- Fold06.Rep06: alpha=0.8889, lambda=0.5 
+ Fold06.Rep06: alpha=1.0000, lambda=0.5 
- Fold06.Rep06: alpha=1.0000, lambda=0.5 
+ Fold07.Rep06: alpha=0.0000, lambda=0.5 
- Fold07.Rep06: alpha=0.0000, lambda=0.5 
+ Fold07.Rep06: alpha=0.1111, lambda=0.5 
- Fold07.Rep06: alpha=0.1111, lambda=0.5 
+ Fold07.Rep06: alpha=0.2222, lambda=0.5 
- Fold07.Rep06: alpha=0.2222, lambda=0.5 
+ Fold07.Rep06: alpha=0.3333, lambda=0.5 
- Fold07.Rep06: alpha=0.3333, lambda=0.5 
+ Fold07.Rep06: alpha=0.4444, lambda=0.5 
- Fold07.Rep06: alpha=0.4444, lambda=0.5 
+ Fold07.Rep06: alpha=0.5556, lambda=0.5 
- Fold07.Rep06: alpha=0.5556, lambda=0.5 
+ Fold07.Rep06: alpha=0.6667, lambda=0.5 
- Fold07.Rep06: alpha=0.6667, lambda=0.5 
+ Fold07.Rep06: alpha=0.7778, lambda=0.5 
- Fold07.Rep06: alpha=0.7778, lambda=0.5 
+ Fold07.Rep06: alpha=0.8889, lambda=0.5 
- Fold07.Rep06: alpha=0.8889, lambda=0.5 
+ Fold07.Rep06: alpha=1.0000, lambda=0.5 
- Fold07.Rep06: alpha=1.0000, lambda=0.5 
+ Fold08.Rep06: alpha=0.0000, lambda=0.5 
- Fold08.Rep06: alpha=0.0000, lambda=0.5 
+ Fold08.Rep06: alpha=0.1111, lambda=0.5 
- Fold08.Rep06: alpha=0.1111, lambda=0.5 
+ Fold08.Rep06: alpha=0.2222, lambda=0.5 
- Fold08.Rep06: alpha=0.2222, lambda=0.5 
+ Fold08.Rep06: alpha=0.3333, lambda=0.5 
- Fold08.Rep06: alpha=0.3333, lambda=0.5 
+ Fold08.Rep06: alpha=0.4444, lambda=0.5 
- Fold08.Rep06: alpha=0.4444, lambda=0.5 
+ Fold08.Rep06: alpha=0.5556, lambda=0.5 
- Fold08.Rep06: alpha=0.5556, lambda=0.5 
+ Fold08.Rep06: alpha=0.6667, lambda=0.5 
- Fold08.Rep06: alpha=0.6667, lambda=0.5 
+ Fold08.Rep06: alpha=0.7778, lambda=0.5 
- Fold08.Rep06: alpha=0.7778, lambda=0.5 
+ Fold08.Rep06: alpha=0.8889, lambda=0.5 
- Fold08.Rep06: alpha=0.8889, lambda=0.5 
+ Fold08.Rep06: alpha=1.0000, lambda=0.5 
- Fold08.Rep06: alpha=1.0000, lambda=0.5 
+ Fold09.Rep06: alpha=0.0000, lambda=0.5 
- Fold09.Rep06: alpha=0.0000, lambda=0.5 
+ Fold09.Rep06: alpha=0.1111, lambda=0.5 
- Fold09.Rep06: alpha=0.1111, lambda=0.5 
+ Fold09.Rep06: alpha=0.2222, lambda=0.5 
- Fold09.Rep06: alpha=0.2222, lambda=0.5 
+ Fold09.Rep06: alpha=0.3333, lambda=0.5 
- Fold09.Rep06: alpha=0.3333, lambda=0.5 
+ Fold09.Rep06: alpha=0.4444, lambda=0.5 
- Fold09.Rep06: alpha=0.4444, lambda=0.5 
+ Fold09.Rep06: alpha=0.5556, lambda=0.5 
- Fold09.Rep06: alpha=0.5556, lambda=0.5 
+ Fold09.Rep06: alpha=0.6667, lambda=0.5 
- Fold09.Rep06: alpha=0.6667, lambda=0.5 
+ Fold09.Rep06: alpha=0.7778, lambda=0.5 
- Fold09.Rep06: alpha=0.7778, lambda=0.5 
+ Fold09.Rep06: alpha=0.8889, lambda=0.5 
- Fold09.Rep06: alpha=0.8889, lambda=0.5 
+ Fold09.Rep06: alpha=1.0000, lambda=0.5 
- Fold09.Rep06: alpha=1.0000, lambda=0.5 
+ Fold10.Rep06: alpha=0.0000, lambda=0.5 
- Fold10.Rep06: alpha=0.0000, lambda=0.5 
+ Fold10.Rep06: alpha=0.1111, lambda=0.5 
- Fold10.Rep06: alpha=0.1111, lambda=0.5 
+ Fold10.Rep06: alpha=0.2222, lambda=0.5 
- Fold10.Rep06: alpha=0.2222, lambda=0.5 
+ Fold10.Rep06: alpha=0.3333, lambda=0.5 
- Fold10.Rep06: alpha=0.3333, lambda=0.5 
+ Fold10.Rep06: alpha=0.4444, lambda=0.5 
- Fold10.Rep06: alpha=0.4444, lambda=0.5 
+ Fold10.Rep06: alpha=0.5556, lambda=0.5 
- Fold10.Rep06: alpha=0.5556, lambda=0.5 
+ Fold10.Rep06: alpha=0.6667, lambda=0.5 
- Fold10.Rep06: alpha=0.6667, lambda=0.5 
+ Fold10.Rep06: alpha=0.7778, lambda=0.5 
- Fold10.Rep06: alpha=0.7778, lambda=0.5 
+ Fold10.Rep06: alpha=0.8889, lambda=0.5 
- Fold10.Rep06: alpha=0.8889, lambda=0.5 
+ Fold10.Rep06: alpha=1.0000, lambda=0.5 
- Fold10.Rep06: alpha=1.0000, lambda=0.5 
+ Fold01.Rep07: alpha=0.0000, lambda=0.5 
- Fold01.Rep07: alpha=0.0000, lambda=0.5 
+ Fold01.Rep07: alpha=0.1111, lambda=0.5 
- Fold01.Rep07: alpha=0.1111, lambda=0.5 
+ Fold01.Rep07: alpha=0.2222, lambda=0.5 
- Fold01.Rep07: alpha=0.2222, lambda=0.5 
+ Fold01.Rep07: alpha=0.3333, lambda=0.5 
- Fold01.Rep07: alpha=0.3333, lambda=0.5 
+ Fold01.Rep07: alpha=0.4444, lambda=0.5 
- Fold01.Rep07: alpha=0.4444, lambda=0.5 
+ Fold01.Rep07: alpha=0.5556, lambda=0.5 
- Fold01.Rep07: alpha=0.5556, lambda=0.5 
+ Fold01.Rep07: alpha=0.6667, lambda=0.5 
- Fold01.Rep07: alpha=0.6667, lambda=0.5 
+ Fold01.Rep07: alpha=0.7778, lambda=0.5 
- Fold01.Rep07: alpha=0.7778, lambda=0.5 
+ Fold01.Rep07: alpha=0.8889, lambda=0.5 
- Fold01.Rep07: alpha=0.8889, lambda=0.5 
+ Fold01.Rep07: alpha=1.0000, lambda=0.5 
- Fold01.Rep07: alpha=1.0000, lambda=0.5 
+ Fold02.Rep07: alpha=0.0000, lambda=0.5 
- Fold02.Rep07: alpha=0.0000, lambda=0.5 
+ Fold02.Rep07: alpha=0.1111, lambda=0.5 
- Fold02.Rep07: alpha=0.1111, lambda=0.5 
+ Fold02.Rep07: alpha=0.2222, lambda=0.5 
- Fold02.Rep07: alpha=0.2222, lambda=0.5 
+ Fold02.Rep07: alpha=0.3333, lambda=0.5 
- Fold02.Rep07: alpha=0.3333, lambda=0.5 
+ Fold02.Rep07: alpha=0.4444, lambda=0.5 
- Fold02.Rep07: alpha=0.4444, lambda=0.5 
+ Fold02.Rep07: alpha=0.5556, lambda=0.5 
- Fold02.Rep07: alpha=0.5556, lambda=0.5 
+ Fold02.Rep07: alpha=0.6667, lambda=0.5 
- Fold02.Rep07: alpha=0.6667, lambda=0.5 
+ Fold02.Rep07: alpha=0.7778, lambda=0.5 
- Fold02.Rep07: alpha=0.7778, lambda=0.5 
+ Fold02.Rep07: alpha=0.8889, lambda=0.5 
- Fold02.Rep07: alpha=0.8889, lambda=0.5 
+ Fold02.Rep07: alpha=1.0000, lambda=0.5 
- Fold02.Rep07: alpha=1.0000, lambda=0.5 
+ Fold03.Rep07: alpha=0.0000, lambda=0.5 
- Fold03.Rep07: alpha=0.0000, lambda=0.5 
+ Fold03.Rep07: alpha=0.1111, lambda=0.5 
- Fold03.Rep07: alpha=0.1111, lambda=0.5 
+ Fold03.Rep07: alpha=0.2222, lambda=0.5 
- Fold03.Rep07: alpha=0.2222, lambda=0.5 
+ Fold03.Rep07: alpha=0.3333, lambda=0.5 
- Fold03.Rep07: alpha=0.3333, lambda=0.5 
+ Fold03.Rep07: alpha=0.4444, lambda=0.5 
- Fold03.Rep07: alpha=0.4444, lambda=0.5 
+ Fold03.Rep07: alpha=0.5556, lambda=0.5 
- Fold03.Rep07: alpha=0.5556, lambda=0.5 
+ Fold03.Rep07: alpha=0.6667, lambda=0.5 
- Fold03.Rep07: alpha=0.6667, lambda=0.5 
+ Fold03.Rep07: alpha=0.7778, lambda=0.5 
- Fold03.Rep07: alpha=0.7778, lambda=0.5 
+ Fold03.Rep07: alpha=0.8889, lambda=0.5 
- Fold03.Rep07: alpha=0.8889, lambda=0.5 
+ Fold03.Rep07: alpha=1.0000, lambda=0.5 
- Fold03.Rep07: alpha=1.0000, lambda=0.5 
+ Fold04.Rep07: alpha=0.0000, lambda=0.5 
- Fold04.Rep07: alpha=0.0000, lambda=0.5 
+ Fold04.Rep07: alpha=0.1111, lambda=0.5 
- Fold04.Rep07: alpha=0.1111, lambda=0.5 
+ Fold04.Rep07: alpha=0.2222, lambda=0.5 
- Fold04.Rep07: alpha=0.2222, lambda=0.5 
+ Fold04.Rep07: alpha=0.3333, lambda=0.5 
- Fold04.Rep07: alpha=0.3333, lambda=0.5 
+ Fold04.Rep07: alpha=0.4444, lambda=0.5 
- Fold04.Rep07: alpha=0.4444, lambda=0.5 
+ Fold04.Rep07: alpha=0.5556, lambda=0.5 
- Fold04.Rep07: alpha=0.5556, lambda=0.5 
+ Fold04.Rep07: alpha=0.6667, lambda=0.5 
- Fold04.Rep07: alpha=0.6667, lambda=0.5 
+ Fold04.Rep07: alpha=0.7778, lambda=0.5 
- Fold04.Rep07: alpha=0.7778, lambda=0.5 
+ Fold04.Rep07: alpha=0.8889, lambda=0.5 
- Fold04.Rep07: alpha=0.8889, lambda=0.5 
+ Fold04.Rep07: alpha=1.0000, lambda=0.5 
- Fold04.Rep07: alpha=1.0000, lambda=0.5 
+ Fold05.Rep07: alpha=0.0000, lambda=0.5 
- Fold05.Rep07: alpha=0.0000, lambda=0.5 
+ Fold05.Rep07: alpha=0.1111, lambda=0.5 
- Fold05.Rep07: alpha=0.1111, lambda=0.5 
+ Fold05.Rep07: alpha=0.2222, lambda=0.5 
- Fold05.Rep07: alpha=0.2222, lambda=0.5 
+ Fold05.Rep07: alpha=0.3333, lambda=0.5 
- Fold05.Rep07: alpha=0.3333, lambda=0.5 
+ Fold05.Rep07: alpha=0.4444, lambda=0.5 
- Fold05.Rep07: alpha=0.4444, lambda=0.5 
+ Fold05.Rep07: alpha=0.5556, lambda=0.5 
- Fold05.Rep07: alpha=0.5556, lambda=0.5 
+ Fold05.Rep07: alpha=0.6667, lambda=0.5 
- Fold05.Rep07: alpha=0.6667, lambda=0.5 
+ Fold05.Rep07: alpha=0.7778, lambda=0.5 
- Fold05.Rep07: alpha=0.7778, lambda=0.5 
+ Fold05.Rep07: alpha=0.8889, lambda=0.5 
- Fold05.Rep07: alpha=0.8889, lambda=0.5 
+ Fold05.Rep07: alpha=1.0000, lambda=0.5 
- Fold05.Rep07: alpha=1.0000, lambda=0.5 
+ Fold06.Rep07: alpha=0.0000, lambda=0.5 
- Fold06.Rep07: alpha=0.0000, lambda=0.5 
+ Fold06.Rep07: alpha=0.1111, lambda=0.5 
- Fold06.Rep07: alpha=0.1111, lambda=0.5 
+ Fold06.Rep07: alpha=0.2222, lambda=0.5 
- Fold06.Rep07: alpha=0.2222, lambda=0.5 
+ Fold06.Rep07: alpha=0.3333, lambda=0.5 
- Fold06.Rep07: alpha=0.3333, lambda=0.5 
+ Fold06.Rep07: alpha=0.4444, lambda=0.5 
- Fold06.Rep07: alpha=0.4444, lambda=0.5 
+ Fold06.Rep07: alpha=0.5556, lambda=0.5 
- Fold06.Rep07: alpha=0.5556, lambda=0.5 
+ Fold06.Rep07: alpha=0.6667, lambda=0.5 
- Fold06.Rep07: alpha=0.6667, lambda=0.5 
+ Fold06.Rep07: alpha=0.7778, lambda=0.5 
- Fold06.Rep07: alpha=0.7778, lambda=0.5 
+ Fold06.Rep07: alpha=0.8889, lambda=0.5 
- Fold06.Rep07: alpha=0.8889, lambda=0.5 
+ Fold06.Rep07: alpha=1.0000, lambda=0.5 
- Fold06.Rep07: alpha=1.0000, lambda=0.5 
+ Fold07.Rep07: alpha=0.0000, lambda=0.5 
- Fold07.Rep07: alpha=0.0000, lambda=0.5 
+ Fold07.Rep07: alpha=0.1111, lambda=0.5 
- Fold07.Rep07: alpha=0.1111, lambda=0.5 
+ Fold07.Rep07: alpha=0.2222, lambda=0.5 
- Fold07.Rep07: alpha=0.2222, lambda=0.5 
+ Fold07.Rep07: alpha=0.3333, lambda=0.5 
- Fold07.Rep07: alpha=0.3333, lambda=0.5 
+ Fold07.Rep07: alpha=0.4444, lambda=0.5 
- Fold07.Rep07: alpha=0.4444, lambda=0.5 
+ Fold07.Rep07: alpha=0.5556, lambda=0.5 
- Fold07.Rep07: alpha=0.5556, lambda=0.5 
+ Fold07.Rep07: alpha=0.6667, lambda=0.5 
- Fold07.Rep07: alpha=0.6667, lambda=0.5 
+ Fold07.Rep07: alpha=0.7778, lambda=0.5 
- Fold07.Rep07: alpha=0.7778, lambda=0.5 
+ Fold07.Rep07: alpha=0.8889, lambda=0.5 
- Fold07.Rep07: alpha=0.8889, lambda=0.5 
+ Fold07.Rep07: alpha=1.0000, lambda=0.5 
- Fold07.Rep07: alpha=1.0000, lambda=0.5 
+ Fold08.Rep07: alpha=0.0000, lambda=0.5 
- Fold08.Rep07: alpha=0.0000, lambda=0.5 
+ Fold08.Rep07: alpha=0.1111, lambda=0.5 
- Fold08.Rep07: alpha=0.1111, lambda=0.5 
+ Fold08.Rep07: alpha=0.2222, lambda=0.5 
- Fold08.Rep07: alpha=0.2222, lambda=0.5 
+ Fold08.Rep07: alpha=0.3333, lambda=0.5 
- Fold08.Rep07: alpha=0.3333, lambda=0.5 
+ Fold08.Rep07: alpha=0.4444, lambda=0.5 
- Fold08.Rep07: alpha=0.4444, lambda=0.5 
+ Fold08.Rep07: alpha=0.5556, lambda=0.5 
- Fold08.Rep07: alpha=0.5556, lambda=0.5 
+ Fold08.Rep07: alpha=0.6667, lambda=0.5 
- Fold08.Rep07: alpha=0.6667, lambda=0.5 
+ Fold08.Rep07: alpha=0.7778, lambda=0.5 
- Fold08.Rep07: alpha=0.7778, lambda=0.5 
+ Fold08.Rep07: alpha=0.8889, lambda=0.5 
- Fold08.Rep07: alpha=0.8889, lambda=0.5 
+ Fold08.Rep07: alpha=1.0000, lambda=0.5 
- Fold08.Rep07: alpha=1.0000, lambda=0.5 
+ Fold09.Rep07: alpha=0.0000, lambda=0.5 
- Fold09.Rep07: alpha=0.0000, lambda=0.5 
+ Fold09.Rep07: alpha=0.1111, lambda=0.5 
- Fold09.Rep07: alpha=0.1111, lambda=0.5 
+ Fold09.Rep07: alpha=0.2222, lambda=0.5 
- Fold09.Rep07: alpha=0.2222, lambda=0.5 
+ Fold09.Rep07: alpha=0.3333, lambda=0.5 
- Fold09.Rep07: alpha=0.3333, lambda=0.5 
+ Fold09.Rep07: alpha=0.4444, lambda=0.5 
- Fold09.Rep07: alpha=0.4444, lambda=0.5 
+ Fold09.Rep07: alpha=0.5556, lambda=0.5 
- Fold09.Rep07: alpha=0.5556, lambda=0.5 
+ Fold09.Rep07: alpha=0.6667, lambda=0.5 
- Fold09.Rep07: alpha=0.6667, lambda=0.5 
+ Fold09.Rep07: alpha=0.7778, lambda=0.5 
- Fold09.Rep07: alpha=0.7778, lambda=0.5 
+ Fold09.Rep07: alpha=0.8889, lambda=0.5 
- Fold09.Rep07: alpha=0.8889, lambda=0.5 
+ Fold09.Rep07: alpha=1.0000, lambda=0.5 
- Fold09.Rep07: alpha=1.0000, lambda=0.5 
+ Fold10.Rep07: alpha=0.0000, lambda=0.5 
- Fold10.Rep07: alpha=0.0000, lambda=0.5 
+ Fold10.Rep07: alpha=0.1111, lambda=0.5 
- Fold10.Rep07: alpha=0.1111, lambda=0.5 
+ Fold10.Rep07: alpha=0.2222, lambda=0.5 
- Fold10.Rep07: alpha=0.2222, lambda=0.5 
+ Fold10.Rep07: alpha=0.3333, lambda=0.5 
- Fold10.Rep07: alpha=0.3333, lambda=0.5 
+ Fold10.Rep07: alpha=0.4444, lambda=0.5 
- Fold10.Rep07: alpha=0.4444, lambda=0.5 
+ Fold10.Rep07: alpha=0.5556, lambda=0.5 
- Fold10.Rep07: alpha=0.5556, lambda=0.5 
+ Fold10.Rep07: alpha=0.6667, lambda=0.5 
- Fold10.Rep07: alpha=0.6667, lambda=0.5 
+ Fold10.Rep07: alpha=0.7778, lambda=0.5 
- Fold10.Rep07: alpha=0.7778, lambda=0.5 
+ Fold10.Rep07: alpha=0.8889, lambda=0.5 
- Fold10.Rep07: alpha=0.8889, lambda=0.5 
+ Fold10.Rep07: alpha=1.0000, lambda=0.5 
- Fold10.Rep07: alpha=1.0000, lambda=0.5 
+ Fold01.Rep08: alpha=0.0000, lambda=0.5 
- Fold01.Rep08: alpha=0.0000, lambda=0.5 
+ Fold01.Rep08: alpha=0.1111, lambda=0.5 
- Fold01.Rep08: alpha=0.1111, lambda=0.5 
+ Fold01.Rep08: alpha=0.2222, lambda=0.5 
- Fold01.Rep08: alpha=0.2222, lambda=0.5 
+ Fold01.Rep08: alpha=0.3333, lambda=0.5 
- Fold01.Rep08: alpha=0.3333, lambda=0.5 
+ Fold01.Rep08: alpha=0.4444, lambda=0.5 
- Fold01.Rep08: alpha=0.4444, lambda=0.5 
+ Fold01.Rep08: alpha=0.5556, lambda=0.5 
- Fold01.Rep08: alpha=0.5556, lambda=0.5 
+ Fold01.Rep08: alpha=0.6667, lambda=0.5 
- Fold01.Rep08: alpha=0.6667, lambda=0.5 
+ Fold01.Rep08: alpha=0.7778, lambda=0.5 
- Fold01.Rep08: alpha=0.7778, lambda=0.5 
+ Fold01.Rep08: alpha=0.8889, lambda=0.5 
- Fold01.Rep08: alpha=0.8889, lambda=0.5 
+ Fold01.Rep08: alpha=1.0000, lambda=0.5 
- Fold01.Rep08: alpha=1.0000, lambda=0.5 
+ Fold02.Rep08: alpha=0.0000, lambda=0.5 
- Fold02.Rep08: alpha=0.0000, lambda=0.5 
+ Fold02.Rep08: alpha=0.1111, lambda=0.5 
- Fold02.Rep08: alpha=0.1111, lambda=0.5 
+ Fold02.Rep08: alpha=0.2222, lambda=0.5 
- Fold02.Rep08: alpha=0.2222, lambda=0.5 
+ Fold02.Rep08: alpha=0.3333, lambda=0.5 
- Fold02.Rep08: alpha=0.3333, lambda=0.5 
+ Fold02.Rep08: alpha=0.4444, lambda=0.5 
- Fold02.Rep08: alpha=0.4444, lambda=0.5 
+ Fold02.Rep08: alpha=0.5556, lambda=0.5 
- Fold02.Rep08: alpha=0.5556, lambda=0.5 
+ Fold02.Rep08: alpha=0.6667, lambda=0.5 
- Fold02.Rep08: alpha=0.6667, lambda=0.5 
+ Fold02.Rep08: alpha=0.7778, lambda=0.5 
- Fold02.Rep08: alpha=0.7778, lambda=0.5 
+ Fold02.Rep08: alpha=0.8889, lambda=0.5 
- Fold02.Rep08: alpha=0.8889, lambda=0.5 
+ Fold02.Rep08: alpha=1.0000, lambda=0.5 
- Fold02.Rep08: alpha=1.0000, lambda=0.5 
+ Fold03.Rep08: alpha=0.0000, lambda=0.5 
- Fold03.Rep08: alpha=0.0000, lambda=0.5 
+ Fold03.Rep08: alpha=0.1111, lambda=0.5 
- Fold03.Rep08: alpha=0.1111, lambda=0.5 
+ Fold03.Rep08: alpha=0.2222, lambda=0.5 
- Fold03.Rep08: alpha=0.2222, lambda=0.5 
+ Fold03.Rep08: alpha=0.3333, lambda=0.5 
- Fold03.Rep08: alpha=0.3333, lambda=0.5 
+ Fold03.Rep08: alpha=0.4444, lambda=0.5 
- Fold03.Rep08: alpha=0.4444, lambda=0.5 
+ Fold03.Rep08: alpha=0.5556, lambda=0.5 
- Fold03.Rep08: alpha=0.5556, lambda=0.5 
+ Fold03.Rep08: alpha=0.6667, lambda=0.5 
- Fold03.Rep08: alpha=0.6667, lambda=0.5 
+ Fold03.Rep08: alpha=0.7778, lambda=0.5 
- Fold03.Rep08: alpha=0.7778, lambda=0.5 
+ Fold03.Rep08: alpha=0.8889, lambda=0.5 
- Fold03.Rep08: alpha=0.8889, lambda=0.5 
+ Fold03.Rep08: alpha=1.0000, lambda=0.5 
- Fold03.Rep08: alpha=1.0000, lambda=0.5 
+ Fold04.Rep08: alpha=0.0000, lambda=0.5 
- Fold04.Rep08: alpha=0.0000, lambda=0.5 
+ Fold04.Rep08: alpha=0.1111, lambda=0.5 
- Fold04.Rep08: alpha=0.1111, lambda=0.5 
+ Fold04.Rep08: alpha=0.2222, lambda=0.5 
- Fold04.Rep08: alpha=0.2222, lambda=0.5 
+ Fold04.Rep08: alpha=0.3333, lambda=0.5 
- Fold04.Rep08: alpha=0.3333, lambda=0.5 
+ Fold04.Rep08: alpha=0.4444, lambda=0.5 
- Fold04.Rep08: alpha=0.4444, lambda=0.5 
+ Fold04.Rep08: alpha=0.5556, lambda=0.5 
- Fold04.Rep08: alpha=0.5556, lambda=0.5 
+ Fold04.Rep08: alpha=0.6667, lambda=0.5 
- Fold04.Rep08: alpha=0.6667, lambda=0.5 
+ Fold04.Rep08: alpha=0.7778, lambda=0.5 
- Fold04.Rep08: alpha=0.7778, lambda=0.5 
+ Fold04.Rep08: alpha=0.8889, lambda=0.5 
- Fold04.Rep08: alpha=0.8889, lambda=0.5 
+ Fold04.Rep08: alpha=1.0000, lambda=0.5 
- Fold04.Rep08: alpha=1.0000, lambda=0.5 
+ Fold05.Rep08: alpha=0.0000, lambda=0.5 
- Fold05.Rep08: alpha=0.0000, lambda=0.5 
+ Fold05.Rep08: alpha=0.1111, lambda=0.5 
- Fold05.Rep08: alpha=0.1111, lambda=0.5 
+ Fold05.Rep08: alpha=0.2222, lambda=0.5 
- Fold05.Rep08: alpha=0.2222, lambda=0.5 
+ Fold05.Rep08: alpha=0.3333, lambda=0.5 
- Fold05.Rep08: alpha=0.3333, lambda=0.5 
+ Fold05.Rep08: alpha=0.4444, lambda=0.5 
- Fold05.Rep08: alpha=0.4444, lambda=0.5 
+ Fold05.Rep08: alpha=0.5556, lambda=0.5 
- Fold05.Rep08: alpha=0.5556, lambda=0.5 
+ Fold05.Rep08: alpha=0.6667, lambda=0.5 
- Fold05.Rep08: alpha=0.6667, lambda=0.5 
+ Fold05.Rep08: alpha=0.7778, lambda=0.5 
- Fold05.Rep08: alpha=0.7778, lambda=0.5 
+ Fold05.Rep08: alpha=0.8889, lambda=0.5 
- Fold05.Rep08: alpha=0.8889, lambda=0.5 
+ Fold05.Rep08: alpha=1.0000, lambda=0.5 
- Fold05.Rep08: alpha=1.0000, lambda=0.5 
+ Fold06.Rep08: alpha=0.0000, lambda=0.5 
- Fold06.Rep08: alpha=0.0000, lambda=0.5 
+ Fold06.Rep08: alpha=0.1111, lambda=0.5 
- Fold06.Rep08: alpha=0.1111, lambda=0.5 
+ Fold06.Rep08: alpha=0.2222, lambda=0.5 
- Fold06.Rep08: alpha=0.2222, lambda=0.5 
+ Fold06.Rep08: alpha=0.3333, lambda=0.5 
- Fold06.Rep08: alpha=0.3333, lambda=0.5 
+ Fold06.Rep08: alpha=0.4444, lambda=0.5 
- Fold06.Rep08: alpha=0.4444, lambda=0.5 
+ Fold06.Rep08: alpha=0.5556, lambda=0.5 
- Fold06.Rep08: alpha=0.5556, lambda=0.5 
+ Fold06.Rep08: alpha=0.6667, lambda=0.5 
- Fold06.Rep08: alpha=0.6667, lambda=0.5 
+ Fold06.Rep08: alpha=0.7778, lambda=0.5 
- Fold06.Rep08: alpha=0.7778, lambda=0.5 
+ Fold06.Rep08: alpha=0.8889, lambda=0.5 
- Fold06.Rep08: alpha=0.8889, lambda=0.5 
+ Fold06.Rep08: alpha=1.0000, lambda=0.5 
- Fold06.Rep08: alpha=1.0000, lambda=0.5 
+ Fold07.Rep08: alpha=0.0000, lambda=0.5 
- Fold07.Rep08: alpha=0.0000, lambda=0.5 
+ Fold07.Rep08: alpha=0.1111, lambda=0.5 
- Fold07.Rep08: alpha=0.1111, lambda=0.5 
+ Fold07.Rep08: alpha=0.2222, lambda=0.5 
- Fold07.Rep08: alpha=0.2222, lambda=0.5 
+ Fold07.Rep08: alpha=0.3333, lambda=0.5 
- Fold07.Rep08: alpha=0.3333, lambda=0.5 
+ Fold07.Rep08: alpha=0.4444, lambda=0.5 
- Fold07.Rep08: alpha=0.4444, lambda=0.5 
+ Fold07.Rep08: alpha=0.5556, lambda=0.5 
- Fold07.Rep08: alpha=0.5556, lambda=0.5 
+ Fold07.Rep08: alpha=0.6667, lambda=0.5 
- Fold07.Rep08: alpha=0.6667, lambda=0.5 
+ Fold07.Rep08: alpha=0.7778, lambda=0.5 
- Fold07.Rep08: alpha=0.7778, lambda=0.5 
+ Fold07.Rep08: alpha=0.8889, lambda=0.5 
- Fold07.Rep08: alpha=0.8889, lambda=0.5 
+ Fold07.Rep08: alpha=1.0000, lambda=0.5 
- Fold07.Rep08: alpha=1.0000, lambda=0.5 
+ Fold08.Rep08: alpha=0.0000, lambda=0.5 
- Fold08.Rep08: alpha=0.0000, lambda=0.5 
+ Fold08.Rep08: alpha=0.1111, lambda=0.5 
- Fold08.Rep08: alpha=0.1111, lambda=0.5 
+ Fold08.Rep08: alpha=0.2222, lambda=0.5 
- Fold08.Rep08: alpha=0.2222, lambda=0.5 
+ Fold08.Rep08: alpha=0.3333, lambda=0.5 
- Fold08.Rep08: alpha=0.3333, lambda=0.5 
+ Fold08.Rep08: alpha=0.4444, lambda=0.5 
- Fold08.Rep08: alpha=0.4444, lambda=0.5 
+ Fold08.Rep08: alpha=0.5556, lambda=0.5 
- Fold08.Rep08: alpha=0.5556, lambda=0.5 
+ Fold08.Rep08: alpha=0.6667, lambda=0.5 
- Fold08.Rep08: alpha=0.6667, lambda=0.5 
+ Fold08.Rep08: alpha=0.7778, lambda=0.5 
- Fold08.Rep08: alpha=0.7778, lambda=0.5 
+ Fold08.Rep08: alpha=0.8889, lambda=0.5 
- Fold08.Rep08: alpha=0.8889, lambda=0.5 
+ Fold08.Rep08: alpha=1.0000, lambda=0.5 
- Fold08.Rep08: alpha=1.0000, lambda=0.5 
+ Fold09.Rep08: alpha=0.0000, lambda=0.5 
- Fold09.Rep08: alpha=0.0000, lambda=0.5 
+ Fold09.Rep08: alpha=0.1111, lambda=0.5 
- Fold09.Rep08: alpha=0.1111, lambda=0.5 
+ Fold09.Rep08: alpha=0.2222, lambda=0.5 
- Fold09.Rep08: alpha=0.2222, lambda=0.5 
+ Fold09.Rep08: alpha=0.3333, lambda=0.5 
- Fold09.Rep08: alpha=0.3333, lambda=0.5 
+ Fold09.Rep08: alpha=0.4444, lambda=0.5 
- Fold09.Rep08: alpha=0.4444, lambda=0.5 
+ Fold09.Rep08: alpha=0.5556, lambda=0.5 
- Fold09.Rep08: alpha=0.5556, lambda=0.5 
+ Fold09.Rep08: alpha=0.6667, lambda=0.5 
- Fold09.Rep08: alpha=0.6667, lambda=0.5 
+ Fold09.Rep08: alpha=0.7778, lambda=0.5 
- Fold09.Rep08: alpha=0.7778, lambda=0.5 
+ Fold09.Rep08: alpha=0.8889, lambda=0.5 
- Fold09.Rep08: alpha=0.8889, lambda=0.5 
+ Fold09.Rep08: alpha=1.0000, lambda=0.5 
- Fold09.Rep08: alpha=1.0000, lambda=0.5 
+ Fold10.Rep08: alpha=0.0000, lambda=0.5 
- Fold10.Rep08: alpha=0.0000, lambda=0.5 
+ Fold10.Rep08: alpha=0.1111, lambda=0.5 
- Fold10.Rep08: alpha=0.1111, lambda=0.5 
+ Fold10.Rep08: alpha=0.2222, lambda=0.5 
- Fold10.Rep08: alpha=0.2222, lambda=0.5 
+ Fold10.Rep08: alpha=0.3333, lambda=0.5 
- Fold10.Rep08: alpha=0.3333, lambda=0.5 
+ Fold10.Rep08: alpha=0.4444, lambda=0.5 
- Fold10.Rep08: alpha=0.4444, lambda=0.5 
+ Fold10.Rep08: alpha=0.5556, lambda=0.5 
- Fold10.Rep08: alpha=0.5556, lambda=0.5 
+ Fold10.Rep08: alpha=0.6667, lambda=0.5 
- Fold10.Rep08: alpha=0.6667, lambda=0.5 
+ Fold10.Rep08: alpha=0.7778, lambda=0.5 
- Fold10.Rep08: alpha=0.7778, lambda=0.5 
+ Fold10.Rep08: alpha=0.8889, lambda=0.5 
- Fold10.Rep08: alpha=0.8889, lambda=0.5 
+ Fold10.Rep08: alpha=1.0000, lambda=0.5 
- Fold10.Rep08: alpha=1.0000, lambda=0.5 
+ Fold01.Rep09: alpha=0.0000, lambda=0.5 
- Fold01.Rep09: alpha=0.0000, lambda=0.5 
+ Fold01.Rep09: alpha=0.1111, lambda=0.5 
- Fold01.Rep09: alpha=0.1111, lambda=0.5 
+ Fold01.Rep09: alpha=0.2222, lambda=0.5 
- Fold01.Rep09: alpha=0.2222, lambda=0.5 
+ Fold01.Rep09: alpha=0.3333, lambda=0.5 
- Fold01.Rep09: alpha=0.3333, lambda=0.5 
+ Fold01.Rep09: alpha=0.4444, lambda=0.5 
- Fold01.Rep09: alpha=0.4444, lambda=0.5 
+ Fold01.Rep09: alpha=0.5556, lambda=0.5 
- Fold01.Rep09: alpha=0.5556, lambda=0.5 
+ Fold01.Rep09: alpha=0.6667, lambda=0.5 
- Fold01.Rep09: alpha=0.6667, lambda=0.5 
+ Fold01.Rep09: alpha=0.7778, lambda=0.5 
- Fold01.Rep09: alpha=0.7778, lambda=0.5 
+ Fold01.Rep09: alpha=0.8889, lambda=0.5 
- Fold01.Rep09: alpha=0.8889, lambda=0.5 
+ Fold01.Rep09: alpha=1.0000, lambda=0.5 
- Fold01.Rep09: alpha=1.0000, lambda=0.5 
+ Fold02.Rep09: alpha=0.0000, lambda=0.5 
- Fold02.Rep09: alpha=0.0000, lambda=0.5 
+ Fold02.Rep09: alpha=0.1111, lambda=0.5 
- Fold02.Rep09: alpha=0.1111, lambda=0.5 
+ Fold02.Rep09: alpha=0.2222, lambda=0.5 
- Fold02.Rep09: alpha=0.2222, lambda=0.5 
+ Fold02.Rep09: alpha=0.3333, lambda=0.5 
- Fold02.Rep09: alpha=0.3333, lambda=0.5 
+ Fold02.Rep09: alpha=0.4444, lambda=0.5 
- Fold02.Rep09: alpha=0.4444, lambda=0.5 
+ Fold02.Rep09: alpha=0.5556, lambda=0.5 
- Fold02.Rep09: alpha=0.5556, lambda=0.5 
+ Fold02.Rep09: alpha=0.6667, lambda=0.5 
- Fold02.Rep09: alpha=0.6667, lambda=0.5 
+ Fold02.Rep09: alpha=0.7778, lambda=0.5 
- Fold02.Rep09: alpha=0.7778, lambda=0.5 
+ Fold02.Rep09: alpha=0.8889, lambda=0.5 
- Fold02.Rep09: alpha=0.8889, lambda=0.5 
+ Fold02.Rep09: alpha=1.0000, lambda=0.5 
- Fold02.Rep09: alpha=1.0000, lambda=0.5 
+ Fold03.Rep09: alpha=0.0000, lambda=0.5 
- Fold03.Rep09: alpha=0.0000, lambda=0.5 
+ Fold03.Rep09: alpha=0.1111, lambda=0.5 
- Fold03.Rep09: alpha=0.1111, lambda=0.5 
+ Fold03.Rep09: alpha=0.2222, lambda=0.5 
- Fold03.Rep09: alpha=0.2222, lambda=0.5 
+ Fold03.Rep09: alpha=0.3333, lambda=0.5 
- Fold03.Rep09: alpha=0.3333, lambda=0.5 
+ Fold03.Rep09: alpha=0.4444, lambda=0.5 
- Fold03.Rep09: alpha=0.4444, lambda=0.5 
+ Fold03.Rep09: alpha=0.5556, lambda=0.5 
- Fold03.Rep09: alpha=0.5556, lambda=0.5 
+ Fold03.Rep09: alpha=0.6667, lambda=0.5 
- Fold03.Rep09: alpha=0.6667, lambda=0.5 
+ Fold03.Rep09: alpha=0.7778, lambda=0.5 
- Fold03.Rep09: alpha=0.7778, lambda=0.5 
+ Fold03.Rep09: alpha=0.8889, lambda=0.5 
- Fold03.Rep09: alpha=0.8889, lambda=0.5 
+ Fold03.Rep09: alpha=1.0000, lambda=0.5 
- Fold03.Rep09: alpha=1.0000, lambda=0.5 
+ Fold04.Rep09: alpha=0.0000, lambda=0.5 
- Fold04.Rep09: alpha=0.0000, lambda=0.5 
+ Fold04.Rep09: alpha=0.1111, lambda=0.5 
- Fold04.Rep09: alpha=0.1111, lambda=0.5 
+ Fold04.Rep09: alpha=0.2222, lambda=0.5 
- Fold04.Rep09: alpha=0.2222, lambda=0.5 
+ Fold04.Rep09: alpha=0.3333, lambda=0.5 
- Fold04.Rep09: alpha=0.3333, lambda=0.5 
+ Fold04.Rep09: alpha=0.4444, lambda=0.5 
- Fold04.Rep09: alpha=0.4444, lambda=0.5 
+ Fold04.Rep09: alpha=0.5556, lambda=0.5 
- Fold04.Rep09: alpha=0.5556, lambda=0.5 
+ Fold04.Rep09: alpha=0.6667, lambda=0.5 
- Fold04.Rep09: alpha=0.6667, lambda=0.5 
+ Fold04.Rep09: alpha=0.7778, lambda=0.5 
- Fold04.Rep09: alpha=0.7778, lambda=0.5 
+ Fold04.Rep09: alpha=0.8889, lambda=0.5 
- Fold04.Rep09: alpha=0.8889, lambda=0.5 
+ Fold04.Rep09: alpha=1.0000, lambda=0.5 
- Fold04.Rep09: alpha=1.0000, lambda=0.5 
+ Fold05.Rep09: alpha=0.0000, lambda=0.5 
- Fold05.Rep09: alpha=0.0000, lambda=0.5 
+ Fold05.Rep09: alpha=0.1111, lambda=0.5 
- Fold05.Rep09: alpha=0.1111, lambda=0.5 
+ Fold05.Rep09: alpha=0.2222, lambda=0.5 
- Fold05.Rep09: alpha=0.2222, lambda=0.5 
+ Fold05.Rep09: alpha=0.3333, lambda=0.5 
- Fold05.Rep09: alpha=0.3333, lambda=0.5 
+ Fold05.Rep09: alpha=0.4444, lambda=0.5 
- Fold05.Rep09: alpha=0.4444, lambda=0.5 
+ Fold05.Rep09: alpha=0.5556, lambda=0.5 
- Fold05.Rep09: alpha=0.5556, lambda=0.5 
+ Fold05.Rep09: alpha=0.6667, lambda=0.5 
- Fold05.Rep09: alpha=0.6667, lambda=0.5 
+ Fold05.Rep09: alpha=0.7778, lambda=0.5 
- Fold05.Rep09: alpha=0.7778, lambda=0.5 
+ Fold05.Rep09: alpha=0.8889, lambda=0.5 
- Fold05.Rep09: alpha=0.8889, lambda=0.5 
+ Fold05.Rep09: alpha=1.0000, lambda=0.5 
- Fold05.Rep09: alpha=1.0000, lambda=0.5 
+ Fold06.Rep09: alpha=0.0000, lambda=0.5 
- Fold06.Rep09: alpha=0.0000, lambda=0.5 
+ Fold06.Rep09: alpha=0.1111, lambda=0.5 
- Fold06.Rep09: alpha=0.1111, lambda=0.5 
+ Fold06.Rep09: alpha=0.2222, lambda=0.5 
- Fold06.Rep09: alpha=0.2222, lambda=0.5 
+ Fold06.Rep09: alpha=0.3333, lambda=0.5 
- Fold06.Rep09: alpha=0.3333, lambda=0.5 
+ Fold06.Rep09: alpha=0.4444, lambda=0.5 
- Fold06.Rep09: alpha=0.4444, lambda=0.5 
+ Fold06.Rep09: alpha=0.5556, lambda=0.5 
- Fold06.Rep09: alpha=0.5556, lambda=0.5 
+ Fold06.Rep09: alpha=0.6667, lambda=0.5 
- Fold06.Rep09: alpha=0.6667, lambda=0.5 
+ Fold06.Rep09: alpha=0.7778, lambda=0.5 
- Fold06.Rep09: alpha=0.7778, lambda=0.5 
+ Fold06.Rep09: alpha=0.8889, lambda=0.5 
- Fold06.Rep09: alpha=0.8889, lambda=0.5 
+ Fold06.Rep09: alpha=1.0000, lambda=0.5 
- Fold06.Rep09: alpha=1.0000, lambda=0.5 
+ Fold07.Rep09: alpha=0.0000, lambda=0.5 
- Fold07.Rep09: alpha=0.0000, lambda=0.5 
+ Fold07.Rep09: alpha=0.1111, lambda=0.5 
- Fold07.Rep09: alpha=0.1111, lambda=0.5 
+ Fold07.Rep09: alpha=0.2222, lambda=0.5 
- Fold07.Rep09: alpha=0.2222, lambda=0.5 
+ Fold07.Rep09: alpha=0.3333, lambda=0.5 
- Fold07.Rep09: alpha=0.3333, lambda=0.5 
+ Fold07.Rep09: alpha=0.4444, lambda=0.5 
- Fold07.Rep09: alpha=0.4444, lambda=0.5 
+ Fold07.Rep09: alpha=0.5556, lambda=0.5 
- Fold07.Rep09: alpha=0.5556, lambda=0.5 
+ Fold07.Rep09: alpha=0.6667, lambda=0.5 
- Fold07.Rep09: alpha=0.6667, lambda=0.5 
+ Fold07.Rep09: alpha=0.7778, lambda=0.5 
- Fold07.Rep09: alpha=0.7778, lambda=0.5 
+ Fold07.Rep09: alpha=0.8889, lambda=0.5 
- Fold07.Rep09: alpha=0.8889, lambda=0.5 
+ Fold07.Rep09: alpha=1.0000, lambda=0.5 
- Fold07.Rep09: alpha=1.0000, lambda=0.5 
+ Fold08.Rep09: alpha=0.0000, lambda=0.5 
- Fold08.Rep09: alpha=0.0000, lambda=0.5 
+ Fold08.Rep09: alpha=0.1111, lambda=0.5 
- Fold08.Rep09: alpha=0.1111, lambda=0.5 
+ Fold08.Rep09: alpha=0.2222, lambda=0.5 
- Fold08.Rep09: alpha=0.2222, lambda=0.5 
+ Fold08.Rep09: alpha=0.3333, lambda=0.5 
- Fold08.Rep09: alpha=0.3333, lambda=0.5 
+ Fold08.Rep09: alpha=0.4444, lambda=0.5 
- Fold08.Rep09: alpha=0.4444, lambda=0.5 
+ Fold08.Rep09: alpha=0.5556, lambda=0.5 
- Fold08.Rep09: alpha=0.5556, lambda=0.5 
+ Fold08.Rep09: alpha=0.6667, lambda=0.5 
- Fold08.Rep09: alpha=0.6667, lambda=0.5 
+ Fold08.Rep09: alpha=0.7778, lambda=0.5 
- Fold08.Rep09: alpha=0.7778, lambda=0.5 
+ Fold08.Rep09: alpha=0.8889, lambda=0.5 
- Fold08.Rep09: alpha=0.8889, lambda=0.5 
+ Fold08.Rep09: alpha=1.0000, lambda=0.5 
- Fold08.Rep09: alpha=1.0000, lambda=0.5 
+ Fold09.Rep09: alpha=0.0000, lambda=0.5 
- Fold09.Rep09: alpha=0.0000, lambda=0.5 
+ Fold09.Rep09: alpha=0.1111, lambda=0.5 
- Fold09.Rep09: alpha=0.1111, lambda=0.5 
+ Fold09.Rep09: alpha=0.2222, lambda=0.5 
- Fold09.Rep09: alpha=0.2222, lambda=0.5 
+ Fold09.Rep09: alpha=0.3333, lambda=0.5 
- Fold09.Rep09: alpha=0.3333, lambda=0.5 
+ Fold09.Rep09: alpha=0.4444, lambda=0.5 
- Fold09.Rep09: alpha=0.4444, lambda=0.5 
+ Fold09.Rep09: alpha=0.5556, lambda=0.5 
- Fold09.Rep09: alpha=0.5556, lambda=0.5 
+ Fold09.Rep09: alpha=0.6667, lambda=0.5 
- Fold09.Rep09: alpha=0.6667, lambda=0.5 
+ Fold09.Rep09: alpha=0.7778, lambda=0.5 
- Fold09.Rep09: alpha=0.7778, lambda=0.5 
+ Fold09.Rep09: alpha=0.8889, lambda=0.5 
- Fold09.Rep09: alpha=0.8889, lambda=0.5 
+ Fold09.Rep09: alpha=1.0000, lambda=0.5 
- Fold09.Rep09: alpha=1.0000, lambda=0.5 
+ Fold10.Rep09: alpha=0.0000, lambda=0.5 
- Fold10.Rep09: alpha=0.0000, lambda=0.5 
+ Fold10.Rep09: alpha=0.1111, lambda=0.5 
- Fold10.Rep09: alpha=0.1111, lambda=0.5 
+ Fold10.Rep09: alpha=0.2222, lambda=0.5 
- Fold10.Rep09: alpha=0.2222, lambda=0.5 
+ Fold10.Rep09: alpha=0.3333, lambda=0.5 
- Fold10.Rep09: alpha=0.3333, lambda=0.5 
+ Fold10.Rep09: alpha=0.4444, lambda=0.5 
- Fold10.Rep09: alpha=0.4444, lambda=0.5 
+ Fold10.Rep09: alpha=0.5556, lambda=0.5 
- Fold10.Rep09: alpha=0.5556, lambda=0.5 
+ Fold10.Rep09: alpha=0.6667, lambda=0.5 
- Fold10.Rep09: alpha=0.6667, lambda=0.5 
+ Fold10.Rep09: alpha=0.7778, lambda=0.5 
- Fold10.Rep09: alpha=0.7778, lambda=0.5 
+ Fold10.Rep09: alpha=0.8889, lambda=0.5 
- Fold10.Rep09: alpha=0.8889, lambda=0.5 
+ Fold10.Rep09: alpha=1.0000, lambda=0.5 
- Fold10.Rep09: alpha=1.0000, lambda=0.5 
+ Fold01.Rep10: alpha=0.0000, lambda=0.5 
- Fold01.Rep10: alpha=0.0000, lambda=0.5 
+ Fold01.Rep10: alpha=0.1111, lambda=0.5 
- Fold01.Rep10: alpha=0.1111, lambda=0.5 
+ Fold01.Rep10: alpha=0.2222, lambda=0.5 
- Fold01.Rep10: alpha=0.2222, lambda=0.5 
+ Fold01.Rep10: alpha=0.3333, lambda=0.5 
- Fold01.Rep10: alpha=0.3333, lambda=0.5 
+ Fold01.Rep10: alpha=0.4444, lambda=0.5 
- Fold01.Rep10: alpha=0.4444, lambda=0.5 
+ Fold01.Rep10: alpha=0.5556, lambda=0.5 
- Fold01.Rep10: alpha=0.5556, lambda=0.5 
+ Fold01.Rep10: alpha=0.6667, lambda=0.5 
- Fold01.Rep10: alpha=0.6667, lambda=0.5 
+ Fold01.Rep10: alpha=0.7778, lambda=0.5 
- Fold01.Rep10: alpha=0.7778, lambda=0.5 
+ Fold01.Rep10: alpha=0.8889, lambda=0.5 
- Fold01.Rep10: alpha=0.8889, lambda=0.5 
+ Fold01.Rep10: alpha=1.0000, lambda=0.5 
- Fold01.Rep10: alpha=1.0000, lambda=0.5 
+ Fold02.Rep10: alpha=0.0000, lambda=0.5 
- Fold02.Rep10: alpha=0.0000, lambda=0.5 
+ Fold02.Rep10: alpha=0.1111, lambda=0.5 
- Fold02.Rep10: alpha=0.1111, lambda=0.5 
+ Fold02.Rep10: alpha=0.2222, lambda=0.5 
- Fold02.Rep10: alpha=0.2222, lambda=0.5 
+ Fold02.Rep10: alpha=0.3333, lambda=0.5 
- Fold02.Rep10: alpha=0.3333, lambda=0.5 
+ Fold02.Rep10: alpha=0.4444, lambda=0.5 
- Fold02.Rep10: alpha=0.4444, lambda=0.5 
+ Fold02.Rep10: alpha=0.5556, lambda=0.5 
- Fold02.Rep10: alpha=0.5556, lambda=0.5 
+ Fold02.Rep10: alpha=0.6667, lambda=0.5 
- Fold02.Rep10: alpha=0.6667, lambda=0.5 
+ Fold02.Rep10: alpha=0.7778, lambda=0.5 
- Fold02.Rep10: alpha=0.7778, lambda=0.5 
+ Fold02.Rep10: alpha=0.8889, lambda=0.5 
- Fold02.Rep10: alpha=0.8889, lambda=0.5 
+ Fold02.Rep10: alpha=1.0000, lambda=0.5 
- Fold02.Rep10: alpha=1.0000, lambda=0.5 
+ Fold03.Rep10: alpha=0.0000, lambda=0.5 
- Fold03.Rep10: alpha=0.0000, lambda=0.5 
+ Fold03.Rep10: alpha=0.1111, lambda=0.5 
- Fold03.Rep10: alpha=0.1111, lambda=0.5 
+ Fold03.Rep10: alpha=0.2222, lambda=0.5 
- Fold03.Rep10: alpha=0.2222, lambda=0.5 
+ Fold03.Rep10: alpha=0.3333, lambda=0.5 
- Fold03.Rep10: alpha=0.3333, lambda=0.5 
+ Fold03.Rep10: alpha=0.4444, lambda=0.5 
- Fold03.Rep10: alpha=0.4444, lambda=0.5 
+ Fold03.Rep10: alpha=0.5556, lambda=0.5 
- Fold03.Rep10: alpha=0.5556, lambda=0.5 
+ Fold03.Rep10: alpha=0.6667, lambda=0.5 
- Fold03.Rep10: alpha=0.6667, lambda=0.5 
+ Fold03.Rep10: alpha=0.7778, lambda=0.5 
- Fold03.Rep10: alpha=0.7778, lambda=0.5 
+ Fold03.Rep10: alpha=0.8889, lambda=0.5 
- Fold03.Rep10: alpha=0.8889, lambda=0.5 
+ Fold03.Rep10: alpha=1.0000, lambda=0.5 
- Fold03.Rep10: alpha=1.0000, lambda=0.5 
+ Fold04.Rep10: alpha=0.0000, lambda=0.5 
- Fold04.Rep10: alpha=0.0000, lambda=0.5 
+ Fold04.Rep10: alpha=0.1111, lambda=0.5 
- Fold04.Rep10: alpha=0.1111, lambda=0.5 
+ Fold04.Rep10: alpha=0.2222, lambda=0.5 
- Fold04.Rep10: alpha=0.2222, lambda=0.5 
+ Fold04.Rep10: alpha=0.3333, lambda=0.5 
- Fold04.Rep10: alpha=0.3333, lambda=0.5 
+ Fold04.Rep10: alpha=0.4444, lambda=0.5 
- Fold04.Rep10: alpha=0.4444, lambda=0.5 
+ Fold04.Rep10: alpha=0.5556, lambda=0.5 
- Fold04.Rep10: alpha=0.5556, lambda=0.5 
+ Fold04.Rep10: alpha=0.6667, lambda=0.5 
- Fold04.Rep10: alpha=0.6667, lambda=0.5 
+ Fold04.Rep10: alpha=0.7778, lambda=0.5 
- Fold04.Rep10: alpha=0.7778, lambda=0.5 
+ Fold04.Rep10: alpha=0.8889, lambda=0.5 
- Fold04.Rep10: alpha=0.8889, lambda=0.5 
+ Fold04.Rep10: alpha=1.0000, lambda=0.5 
- Fold04.Rep10: alpha=1.0000, lambda=0.5 
+ Fold05.Rep10: alpha=0.0000, lambda=0.5 
- Fold05.Rep10: alpha=0.0000, lambda=0.5 
+ Fold05.Rep10: alpha=0.1111, lambda=0.5 
- Fold05.Rep10: alpha=0.1111, lambda=0.5 
+ Fold05.Rep10: alpha=0.2222, lambda=0.5 
- Fold05.Rep10: alpha=0.2222, lambda=0.5 
+ Fold05.Rep10: alpha=0.3333, lambda=0.5 
- Fold05.Rep10: alpha=0.3333, lambda=0.5 
+ Fold05.Rep10: alpha=0.4444, lambda=0.5 
- Fold05.Rep10: alpha=0.4444, lambda=0.5 
+ Fold05.Rep10: alpha=0.5556, lambda=0.5 
- Fold05.Rep10: alpha=0.5556, lambda=0.5 
+ Fold05.Rep10: alpha=0.6667, lambda=0.5 
- Fold05.Rep10: alpha=0.6667, lambda=0.5 
+ Fold05.Rep10: alpha=0.7778, lambda=0.5 
- Fold05.Rep10: alpha=0.7778, lambda=0.5 
+ Fold05.Rep10: alpha=0.8889, lambda=0.5 
- Fold05.Rep10: alpha=0.8889, lambda=0.5 
+ Fold05.Rep10: alpha=1.0000, lambda=0.5 
- Fold05.Rep10: alpha=1.0000, lambda=0.5 
+ Fold06.Rep10: alpha=0.0000, lambda=0.5 
- Fold06.Rep10: alpha=0.0000, lambda=0.5 
+ Fold06.Rep10: alpha=0.1111, lambda=0.5 
- Fold06.Rep10: alpha=0.1111, lambda=0.5 
+ Fold06.Rep10: alpha=0.2222, lambda=0.5 
- Fold06.Rep10: alpha=0.2222, lambda=0.5 
+ Fold06.Rep10: alpha=0.3333, lambda=0.5 
- Fold06.Rep10: alpha=0.3333, lambda=0.5 
+ Fold06.Rep10: alpha=0.4444, lambda=0.5 
- Fold06.Rep10: alpha=0.4444, lambda=0.5 
+ Fold06.Rep10: alpha=0.5556, lambda=0.5 
- Fold06.Rep10: alpha=0.5556, lambda=0.5 
+ Fold06.Rep10: alpha=0.6667, lambda=0.5 
- Fold06.Rep10: alpha=0.6667, lambda=0.5 
+ Fold06.Rep10: alpha=0.7778, lambda=0.5 
- Fold06.Rep10: alpha=0.7778, lambda=0.5 
+ Fold06.Rep10: alpha=0.8889, lambda=0.5 
- Fold06.Rep10: alpha=0.8889, lambda=0.5 
+ Fold06.Rep10: alpha=1.0000, lambda=0.5 
- Fold06.Rep10: alpha=1.0000, lambda=0.5 
+ Fold07.Rep10: alpha=0.0000, lambda=0.5 
- Fold07.Rep10: alpha=0.0000, lambda=0.5 
+ Fold07.Rep10: alpha=0.1111, lambda=0.5 
- Fold07.Rep10: alpha=0.1111, lambda=0.5 
+ Fold07.Rep10: alpha=0.2222, lambda=0.5 
- Fold07.Rep10: alpha=0.2222, lambda=0.5 
+ Fold07.Rep10: alpha=0.3333, lambda=0.5 
- Fold07.Rep10: alpha=0.3333, lambda=0.5 
+ Fold07.Rep10: alpha=0.4444, lambda=0.5 
- Fold07.Rep10: alpha=0.4444, lambda=0.5 
+ Fold07.Rep10: alpha=0.5556, lambda=0.5 
- Fold07.Rep10: alpha=0.5556, lambda=0.5 
+ Fold07.Rep10: alpha=0.6667, lambda=0.5 
- Fold07.Rep10: alpha=0.6667, lambda=0.5 
+ Fold07.Rep10: alpha=0.7778, lambda=0.5 
- Fold07.Rep10: alpha=0.7778, lambda=0.5 
+ Fold07.Rep10: alpha=0.8889, lambda=0.5 
- Fold07.Rep10: alpha=0.8889, lambda=0.5 
+ Fold07.Rep10: alpha=1.0000, lambda=0.5 
- Fold07.Rep10: alpha=1.0000, lambda=0.5 
+ Fold08.Rep10: alpha=0.0000, lambda=0.5 
- Fold08.Rep10: alpha=0.0000, lambda=0.5 
+ Fold08.Rep10: alpha=0.1111, lambda=0.5 
- Fold08.Rep10: alpha=0.1111, lambda=0.5 
+ Fold08.Rep10: alpha=0.2222, lambda=0.5 
- Fold08.Rep10: alpha=0.2222, lambda=0.5 
+ Fold08.Rep10: alpha=0.3333, lambda=0.5 
- Fold08.Rep10: alpha=0.3333, lambda=0.5 
+ Fold08.Rep10: alpha=0.4444, lambda=0.5 
- Fold08.Rep10: alpha=0.4444, lambda=0.5 
+ Fold08.Rep10: alpha=0.5556, lambda=0.5 
- Fold08.Rep10: alpha=0.5556, lambda=0.5 
+ Fold08.Rep10: alpha=0.6667, lambda=0.5 
- Fold08.Rep10: alpha=0.6667, lambda=0.5 
+ Fold08.Rep10: alpha=0.7778, lambda=0.5 
- Fold08.Rep10: alpha=0.7778, lambda=0.5 
+ Fold08.Rep10: alpha=0.8889, lambda=0.5 
- Fold08.Rep10: alpha=0.8889, lambda=0.5 
+ Fold08.Rep10: alpha=1.0000, lambda=0.5 
- Fold08.Rep10: alpha=1.0000, lambda=0.5 
+ Fold09.Rep10: alpha=0.0000, lambda=0.5 
- Fold09.Rep10: alpha=0.0000, lambda=0.5 
+ Fold09.Rep10: alpha=0.1111, lambda=0.5 
- Fold09.Rep10: alpha=0.1111, lambda=0.5 
+ Fold09.Rep10: alpha=0.2222, lambda=0.5 
- Fold09.Rep10: alpha=0.2222, lambda=0.5 
+ Fold09.Rep10: alpha=0.3333, lambda=0.5 
- Fold09.Rep10: alpha=0.3333, lambda=0.5 
+ Fold09.Rep10: alpha=0.4444, lambda=0.5 
- Fold09.Rep10: alpha=0.4444, lambda=0.5 
+ Fold09.Rep10: alpha=0.5556, lambda=0.5 
- Fold09.Rep10: alpha=0.5556, lambda=0.5 
+ Fold09.Rep10: alpha=0.6667, lambda=0.5 
- Fold09.Rep10: alpha=0.6667, lambda=0.5 
+ Fold09.Rep10: alpha=0.7778, lambda=0.5 
- Fold09.Rep10: alpha=0.7778, lambda=0.5 
+ Fold09.Rep10: alpha=0.8889, lambda=0.5 
- Fold09.Rep10: alpha=0.8889, lambda=0.5 
+ Fold09.Rep10: alpha=1.0000, lambda=0.5 
- Fold09.Rep10: alpha=1.0000, lambda=0.5 
+ Fold10.Rep10: alpha=0.0000, lambda=0.5 
- Fold10.Rep10: alpha=0.0000, lambda=0.5 
+ Fold10.Rep10: alpha=0.1111, lambda=0.5 
- Fold10.Rep10: alpha=0.1111, lambda=0.5 
+ Fold10.Rep10: alpha=0.2222, lambda=0.5 
- Fold10.Rep10: alpha=0.2222, lambda=0.5 
+ Fold10.Rep10: alpha=0.3333, lambda=0.5 
- Fold10.Rep10: alpha=0.3333, lambda=0.5 
+ Fold10.Rep10: alpha=0.4444, lambda=0.5 
- Fold10.Rep10: alpha=0.4444, lambda=0.5 
+ Fold10.Rep10: alpha=0.5556, lambda=0.5 
- Fold10.Rep10: alpha=0.5556, lambda=0.5 
+ Fold10.Rep10: alpha=0.6667, lambda=0.5 
- Fold10.Rep10: alpha=0.6667, lambda=0.5 
+ Fold10.Rep10: alpha=0.7778, lambda=0.5 
- Fold10.Rep10: alpha=0.7778, lambda=0.5 
+ Fold10.Rep10: alpha=0.8889, lambda=0.5 
- Fold10.Rep10: alpha=0.8889, lambda=0.5 
+ Fold10.Rep10: alpha=1.0000, lambda=0.5 
- Fold10.Rep10: alpha=1.0000, lambda=0.5 
Aggregating results
Selecting tuning parameters
Fitting alpha = 0, lambda = 0.5 on full training set
![](Project_Summary_files/figure-html/unnamed-chunk-13-1.png)<!-- -->![](Project_Summary_files/figure-html/unnamed-chunk-13-2.png)<!-- -->![](Project_Summary_files/figure-html/unnamed-chunk-13-3.png)<!-- -->

### Compare models

Call:
summary.resamples(object = res)

Models: LinearModel, Ridge, Lasso, ElasticNet 
Number of resamples: 100 

MAE 
                Min.  1st Qu.   Median     Mean  3rd Qu.     Max. NA's
LinearModel 14032.36 18302.13 20071.39 20180.27 21938.96 28077.76    0
Ridge       13923.33 17471.75 18736.63 18965.20 20179.23 25319.87    0
Lasso       13817.13 18189.67 19800.13 19927.54 21728.75 26754.15    0
ElasticNet  13923.33 17471.75 18736.63 18965.20 20179.23 25319.87    0

RMSE 
                Min.  1st Qu.   Median     Mean  3rd Qu.     Max. NA's
LinearModel 18058.53 27185.77 34738.45 37454.26 46971.55 66452.71    0
Ridge       17854.41 25817.47 29254.79 31736.64 36004.72 56045.50    0
Lasso       17845.21 26933.55 34736.66 36695.90 44366.66 59383.61    0
ElasticNet  17854.41 25817.47 29254.79 31736.64 36004.72 56045.50    0

Rsquared 
                 Min.   1st Qu.    Median      Mean   3rd Qu.      Max.
LinearModel 0.5197496 0.6878144 0.8184917 0.7891579 0.8799695 0.9498806
Ridge       0.5973240 0.8248152 0.8578121 0.8414964 0.8877832 0.9466077
Lasso       0.5304935 0.7054706 0.8234019 0.7957754 0.8822043 0.9506604
ElasticNet  0.5973240 0.8248152 0.8578121 0.8414964 0.8877832 0.9466077
            NA's
LinearModel    0
Ridge          0
Lasso          0
ElasticNet     0

![](Project_Summary_files/figure-html/unnamed-chunk-14-1.png)<!-- -->![](Project_Summary_files/figure-html/unnamed-chunk-14-2.png)<!-- -->

### Predictions wiith the training data
### RMSE
[1] 24122.12

### Predictions with test data
### RMSE

```
## Warning in house.train$SalePrice - elas_pred1: longer object length is not
## a multiple of shorter object length
```

[1] 109695.5


### RandomForest regression model
### Importance plot
![](Project_Summary_files/figure-html/unnamed-chunk-17-1.png)<!-- -->

### Conclussion 
We have obtained a pretty good model using Linear regression, Ridge regression, Lasso regression, Elastic Net regression and RandomForest. Athough there are other good machine learning model that could also be used for this project. Elastic Net regression has done better after comparing it with other regression models that can be seen above. More feature engeneering could be carried out on this data to get a more reduced RMSE score. I plan to revisit this project and do this in the future and also use some other techniques.
