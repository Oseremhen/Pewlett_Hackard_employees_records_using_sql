# A research project about people whom the company employed during the 1980s and 1990s

<img width="536" alt="Screenshot 2023-01-21 at 6 45 02 AM" src="https://user-images.githubusercontent.com/106120403/213865480-f1008e96-72ee-4824-a3b5-424757973115.png">

Project Summary:
It’s been two weeks since you were hired as a new data engineer at Pewlett Hackard (a fictional company). Your first major task is to do a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.
For this project, you’ll design the tables to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data. 

I performed data modeling, data engineering, and data analysis, respectively using SQL.

This analysis is divided into three parts: data modeling, data engineering, and data analysis.

Data Modeling (ERD_Assignment_image file):

I inspected the CSV files, and then sketched an Entity Relationship Diagram of the tables.

![SQL_ERD](https://user-images.githubusercontent.com/106120403/212881096-b589d6cd-0ef0-4ea1-befe-3acacd22f869.png)

Data Engineering (Data_Engineering.sql file):

I used the provided information to create a table schema for each of the six CSV files by specifing the data types, primary keys, foreign keys, and other constraints. I imported each CSV file into its corresponding SQL table.

Data Analysis (Data_Analysis.sql file):

Using PosgreSQL, I found the following with from joining the tables I created above.

List the employee number, last name, first name, sex, and salary of each employee.

List the first name, last name, and hire date for the employees who were hired in 1986.

List the manager of each department along with their department number, department name, employee number, last name, and first name.

List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

List each employee in the Sales department, including their employee number, last name, and first name.

List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

