gen y = 农村居民消费水平
gen x1 = 乡村就业人员
gen x2 = 农村居民消费价格指数
gen x3 = 农村居民人均可支配收入
gen x4 = 国内生产总值
gen lny =ln(y)
gen lnx1 = ln(x1)
gen lnx2 = ln(x2)
gen lnx3 = ln(x3)
gen lnx4 = ln(x4)

scatter lny lnx1
scatter lny lnx2
scatter lny lnx3
scatter lny lnx4

tsset 年份
gen dlny = D.lny
gen dlnx1 = D.lnx1
gen dlnx2 = D.lnx2
gen dlnx3 = D.lnx3
gen dlnx4 = D.lnx4
gen d2lny = D.dlny
gen d2lnx1 = D.dlnx1
gen d2lnx2 = D.dlnx2
gen d2lnx3 = D.dlnx3
gen d2lnx4 = D.dlnx4

dfuller d2lny
dfuller d2lnx1
dfuller d2lnx2
dfuller d2lnx3
dfuller d2lnx4

johans y x1 x2 x3 x4, lags(2)

reg lny lnx1 lnx2 lnx3 lnx4
pwcorr lny lnx1 lnx2 lnx3 lnx4
estat vif
sw reg lny lnx1 lnx2 lnx3 lnx4,pe(0.05)
imtest,white
reg lny lnx1 lnx3
estat dwatson
estat bgodfrey,lags(1)
imtest,white
reg lny lnx1 lnx3,r
