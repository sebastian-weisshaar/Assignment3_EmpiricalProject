*create monthts and set as time-variable
gen mdate=mofd(observation_date)
format mdate %tm
tsset mdate

*Interpolation
ipolate Unemployment mdate, gen(unemployment_inter)

regress inflation L5.inflation  unemployment_inter L.unemployment_inter L2.unemployment_inter energy working_population L8.unemployment_inter L12.unemployment_inter, robust

regress difference_inflation unemployment_inter L.unemployment_inter L2.unemployment_inter energy working_population L3.unemployment_inter L4.unemployment_inter, robust

regress inflation L.inflation unemployment_inter L.unemployment_inter L2.unemployment_inter energy working_population jpn_usa jpn_australia jp_china

