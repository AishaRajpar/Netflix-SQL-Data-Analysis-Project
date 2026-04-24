# 📊 Netflix SQL Data Analysis Project

## 📌 Project Overview

This project analyzes a Netflix dataset using SQL to extract meaningful insights about movies and TV shows. The goal is to practice real-world database querying, data cleaning, and analytical thinking using structured queries.

---

## 🎯 Objectives

* Understand the structure of a real-world dataset
* Perform data analysis using SQL queries
* Solve business-related questions using PostgreSQL
* Practice concepts like filtering, grouping, aggregation, window functions, and string manipulation

---

## 🗂️ Dataset Description

The dataset contains information about Netflix content, including:

* **show_id** → Unique ID for each content
* **type** → Movie or TV Show
* **title** → Name of the content
* **director** → Director name
* **casts** → Actors involved
* **country** → Country of production
* **date_added** → Date when added to Netflix
* **release_year** → Year of release
* **rating** → Content rating (e.g., TV-MA, PG)
* **duration** → Length (minutes or seasons)
* **listed_in** → Genre/category
* **description** → Short summary

---

## 🛠️ Tools & Technologies

* PostgreSQL
* SQL (Structured Query Language)

---

## 🧱 Database Schema

```sql
CREATE TABLE netflix(
    show_id VARCHAR(6),
    type VARCHAR(10),
    title VARCHAR(150),
    director VARCHAR(210),
    casts VARCHAR(1000),
    country VARCHAR(150),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(15),
    listed_in VARCHAR(100),
    description VARCHAR(250)
);
```

---

## 📈 Business Problems Solved

### 1. Count Movies vs TV Shows

Grouped content by type and counted total entries.

---

### 2. Most Common Rating by Type

Used window functions to identify the most frequent rating for Movies and TV Shows.

---

### 3. Movies Released in a Specific Year

Filtered movies by release year (e.g., 2020).

---

### 4. Top 5 Countries with Most Content

Split multiple countries using `STRING_TO_ARRAY` and counted total content per country.

---

### 5. Longest Movie

Identified the movie with the maximum duration.

---

### 6. Content Added in Last 5 Years

Filtered content based on `date_added` using date conversion.

---

### 7. Content by Specific Director

Retrieved all content directed by a given director (e.g., Rajiv Chilaka).

---

### 8. TV Shows with More Than 5 Seasons

Extracted numeric values from duration and filtered shows with seasons > 5.

---

### 9. Content Count by Genre

Split genres and counted content items per genre.

---

### 10. Average Content Release in India (Top 5 Years)

Analyzed yearly content distribution and calculated relative contribution.

---

### 11. Documentary Movies

Filtered content belonging to documentary genre.

---

### 12. Content Without Director

Identified records where director information is missing.

---

### 13. Movies Featuring Salman Khan (Last 10 Years)

Filtered based on actor name and release year.

---

### 14. Top 10 Actors in Indian Movies

Split cast column and counted actor appearances.

---

### 15. Content Categorization (Good vs Bad)

Classified content based on keywords like “kill” and “violence” using CASE statement.

---

## 🔑 Key SQL Concepts Used

* `GROUP BY` and `COUNT()`
* `RANK()` window function
* `STRING_TO_ARRAY()` and `UNNEST()`
* `CASE` statements
* `ILIKE` for pattern matching
* `CAST()` and data type conversion
* Date handling with `TO_DATE()`
* Subqueries

---

## 💡 Key Learnings

* Handling messy real-world data (multiple values in one column)
* Using SQL for analytical problem solving
* Writing optimized and readable queries
* Understanding importance of data cleaning

---

## 🚀 Conclusion

This project demonstrates how SQL can be used to extract insights from real-world datasets like Netflix. It covers beginner to intermediate-level concepts and provides a strong foundation for data analysis and database management.

---

## 📌 Future Improvements

* Normalize dataset for better structure
* Create dashboards using Power BI or Tableau
* Add advanced analytics (trends, predictions)

---

## 👩‍💻 Author

Aisha Rajpar
Software Engineering Student

