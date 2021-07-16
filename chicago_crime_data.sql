-- number of null values in CASE NUMBER
select count(*) from chicago_crime_data where case_number is null;


-- All crimes that invlove arrest
select * from chicago_crime_data where arrest = 'TRUE';



-- Total number of community area
select count(community_area_number) from census_data cd;


-- Number of crimes commited in 2004
select * from chicago_crime_data where DATE  like '2004%';



-- total number of schools  in the dataset
select count('school_id') from chicago_public_schools;



-- max value of hardship index in the data set
select max(hardship_index) from census_data;



-- community area with highest hardship index 
select community_area_name from census_data 
where hardship_index = (select max(hardship_index) from census_data);



-- community areas with per capita income greater than $7000
select community_area_name, per_capita_income from census_data where per_capita_income > 70000;



-- schools within community area of hardship index  greater than 50
select cps.name_of_school, cd.hardship_index from census_data cd, chicago_public_schools cps
where cps.community_area_number=cd.community_area_number and cd.hardship_index>50; 



-- community area where crimes are related to retail theft
select cd.community_area_name, ccd.primary_type, ccd.description from chicago_crime_data ccd, census_data cd 
where ccd.community_area_number=cd.community_area_number and ccd.description like 'RETAIL%';



-- Number of retail theft crimes by community area
select count(cd.community_area_name) as #_of_retail_theft_crimes, cd.community_area_name from chicago_crime_data ccd, census_data cd 
where ccd.community_area_number=cd.community_area_number and ccd.description like 'RETAIL%'
group by cd.community_area_name
order by #_of_retail_theft_crimes DESC;


















