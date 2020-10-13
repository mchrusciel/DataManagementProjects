# Homework 05

## Scoot-Share

![https://github.com/nyu-csci-ua-0480-003-fall-2019/mchrusciel-homework05/blob/402bb9ef52fe15e64d34d12fe0340719332ac79a/ERDiagram%20(1).png](er-diagram.png)

* TODO: 
    - Initially realized that I should have two tables - Customer and Scooter at the least
    - After initially filling in information for Customer, I thought that contact information, referrals, and payment info could each be   
      separate tables.
    - Next, I realized that the relationships between Customers and Scooters was many-to-many, yet there needed to be an intermediary table to 
      enforce a one-to-one relationship between a customer and a scooter since a customer can only have one scooter out at a time - I then   
      created the Rental Table
    - Furthermore, I could break up scooter into individual manufacturers to maintain 2nd normal form
    - I also created separate Damages , and Notes tables to enforce 2nd and 3rd Normal form.
    
* TODO: a list of assumptions

    - I had to assume that the payment information would have to be handled on its own
    - I had to assume that lots of fields would have to be not Null - ids, names, dates, etc.
    - I also had to assume that I could break up notes in the way I did - with having a separate text table that would have all the free form text information

Scripts

* [https://github.com/nyu-csci-ua-0480-003-fall-2019/mchrusciel-homework05/blob/94ed2b9d5c16bca2e4cc921a7ff9fe2e2fa5c278/part-1-scoot-share-create.sql](part-1-scoot-share-create.sql)
* [https://github.com/nyu-csci-ua-0480-003-fall-2019/mchrusciel-homework05/blob/94ed2b9d5c16bca2e4cc921a7ff9fe2e2fa5c278/part-1-scoot-share-queries.sql](part-1-scoot-share-queries.sql)

## Normalization

* [https://github.com/nyu-csci-ua-0480-003-fall-2019/mchrusciel-homework05/blob/94ed2b9d5c16bca2e4cc921a7ff9fe2e2fa5c278/part-2-normalization-create.sql](part-2-normalization-create.sql)
* [https://github.com/nyu-csci-ua-0480-003-fall-2019/mchrusciel-homework05/blob/94ed2b9d5c16bca2e4cc921a7ff9fe2e2fa5c278/part-2-normalization-import.sql](part-2-normalization-import.sql)
* [https://github.com/nyu-csci-ua-0480-003-fall-2019/mchrusciel-homework05/blob/94ed2b9d5c16bca2e4cc921a7ff9fe2e2fa5c278/part-2-normalization-queries.sql](part-2-normalization-queries.sql)
