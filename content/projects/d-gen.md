---
title: "d-gen"
author: "Ryan Wong"
date: "2020-06-01"
slug: "d-gen"
---
  
*Updated on December 16, 2020* 
  
[d-gen](https://github.com/raulcf/d-gen) is a project that I developed as part of the [2020 CDAC Summer Lab](https://cdac.uchicago.edu/engage/summerlab/#project-profiles) 
under the mentorship of [Professor Raul Castro-Ferenandez](https://raulcastrofernandez.com). The purpose of d-gen is to synthetically 
generate relational databases that adhere to a user-defined schema for the purposes of query testing and optimization.  
  
[Relational databases](https://en.wikipedia.org/wiki/Relational_database) are databases which contain tables filled with columns and rows 
of information, which may or may not hold some sort of "relation" to each other. For example, in a school's database, you might have a 
table of student information, containing first name, last name, student ID, etc., and a table containing students enrolled in a specific 
class. Since all students enrolled in a class at a school **must also** be students of that school, there exists a *relationship* between 
the student information table and class enrollment table, where information in the class enrollment table **must also** exist in the student 
information table. This is an example of one way that data can be "related" in a database, but there exists many other ways.  
  
{{< figure src="/images/projects/d-gen/example_database.jp2" width=800 caption="Example relational database schema" >}}
  
Relational databases are very commonly used, so there is a need to optimize [queries](https://www.hostinger.com/tutorials/what-is-a-query). 
To ensure that queries are properly optimized, they should be run on data of various sizes and data containing various distributions. 
What makes optimization difficult to do is that queries are written under the premise that the database has underlying relationships and 
datatypes that the user is aware of. For example, a query written to check whether a user's age is > 18 can only be run on columns of numbers. 
As a result, users must test/optimize queries with databases that conform to the query. While our example is rather 
simplistic, it can be incredibly difficult to procure databases that conform with complex queries that use multiple tables, columns, rows, 
etc. Additionally, users looking to optimize their queries will have additional requirements regarding the size/distribution of data.
  
{{< figure src="/images/projects/d-gen/example_query.jp2" width=800 caption="Example query showing required tables/columns" >}}
  
Rather than having database users scrounge around trying to find databases, d-gen offers a method of generating random data which can 
adhere to their niche constraints. To do so, users provide d-gen a [YAML config](https://github.com/raulcf/d-gen/blob/master/example_specifications/specification_outline.md) 
which abstractly described the database's constraints. There exists multiple levels of abstraction, with users being able to define 
everything from the datatypes and properties of individual columns to defining the relationships between multiple tables. For ease of use, 
users can also define multiple columns, tables, and relationships all at once.  
  
d-gen then takes this abstract schema and converts it to a more "defined" schema, removing all abstraction and creating a more descriptive 
and conncrete schema. This, coupled with the use of random seeds, allows generated databases to be replicable by d-gen. d-gen then uses 
this defined schema to generate the database, which is then finally serialized to a user-usable format.
  
Although d-gen is (mostly) working and functional, there are still many improvements that can be made. Currently, there are only basic 
column/table relationships available (PK-FK, Jacaard Similarity, Functional Dependency), but there are many more that could be implemented 
in both the YAML config and in the generation. Another big change that could be made is increasing the performance of data generation and 
serialization. I most likely won't pick up d-gen again, but feel free to check it out on GitHub [here](https://github.com/raulcf/d-gen), or 
watch [this video](https://www.youtube.com/watch?v=qPmuSZtiiiQ&feature=emb_imp_woyt) I made about it!
