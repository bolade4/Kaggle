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

![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-3-1.png)<!unnamed-chunk-3-1.png>

The above plot shows the relationship between the different categories of GrLiveArea (Above grade (ground) living area square feet and the salePrice of homes. There tend to be a padering of positive regression between some of the different categories of GrLivArea and the SalePrice. This variable kind of show a rate of importance towards the model.

**Neighborhood, SalePrice Relationship**
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-4-1.png)<!chunk-4-1.png>
This is also a good variable that shows some strength towards the model that will be built. It shows a good relationship towards knowing the price of houses in different area in the region. Although, there seems to be some outliers in the variable which could also be seen in the statistical summary of the dataset.

**HouseStyle, SalePrice Relationship**
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-5-1.png)<!unnamed-chunk-5-1.png>
Wheather it is a one story building or two, this boxplot shows the relationship between the HouseStyle and the SalePrice of homes in this area. It has some good view of the average prices of any kind of house in this area which could also be a good fit towards the goal of this project. It has some outliers in it as well.

![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-6-1.png)<!unnamed-chunk-6-1.png>
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
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-9-1.png)<!unnamed-chunk-9-1.png>

This is the correlation plot between the different continuous variables in the dataset. Some of the variables are strongly correlated with some are sligthly correlated with each other.

### Skewing the dataset
The dataset is skewwed for more statistical preparation of the dataset for normal propability distribution. With this the data wasn't perfectly symmetrical but tend to be highly skewed.

## Building the model

### Cross Validation for LR, Ridge, Lasso and Elastic Reg
I used cross validation for the dataset in final preparation on it before building the model. 10k fold cross validation after which the model was built.

### Linear regression
Linear regression was used to build the model with three other.

![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-10-1.png)<!unnamed-chunk-10-1.png>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-10-2.png)<!unnamed-chunk-10-2.png>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-10-3.png)<!unnamed-chunk-10-3.png>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-10-4.png)<!unnamed-chunk-10-4.png>

### Ridge regression model
Aggregating results
Selecting tuning parameters
Fitting alpha = 0, lambda = 1 on full training set
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-11-1.png)<!unnamed-chunk-11-1.png>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-11-2.png)<!unnamed-chunk-11-2.png>

### Lasso regression model
Aggregating results
Selecting tuning parameters
Fitting alpha = 1, lambda = 0.5 on full training set
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-12-1.png)<!unnamed-chunk-12-1.png>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-12-2.png)<!unnamed-chunk-12-2.png>

### Elastic net regression
Aggregating results
Selecting tuning parameters
Fitting alpha = 0, lambda = 0.5 on full training set
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-13-1.png)<!unnamed-chunk-13-1.png>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-13-2.png)<!unnamed-chunk-13-2.png>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-13-3.png)<!unnamed-chunk-13-3.png>

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

![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-14-1.png)<!unnamed-chunk-14-1.png>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-14-2.png)<!unnamed-chunk-14-2.png>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-14-3.png)<!unnamed-chunk-14-3.png>

### Predictions wiith the training data
### RMSE
[1] 24122.12

### Predictions with test data
### RMSE
[1] 109695.5


### RandomForest regression model
### Importance plot
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-17-1.png)<!unnamed-chunk-17-1.png>

### Conclussion 
We have obtained a pretty good model using Linear regression, Ridge regression, Lasso regression, Elastic Net regression and RandomForest. Athough there are other good machine learning model that could also be used for this project. Elastic Net regression has done better after comparing it with other regression models that can be seen above. More feature engeneering could be carried out on this data to get a more reduced RMSE score. I plan to revisit this project and do this in the future and also use some other techniques.
