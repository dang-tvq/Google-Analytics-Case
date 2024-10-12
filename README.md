# Google-Analytics-Case Bella-Beat
## Introduction
Welcome to my project for the Google Data Analytics Certificate! In this study, I will demonstrate the skills acquired throughout the course, such as SQL and Tableau. The project involves analyzing Fitbit data to provide a recommendation for Bellabeat, following the data analysis process.
## Business Task
Bellabeat, a wellness tech company focused on empowering women to achieve their full potential, is seeking assistance with marketing their products. The company offers smart devices like the Leaf, Ivy, and Time, which monitor health metrics such as activity, sleep, menstrual cycles, heart rate, and hydration. In this case, Bellabeat's marketing team is asking for recommendations based on an analysis of competitor data. By examining Fitbit, a key competitor, the goal is to uncover user trends within the wellness device market. These insights will help identify growth opportunities for Bellabeat moving forward.
## Data Source
The dataset titled "Fitbit Fitness Tracker Data" was obtained from Kaggle, a data science and coding platform, and was contributed by a data scientist named Möbius. The data was collected through a survey conducted with Amazon Mechanical Turk workers for a study that gathered Fitbit tracking information. While the original study mentions 30 participants, the dataset contains information on 33 individuals. No demographic details such as age, height, or gender are included, and the specific Fitbit models used are not identified. The variation across the datasets may be due to differences in device models or user tracking preferences. My analysis focuses on data from April 12, 2016, to May 12, 2016, covering 33 users across four datasets: physical activity, step counts, sleep patterns, and weight measurements.

The "Daily Activity Merged" dataset records daily activity for 33 users, tracking three types of activity (light, fairly, and very active), along with the distance covered and the time spent on each. Although the distance measurement isn't explicitly defined, it appears to be in kilometers based on step data. Minutes of inactivity are categorized as sedentary time. The dataset also tracks steps taken and calories burned.

The "Hourly Steps Merged" dataset uses the same 33 users but breaks down step counts into hourly intervals, formatted in 24-hour time. A discrepancy between the step totals in this dataset and those in the "Daily Activity Merged" dataset is likely due to differences in device usage. For my step count analysis by time of day, I relied solely on this hourly data.

The "Sleep Day Merged" dataset includes 24 user IDs, tracking minutes spent asleep and minutes spent in bed but not asleep. According to Fitbit, the device uses heart rate and movement patterns to determine sleep status. The "Awake" category includes brief periods of restlessness during sleep.

Lastly, the "Weight Log Info Merged" dataset contains data from 8 users, detailing their weight in kilograms and pounds, BMI, and whether the data was logged manually or automatically. The dataset includes a "Fat" column, but it is populated in only two cells.
## Cleaning Data Process
For this project, I used Microsoft Excel and SQL for data cleaning. I began by examining all of my datasets for common issues like blank spaces, duplicates, and inconsistencies. Below is the changelog of my cleaning process in Excel:

1. Common Changes Across All Tables:

* Removed blank spaces using conditional formatting.
* Verified the uniformity of User ID entries (10 characters) using the LEN function (e.g., =LEN(A2)).
* Added underscores between words in column names.
* Created a "Day" column using the date function (e.g., =TEXT(B2, "dddd")).
* Split "DateTime" columns into separate "Date" and "Time" columns using the INT function (e.g., =INT(A2), =A2 - INT(A2)).

2. Activity Table:
* Renamed the "activitydate" column to "Date."
* Renamed the "totalsteps" column to "steps."
* Removed the following columns: "Tracker Distance," "Logged_Activities_Distance," "Very_Active_Distance," "Moderately_Active_Distance," "Light_Active_Distance," and "Sedentary_Active_Distance."

3. Sleep Table:
* Renamed the "sleepday" column to "Date."
* Subtracted "Time Asleep" from "Total Time In Bed" and created a new "Time Awake" column.
* Removed the "Total Sleep Records" column.

4. Weight Table:
* Renamed the "Is Manual Report" column to "Report_Type."
* Changed "Report_Type" responses from True/False to Manual/Automatic.
* Removed the "Fat" and "LogId" columns.
## Analyzing Process
I then uploaded my four tables into the BigQuery SQL Console to start manipulating the data. Each stage of the data manipulation was driven by a specific question aimed at identifying trends.
