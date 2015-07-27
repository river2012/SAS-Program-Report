
************************************import data;
PROC IMPORT OUT= WORK.projectdata DATAFILE= "C:\Users\Wentianfu Zhang\Desktop\STA402-SAS\TermProject\AcademicInstitutionsProfileNationwide.xls" 
            DBMS=xls;
     SHEET="Data"; 
     GETNAMES=YES;
RUN;

************************************create all formats;
proc format;
	value womens
	0='No'
	1='Yes';
run;
proc format;
	value hsi
	0='No'
	1='Yes';
run;
proc format;
	value msi
	0='No'
	1='Yes';
run;
proc format;
	value hbcu
	0='No'
	1='Yes';
run;
proc format;
	value tribal
	0='No'
	1='Yes';
run;

proc format;
	value obereg	
0='US Service schools'
1='New England CT ME MA NH RI VT'
2='Mid East DE DC MD NJ NY PA'
3='Great Lakes IL IN MI OH WI'
4='Plains IA KS MN MO NE ND SD'
5='Southeast AL AR FL GA KY LA MS NC SC TN VA WV'
6='Southwest AZ NM OK TX'
7='Rocky Mountains CO ID MT UT WY'
8='Far West AK CA HI NV OR WA'
9='Outlying areas AS FM GU MH MP PR PW VI';
run;

proc format;
	value control
	1='Public'
	2='Private not-for-profit'
	3='Private for-profit';
run;

proc format;
	value cc
	-3='Not classified'
	15='Doctoral/Research Universities: Extensive'
	16='Doctoral/Research Universities: Intensive'
	21='Masters Colleges and Universities I'
	22='Masters Colleges and Universities II'
	31='Baccalaureate Colleges: Liberal Arts'
	32='Baccalaureate Colleges: General'
	33='Baccalaureate/Associates Colleges'
	40='Associates Colleges'
	51='Specialized: Theological seminaries'
	52='Specialized: Medical schools and medical centers'
	53='Specialized: Other separate health profession schools'
	54='Specialized: Schools of engineering and technology'
	55='Specialized: Schools of business and management'
	56='Specialized: Schools of art, music, and design'
	57='Specialized: Schools of law'
	58='Specialized: Teachers colleges'
	59='Specialized: Other'
	60='Tribal colleges and universities';
run;

proc format;
	value enrprofile
	1='Exclusively undergraduate two-year'
	2='Exclusively undergraduate four-year'
	3='Very high undergraduate'
	4='High undergraduate'
	5='Majority undergraduate'
	6='Majority graduate/professional'
	7='Exclusively graduate/professional';
run;

proc format;
	value ipug
	-2='(Special focus institution)'
	-1='(Not applicable)'
	0='(Not classified)'
	1='Associates'
	2='Associates Dominant'
	3='Arts & sciences focus, no graduate coexistence'
	4='Arts & sciences focus, some graduate coexistence'
	5='Arts & sciences focus, high graduate coexistence'
	6='Arts & sciences plus professions, no graduate coexistence'
	7='Arts & sciences plus professions, some graduate coexistence'
	8='Arts & sciences plus professions, high graduate coexistence'
	9='Balanced arts & sciences/professions, no graduate coexistence'
	10='Balanced arts & sciences/professions, some graduate coexistence'
	11=	'Balanced arts & sciences/professions, high graduate coexistence'
	12=	'Professions plus arts & sciences, no graduate coexistence'
	13=	'Professions plus arts & sciences, some graduate coexistence'
	14=	'Professions plus arts & sciences, high graduate coexistence'
	15=	'Professions focus, no graduate coexistence'
	16=	'Professions focus, some graduate coexistence'
	17=	'Professions focus, high graduate coexistence';
run;

proc format;
	value ipgrad
-2='(Special focus institution)'
-1='(Not applicable)'
0='(Not classified)'
1='Single postbaccalaureate (education)'
2='Single postbaccalaureate (business)'
3='Single postbaccalaureate (other field)'
4='Postbaccalaureate comprehensive'
5='Postbaccalaureate, arts & sciences dominant'
6='Postbaccalaureate with arts & sciences (education dominant)'
7='Postbaccalaureate with arts & sciences (business dominant)'
8='Postbaccalaureate with arts & sciences (other dominant fields)'
9='Postbaccalaureate professional (education dominant)'
10='Postbaccalaureate professional (business dominant)'
11='Postbaccalaureate professional (other dominant fields)'
12='Single doctoral (education)'
13='Single doctoral (other field)'
14='Comprehensive doctoral with medical/veterinary'
15='Comprehensive doctoral (no medical/veterinary)'
16='Doctoral, humanities/social sciences dominant'
17='Doctoral, STEM dominant'
18='Doctoral, professional dominant';
run;

proc format;
	value sizeset
-2='(Special focus institution)'
-1='(Not applicable)'
0='(Not classified)'
1='Very small two-year'
2='Small two-year'
3='Medium two-year'
4='Large two-year'
5='Very large two-year'
6='Very small four-year, primarily nonresidential'
7='Very small four-year, primarily residential'
8='Very small four-year, highly residential'
9='Small four-year, primarily nonresidential'
10='Small four-year, primarily residential'
11='Small four-year, highly residential'
12='Medium four-year, primarily nonresidential'
13='Medium four-year, primarily residential'
14='Medium four-year, highly residential'
15='Large four-year, primarily nonresidential'
16='Large four-year, primarily residential'
17='Large four-year, highly residential'
18='Exclusively graduate/professional';
run;

proc format;
	value locale
-3='{Not available}'
11='City Large'
12='City Midsize'
13=	'City Small'
21=	'Suburb Large'
22=	'Suburb Midsize'
23=	'Suburb Small'
31=	'Town Fringe'
32=	'Town Distant'
33=	'Town Remote'
41=	'Rural Fringe'
42=	'Rural Distant'
43=	'Rural Remote'
;
run;


******************************user input window; 
%window search color=white       
  #1 @55 'Welcome to School Search SAS Program.' attr=highlight
  #3 @50 'Please enter at least one search criterion below:'

  #5 @5 'School Name:'       
  #5 @20 NAME 40 attr=underline  
  #5 @75 'You may specify a State or choose a Geographic Region.'

  #7 @5 'City:'            
  #7 @20 CITY 40 attr=underline
  #7 @75 'State (for example, OH):'
  #7 @100 STATE 5 attr=underline

  #11 @5 'Geographic Region:'       
  #11 @55 OBEREG 5 attr=underline
#10 @75 'Geographic Region Options:'
#11 @75 '0-US Service schools'
#11 @110 '1-New England CT ME MA NH RI VT'
#12 @75 '2-Mid East DE DC MD NJ NY PA'
#12 @110 '3-Great Lakes IL IN MI OH WI'
#13 @75 '4-Plains IA KS MN MO NE ND SD'
#13 @110 '5-Southeast AL AR FL GA KY LA MS NC SC TN VA WV'
#14 @75 '6-Southwest AZ NM OK TX'
#14 @110 '7-Rocky Mountains CO ID MT UT WY'
#15 @75 '8-Far West AK CA HI NV OR WA'
#15 @110 '9-Outlying areas AS FM GU MH MP PR PW VI'

  #13 @5 'School Type:'       
  #13 @55 CONTROL 5 attr=underline
  #14 @8 '1-Public, 2-Private not-for-profit'
  #15 @8 '3-Private for-profit'

  #17 @5 'School Basic Classification:'       
  #17 @55 CC2000 5 attr=underline
#18 @75 'School Basic Classification Options: '
#19 @75 '15-Doctoral/Research Universities: Extensive'
#20 @75 '16-Doctoral/Research Universities: Intensive'
#21 @75 '21-Masters Colleges and Universities I'
#22 @75 '22-Masters Colleges and Universities II'
#23 @75 '31-Baccalaureate Colleges: Liberal Arts'
#23 @120 '32-Baccalaureate Colleges: General'
#24 @75 '33-Baccalaureate/Associates Colleges'
#24 @120 '40-Associates Colleges'
#25 @75 '51-Specialized: Theological seminaries'
#26 @75 '52-Specialized: Medical schools and medical centers'
#27 @75 '53-Specialized: Other separate health profession schools'
#28 @75 '54-Specialized: Schools of engineering and technology'
#29 @75 '55-Specialized: Schools of business and management'
#30 @75 '56-Specialized: Schools of art, music, and design'
#31 @75 '57-Specialized: Schools of law'
#32 @75 '58-Specialized: Teachers colleges'
#33 @75 '59-Specialized: Other'
#34 @75 '60-Tribal colleges and universities'

  #19 @5 'Enrollment Profile Classification:'       
  #19 @55 ENRPROFILE2010 5 attr=underline
#20 @8 '1-Exclusively undergraduate two-year'
#21 @8 '2-Exclusively undergraduate four-year'
#22 @8 '3-Very high undergraduate'
#23 @8 '4-High undergraduate'
#24 @8 '5-Majority undergraduate'
#25 @8 '6-Majority graduate/professional'
#26 @8 '7-Exclusively graduate/professional'

  #28 @5 'Other Options (Leave blank if no preference):' 
  #28 @51 '(0-No 1-Yes)'

  #29 @5 'Women College:'       
  #29 @55 WOMENS 5 attr=underline

  #31 @5 'Hispanic Serving Institution:'       
  #31 @55 HSI 5 attr=underline

  #33 @5 'Minority Serving Institution:'       
  #33 @55 MSI 5 attr=underline

  #35 @5 'Historically Black:'       
  #35 @55 HBCU 5 attr=underline

  #37 @5 'Tribal College:'       
  #37 @55 TRIBAL 5 attr=underline  

  #37 @75 'Enter how many search results to include in each table:' 
  #37 @135 N 5 attr=underline  
 
  #40 @5 'Press ENTER to search.'
  #41 @5 'Enter a directory path to export a pdf file of search results:'
  #41 @75 FOLDER 65 attr=underline
  #42 @75 '(format: C:\Users\Wentianfu Zhang\Desktop)';


/** Macro program Create Tables to generate results in tabular form and create a pdf file containing search results to users**/
%MACRO createtables(NAME=, CITY=, STATE=, OBEREG=, CC2000=, ENRPROFILE2010=, CONTROL=, WOMENS=, HSI=, MSI=, HBCU=, TRIBAL=, FOLDER=, N=);

proc sql;

create table results as
 		select NAME as School, CITY as City, STABBR as State, OBEREG as Geographic_Region, LOCALE as Urbanization, CC2000 as Basic_Category, 
CONTROL as Type, SIZESET2010 as Scale, IPUG2010 as Udergraduate_Program, IPGRAD2010 as Graduate_Program, ENRPROFILE2010 as Enrollment_Profile, 
WOMENS as Womens, HBCU as Black, MSI as Minority, HSI as Hispanic, TRIBAL as Tribal from WORK.projectdata
		where %if &NAME ^= %then %do; NAME contains "&&NAME" and %end;
	 	%if &CITY ^= %then %do; CITY = "&&CITY" and %end;
		%if &STATE ^= %then %do; STABBR = "&&STATE" and %end;
		%if &OBEREG ^= %then %do; OBEREG = &&OBEREG and %end;
		%if &CC2000 ^= %then %do; CC2000 = &&CC2000 and %end;
		%if &ENRPROFILE2010 ^= %then %do; ENRPROFILE2010 = &&ENRPROFILE2010 and %end;
		%if &CONTROL ^= %then %do; CONTROL = &&CONTROL and %end;
		%if &WOMENS ^= %then %do; WOMENS = &&WOMENS and %end;
		%if &HSI ^= %then %do; HSI = &&HSI and %end;
		%if &MSI ^= %then %do; MSI = &&MSI and %end;
		%if &HBCU ^= %then %do; HBCU = &&HBCU and %end;
		%if &TRIBAL ^= %then %do; TRIBAL = &&TRIBAL and %end; 1;

create table searchresults as 
			select * from results;

%if &CITY ^= and &NAME ^= %then %do;
create table samecityresults as 
	select NAME as School, CITY as City, STABBR as State, OBEREG as Geographic_Region, LOCALE as Urbanization, CC2000 as Basic_Category, 
CONTROL as Type, SIZESET2010 as Scale, IPUG2010 as Udergraduate_Program, IPGRAD2010 as Graduate_Program, ENRPROFILE2010 as Enrollment_Profile, 
WOMENS as Womens, HBCU as Black, MSI as Minority, HSI as Hispanic, TRIBAL as Tribal from WORK.projectdata
	where %if &CITY ^= %then %do; CITY = "&&CITY" and %end;
		%if &CC2000 ^= %then %do; CC2000 = &&CC2000 and %end;
		%if &ENRPROFILE2010 ^= %then %do; ENRPROFILE2010 = &&ENRPROFILE2010 and %end;
		%if &CONTROL ^= %then %do; CONTROL = &&CONTROL and %end;
		%if &WOMENS ^= %then %do; WOMENS = &&WOMENS and %end;
		%if &HSI ^= %then %do; HSI = &&HSI and %end;
		%if &MSI ^= %then %do; MSI = &&MSI and %end;
		%if &HBCU ^= %then %do; HBCU = &&HBCU and %end;
		%if &TRIBAL ^= %then %do; TRIBAL = &&TRIBAL and %end; 1;
%end;


%if &NAME ^= and &STATE ^= %then %do;
create table samestateresults as 
	select NAME as School, CITY as City, STABBR as State, OBEREG as Geographic_Region, LOCALE as Urbanization, CC2000 as Basic_Category, 
CONTROL as Type, SIZESET2010 as Scale, IPUG2010 as Udergraduate_Program, IPGRAD2010 as Graduate_Program ,ENRPROFILE2010 as Enrollment_Profile, 
WOMENS as Womens, HBCU as Black, MSI as Minority, HSI as Hispanic, TRIBAL as Tribal from WORK.projectdata
	where %if &STATE ^= %then %do; STABBR = "&&STATE" and %end;
		%if &CC2000 ^= %then %do; CC2000 = &&CC2000 and %end;
		%if &ENRPROFILE2010 ^= %then %do; ENRPROFILE2010 = &&ENRPROFILE2010 and %end;
		%if &CONTROL ^= %then %do; CONTROL = &&CONTROL and %end;
		%if &WOMENS ^= %then %do; WOMENS = &&WOMENS and %end;
		%if &HSI ^= %then %do; HSI = &&HSI and %end;
		%if &MSI ^= %then %do; MSI = &&MSI and %end;
		%if &HBCU ^= %then %do; HBCU = &&HBCU and %end;
		%if &TRIBAL ^= %then %do; TRIBAL = &&TRIBAL and %end; 1;
		
%end;

%if &WOMENS=1 or &HSI=1 or &MSI=1 or &HBCU=1 or &TRIBAL=1 %then %do; 
create table specialoptionresults as 
	select NAME as School, WOMENS as Womens, HBCU as Black, MSI as Minority, HSI as Hispanic, TRIBAL as Tribal, CITY as City, STABBR as State, 
OBEREG as Geographic_Region, LOCALE as Urbanization, CC2000 as Basic_Category, 
CONTROL as Type, SIZESET2010 as Scale, IPUG2010 as Udergraduate_Program, IPGRAD2010 as Graduate_Program ,ENRPROFILE2010 as Enrollment_Profile 
		from WORK.projectdata
		where %if &WOMENS ^= %then %do; WOMENS = &&WOMENS and %end;
		%if &HSI ^= %then %do; HSI = &&HSI and %end;
		%if &MSI ^= %then %do; MSI= &&MSI and %end;
		%if &HBCU ^= %then %do; HBCU = &&HBCU and %end;
		%if &TRIBAL ^= %then %do; TRIBAL = &&TRIBAL and %end; 1;
		
%end;
 
quit;

ods pdf file="&FOLDER\SearchResults&NAME&CITY&STATE&OBEREG&CC2000&ENRPROFILE2010&CONTROL&WOMENS&TRIBAL&HBCU&MSI&HSI..pdf" author="Carol Zhang" subject="Nationwide Academic Institution Profile Search";
title "Your Search Result :";
proc print data=searchresults;
	format Basic_Category cc.;
	format Type control.;
	format Enrollment_Profile enrprofile.;
	format Womens womens.;
	format Minority msi.;
	format Hispanic hsi.;
	format Tribal tribal.;
	format Black hbcu.;
	format Geographic_Region obereg.;
	format Udergraduate_Program ipug.;
	format Graduate_Program ipgrad.;
	format Scale sizeset.;
	format Urbanization locale.;
run;

title "More Schools in &CITY :";
proc print data=samecityresults (obs= %if &N ^= %then &N; %else 10;);
	format Basic_Category cc.;
	format Type control.;
	format Enrollment_Profile enrprofile.;
	format Womens womens.;
	format Minority msi.;
	format Hispanic hsi.;
	format Tribal tribal.;
	format Black hbcu.;
	format Geographic_Region obereg.;
	format Udergraduate_Program ipug.;
	format Graduate_Program ipgrad.;
	format Scale sizeset.;
	format Urbanization locale.;
run;

title "More Schools in &STATE :";
proc print data=samestateresults (obs= %if &N ^= %then &N; %else 10;);
	format Basic_Category cc.;
	format Type control.;
	format Enrollment_Profile enrprofile.;
	format Womens womens.;
	format Minority msi.;
	format Hispanic hsi.;
	format Tribal tribal.;
	format Black hbcu.;
	format Geographic_Region obereg.;
	format Udergraduate_Program ipug.;
	format Graduate_Program ipgrad.;
	format Scale sizeset.;
	format Urbanization locale.;
run;

title "Interested in other Womens/HSI/MSI/HBCU/Tribal schools? ";
proc print data=specialoptionresults (obs= %if &N ^= %then &N; %else 10;);
	format Basic_Category cc.;
	format Type control.;
	format Enrollment_Profile enrprofile.;
	format Womens womens.;
	format Minority msi.;
	format Hispanic hsi.;
	format Tribal tribal.;
	format Black hbcu.;
	format Geographic_Region obereg.;
	format Udergraduate_Program ipug.;
	format Graduate_Program ipgrad.;
	format Scale sizeset.;
	format Urbanization locale.;
run;
title "";
ods pdf close;

proc datasets library=work noprint;
   delete searchresults samecityresults samestateresults specialoptionresults;
run;
quit;

%MEND createtables;

**************************************look up for database school name if needed;
proc print data=work.projectdata;
   var NAME;
   title 'Names of All Academic Institutions Nationwide';
run;

***************************************start user interface;
%display search;  

/** Send Search items to the Log just for the record **/
%put School Name entered: &NAME || 
City entered: &CITY || 
State entered: &STATE || 
Geographic Region entered: &OBEREG || 
School Basic Classification entered: &CC2000 || 
Enrollment Profile Classification entered: &ENRPROFILE2010 || 
School Type entered: &CONTROL || 
Women College entered: &WOMENS || 
Hispanic Serving Institution entered: &HSI || 
Minority Serving Institution entered: &MSI || 
Historically Black entered: &HBCU || 
Tribal College entered: &TRIBAL ||
Directory path entered: &FOLDER ||
Desired maximum number of observations in each table to display: &N;


***************************************magic begins here;

%createtables(
NAME=&NAME, CITY=&CITY, STATE=&STATE, OBEREG=&OBEREG, CC2000=&CC2000, ENRPROFILE2010=&ENRPROFILE2010, 
CONTROL=&CONTROL, WOMENS=&WOMENS, HSI=&HSI, MSI=&MSI, HBCU=&HBCU, TRIBAL=&TRIBAL, FOLDER=&FOLDER, N=&N)





/** Some testing codes

ods pdf file="C:\Users\Wentianfu Zhang\Desktop\SearchResults.pdf" author="Carol Zhang" subject="Nationwide Academic Institution Profile Search";
ods pdf close;

proc sql;
create table tresults as 
 select NAME as School, CITY as City, STABBR as State, OBEREG as Geographic_Region, LOCALE as Urbanization, CC2000 as Basic_Category, 
CONTROL as Type, SIZESET2010 as Scale, IPUG2010 as Udergraduate_Program, IPGRAD2010 as Graduate_Program ,ENRPROFILE2010 as Enrollment_Profile, 
WOMENS as Womens, HBCU as Black, MSI as Minority, HSI as Hispanic, TRIBAL as Tribal from WORK.projectdata
 where CITY = "Oxford" and STABBR = "OH";
quit;
proc print data=tresults (obs = 10);
	format Basic_Category cc.;
	format Type control.;
	format Enrollment_Profile enrprofile.;
	format Womens womens.;
	format Minority msi.;
	format Hispanic hsi.;
	format Tribal tribal.;
	format Black hbcu.;
	format Geographic_Region obereg.;
	format Udergraduate_Program ipug.;
	format Graduate_Program ipgrad.;
	format Scale sizeset.;
	format Urbanization locale.;
run;
**/


/** Result display: 16 variables 

basic(non-numeric):NAME, CITY, STABBR

basic numeric: 
Geographic Region OBEREG
Basic Category CC2000
Udergraduate Program IPUG2010
Graduate Program IPGRAD2010
Enrollment Profile ENRPROFILE2010

other numeric: Size and Setting Classification SIZESET2010
Control of Institution(public/private n/for profit) CONTROL
Degree of Urbanization LOCALE
Historically Black College or Univerisity HBCU
Tribal College TRIBAL
Women's College WOMENS
Hispanic Serving Institution HSI
Minority Serving Institution MSI

**/






