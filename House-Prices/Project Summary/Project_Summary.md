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

### EAD

I tried to do some basic graph to understand the data more and to discover some relationship between the different observations in the dataset.

**GrLivArea, SalePrice Relationship**

![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-3-1.png)  
<!GrLivArea, SalePrice Relationship>

The above plot shows the relationship between the different categories of GrLiveArea (Above grade (ground) living area square feet and the salePrice of homes. There tend to be a padering of positive regression between some of the different categories of GrLivArea and the SalePrice. This variable kind of show a rate of importance towards the model.

**Neighborhood, SalePrice Relationship**
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-4-1.png)  
<Neighborhood, SalePrice Relationship>
This is also a good variable that shows some strength towards the model that will be built. It shows a good relationship towards knowing the price of houses in different area in the region. Although, there seems to be some outliers in the variable which could also be seen in the statistical summary of the dataset.

**HouseStyle, SalePrice Relationship**
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-5-1.png)  
<!HouseStyle, SalePrice Relationship>
Wheather it is a one story building or two, this boxplot shows the relationship between the HouseStyle and the SalePrice of homes in this area. It has some good view of the average prices of any kind of house in this area which could also be a good fit towards the goal of this project. It has some outliers in it as well.

![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-6-1.png)  
<!Statistical Histogram>
Doing some more exploratory analysis on the data, the guassian method was used to do some data transformation which could be seen in the graph above. The graph is an histogram used to do some statistical analysis on the dataset. It is a comparison of the normal data histogram and also apply the gaussian on the data with different variables.

### Outliers
The data has some quite number outliers. First, there was a little bit of feature engineering being done. Some of the observations has a lot of zeros that do not relate to the dataset that converted into NA's before treating the outliers accordingly with a function that detect and print out the outliers and another function was written that fix the outliers by converting them into NA's in the data.

### Missing values
The data also has a lot of missing data. Also, while engineering some features especially from the categorical variables, many of which the NA's are engineered into 'None' due to the viewing and understanding of the dataset. Below are the percentages of missing data of each variable in the dataset.  
[1] 0.05980216

The missing data were fixed using imputation. I used the randomForest to do this with the missForest.

### Correlataions
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-9-1.png)  
<!Correlation Plot>

This is the correlation plot between the different continuous variables in the dataset. Some of the variables are strongly correlated with some are sligthly correlated with each other.

### Skewing the dataset
The dataset is skewwed for more statistical preparation of the dataset for normal propability distribution. With this the data wasn't perfectly symmetrical but tend to be highly skewed.

## Building the model

### Cross Validation for LR, Ridge, Lasso and Elastic Reg
I used cross validation for the dataset in final preparation on it before building the model. 10k fold cross validation after which the model was built.

### Linear regression
Linear regression was used to build the model with three other.

![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-10-1.png)  
<!Residual vs Fitted>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-10-2.png)  
<!Standardize Residuals>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-10-3.png)  
<!Standardize Residuals Suare Root>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-10-4.png)  
<!Residuals vs Leverage>

### Ridge regression model
Aggregating results
Selecting tuning parameters
Fitting alpha = 0, lambda = 1 on full training set
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-11-1.png)  
<!Log Lambda>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-11-2.png)  
<!Fraction Deviance plot>

### Lasso regression model
Aggregating results
Selecting tuning parameters
Fitting alpha = 1, lambda = 0.5 on full training set
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-12-1.png)  
<!Log Lambda>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-12-2.png)  
<!Fraction Deviance plot>

### Elastic net regression
Aggregating results
Selecting tuning parameters
Fitting alpha = 0, lambda = 0.5 on full training set
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-13-1.png)  
<!Log Lambda>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-13-2.png)  
<!Fraction Deviance plot>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-13-3.png)  
<!Variable importance>

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

![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-14-1.png)  
<RMSE plot>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-14-2.png)
 <!RMSE graph>
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-14-3.png)
 <Variable Importance>

### Predictions wiith the training data
### RMSE
[1] 24122.12

### Predictions with test data
### RMSE
[1] 109695.5


### RandomForest regression model
### Importance plot
![](https://github.com/bolade4/Kaggle/blob/master/House-Prices/Images/unnamed-chunk-17-1.png)  
<!Variable importance>

### Conclussion 
We have obtained a pretty good model using Linear regression, Ridge regression, Lasso regression, Elastic Net regression and RandomForest. Athough there are other good machine learning model that could also be used for this project. Elastic Net regression has done better after comparing it with other regression models that can be seen above. More feature engeneering could be carried out on this data to get a more reduced RMSE score. I plan to revisit this project and do this in the future and also use some other techniques.
