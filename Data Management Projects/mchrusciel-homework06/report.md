# Homework 6 - CAERS Event Data

The data for this assignment can be found at:

https://www.fda.gov/food/compliance-enforcement-food/cfsan-adverse-event-reporting-system-caers

## Exploring Data from Staging Table


1. In trying to assess whether this dataset is in first normal form, I've noticed that in the terms column there
seem to be a lot of different types of medical conditions. It looks like the information in this column is not
at its most atomic level, and I could probably break this column into a separate table with separate conditions

| terms |
| :--- |
| NAUSEA |
| VOMITING |
| SLEEP DISORDER, SALIVARY GLAND DISORDER, ANXIETY |
| TENDERNESS, PAIN, MUCOSAL ULCERATION, CAUSTIC INJURY, BURNING SENSATION |
| HYPERSENSITIVITY, DYSGEUSIA |
| VOMITING, MALAISE, GASTROINTESTINAL DISORDER, FLUSHING, FEELING OF BODY TEMPERATURE CHANGE, FEELING HOT, DYSPEPSIA, BODY TEMPERATURE INCREASED, ABDOMINAL PAIN |
| LACERATION |
| FOREIGN BODY TRAUMA, CHOKING |
| INFECTION, DISCOMFORT, ABDOMINAL PAIN UPPER |
| FOREIGN BODY TRAUMA, CHOKING |
| ---------------------------- |


2. This data set decided to break up an age itself and the units of the age i.e. months, days, or years - so
if I ever wanted to explore some  aspects of the dataset concerning age, I would need to pay attention to both of these
columns

| patient\_age | age\_units |
| :--- | :--- |
| NULL | NULL |
| NULL | NULL |
| NULL | NULL |
| NULL | NULL |
| NULL | NULL |
| NULL | NULL |
| NULL | NULL |
| 64 | year\(s\) |
| NULL | NULL |
| 64 | year\(s\) |
| 69 | year\(s\) |
| 62 | year\(s\) |
| 70 | year\(s\) |
| 70 | year\(s\) |
| -------------  |

  
3. The created_date and event_date columns, both of the date type, are interesting especially once looking at the CAERS documentation
 It seems as if an event date is not a necessary requirement for a created_date to be created - I'm thinking that if
 the event date is left empty, there is a more than likely possibility that there isn't going to be patient info like
 age or sex - it looks like it does occur sometimes but not all the time
 
| caers\_event\_id | report\_id | created\_date | event\_date | product\_type | product | product\_code | description | patient\_age | age\_units | sex | terms | outcomes |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | 172940 | 2014-01-01 | NULL | SUSPECT | DANNON DANNON LITE & FIT GREEK YOGURT CHERRY | 09 |  Milk/Butter/Dried Milk Prod | NULL | NULL | NULL | NAUSEA | Other Outcome |
| 2 | 172945 | 2014-01-01 | NULL | SUSPECT | SAVORITZ ORIGINAL BUTTERY ROUND CRACKERS | 03 |  Bakery Prod/Dough/Mix/Icing | NULL | NULL | NULL | VOMITING | Other Outcome |
| 3 | 172944 | 2014-01-01 | NULL | SUSPECT | WELCH'S 100% GRAPE JUICE, FROM CONCENTRATE WITH ADDED VITAMIN C | 20 |  Fruit/Fruit Prod | NULL | NULL | NULL | SLEEP DISORDER, SALIVARY GLAND DISORDER, ANXIETY | Other Outcome |
| 4 | 172937 | 2014-01-01 | NULL | SUSPECT | DAVID'S SUNFLOWER SEEDS, RANCH FLAVORED | 23 |  Nuts/Edible Seed | NULL | NULL | NULL | TENDERNESS, PAIN, MUCOSAL ULCERATION, CAUSTIC INJURY, BURNING SENSATION | Hospitalization, Patient Visited Healthcare Provider |
| 6 | 172939 | 2014-01-01 | NULL | SUSPECT | KASHI WHOLE WHEAT BISCUITS, ISLAND VANILLA | 05 |  Cereal Prep/Breakfast Food | NULL | NULL | NULL | VOMITING, MALAISE, GASTROINTESTINAL DISORDER, FLUSHING, FEELING OF BODY TEMPERATURE CHANGE, FEELING HOT, DYSPEPSIA, BODY TEMPERATURE INCREASED, ABDOMINAL PAIN | Other Outcome |
| 8 | 172947 | 2014-01-02 | NULL | CONCOMITANT | VITAMIN C \(ASCORBIC ACID\) | 54 |  Vit/Min/Prot/Unconv Diet\(Human/Animal\) | 64 | year\(s\) | F | FOREIGN BODY TRAUMA, CHOKING | Medically Important |
| 9 | 172960 | 2014-01-02 | NULL | SUSPECT | NUTRILITE GLUCOSAMINE-7 | 54 |  Vit/Min/Prot/Unconv Diet\(Human/Animal\) | NULL | NULL | NULL | INFECTION, DISCOMFORT, ABDOMINAL PAIN UPPER | Hospitalization |
| 10 | 172947 | 2014-01-02 | NULL | SUSPECT | CITRACAL MAXIMUM \(CHOLECALCIFEROL + CALCLIUM CITRATE\) FILM-COATED TABLET | 54 |  Vit/Min/Prot/Unconv Diet\(Human/Animal\) | 64 | year\(s\) | F | FOREIGN BODY TRAUMA, CHOKING | Medically Important |
| 11 | 172949 | 2014-01-02 | NULL | SUSPECT | CENTRUM SILVER \(MULTIMINERALS, MULTIVITAMINS\) | 54 |  Vit/Min/Prot/Unconv Diet\(Human/Animal\) | 69 | year\(s\) | F | VULVOVAGINAL DISCOMFORT, VULVOVAGINAL BURNING SENSATION, MUSCULAR WEAKNESS, HEADACHE, DYSURIA, DYSPNOEA, DIZZINESS, COLITIS, ABDOMINAL PAIN | Patient Visited Healthcare Provider, Medically Important |
| ---------------------------------------------------------------------------------------------------------------------------------|


4.  4.Like the terms column, it looks like the description column is not at its most atomic level - could be broken out
into another table


| description |
| :--- |
|  Milk/Butter/Dried Milk Prod |
|  Bakery Prod/Dough/Mix/Icing |
|  Fruit/Fruit Prod |
|  Nuts/Edible Seed |
|  Nuts/Edible Seed |
|  Cereal Prep/Breakfast Food |
|  Fishery/Seafood Prod |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Milk/Butter/Dried Milk Prod |
|  Milk/Butter/Dried Milk Prod |
|  Vit/Min/Prot/Unconv Diet\(Human/Animal\) |
|  Coffee/Tea |
|-------------|


## Database Design

![ER diagram](https://pgmodeler.io/uploads/images/35bb7d0dc49824e8ec9a2b562df4a356.png)

* design decision #1
* design decision #2
* design decision #3

## Queries

### Views and Indexes


### General Queries

1. Yogurt

  | term | count\_term |
  | :--- | :--- |
  | FOO | 20169 |
  | BAR | 6520 |
  | BAZ | 5837 |
  * yogurt results are above
2. Nightmares
3. Coma Separated Symptoms
4. Product Name or Not
5. Most Recent
6. Event with Most Symptoms
7. Most Common Symptoms
8. Youngest

## Conclusion

1. Normalization Pros
2. Normalization Cons
