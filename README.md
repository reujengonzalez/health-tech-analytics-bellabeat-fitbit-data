# Bellabeat Fitbit Data Analysis (Health Tech Analytics) [Excel, MySQL, R]

## 📌 Overview
This project analyzes the **Bellabeat Fitbit dataset** from the Google Data Analytics Capstone Case Study. The main focus was on **data cleaning and exploratory data analysis (EDA)** using **Excel, MySQL, and R**.  

The goal was to identify **wellness and activity trends** such as step counts, calorie burn, and sleep patterns to help Bellabeat understand how users engage with wearable devices.  

---

## 🎯 Objectives
Key goals of the project:
- Clean and prepare the Fitbit data for analysis.  
- Answer guiding business questions from the Bellabeat case study, including:  
  - How do users track their **daily activities and steps**?  
  - What are the trends in **sleep duration and quality**?  
  - How do **calories burned** relate to activity intensity?  
- Provide data-driven recommendations for health and wellness insights.  

---

## 📂 Dataset Description
- **Source:** [Google Data Analytics Capstone Case Study – Bellabeat](https://www.kaggle.com/datasets/kyle007hendricks/bellabeat-dataset)
- **Size:** ~18 CSV files, ~30 users, 2 months of tracking data  
- **Main Features:**
  - `Id`, `Date`, `Steps`, `Calories`
  - `SleepMinutes`, `TotalSleepRecords`
  - `ActivityMinutes` (Sedentary, Light, Moderate, VeryActive)
- **Preprocessing Steps:**
  - Merged multiple CSVs into structured tables  
  - Standardized date/time formats  
  - Removed duplicates and missing values  
  - Calculated new metrics (e.g., `Active vs Sedentary Ratio`, `Average Sleep Hours`)  

---

## 🛠️ Tools & Techniques
- **Excel**
  - Initial review of raw CSV files  
  - Basic cleaning and summary statistics  
- **MySQL**
  - Data integration from multiple CSVs  
  - Joins and aggregate queries  
  - Creation of calculated metrics for activity and sleep  
- **R**
  - EDA with `dplyr` for transformations  
  - `ggplot2` for exploratory charts (step distribution, sleep vs activity)  
  - Correlation analysis (activity vs calories, activity vs sleep)  

---

## 📊 Key Insights
- **Activity Levels:**  
  - Most users did not consistently reach **10,000 steps/day**.  
  - Sedentary time was high relative to active minutes.  

- **Sleep Analysis:**  
  - Users averaged **6.9 hours of sleep**, below the recommended 7–9 hours.  
  - More active users tended to have **slightly better sleep quality**.  

- **Calorie Burn:**  
  - Strong correlation between **very active minutes** and **calories burned**.  
  - Light activity and sedentary behavior contributed little to energy expenditure.  

---

## ⚡ Challenges & Solutions
- **Challenge:** Multiple datasets had different structures (daily, hourly, user-level).  
  **Solution:** Used **MySQL joins** to integrate datasets into a consistent relational structure.  

- **Challenge:** Missing or incomplete sleep records for some users.  
  **Solution:** Filtered out incomplete cases while noting limitations in analysis.  

- **Challenge:** Overlapping activity columns (different intensity levels).  
  **Solution:** Consolidated into a **single activity ratio metric** for consistency.  

---

## 🔍 How to Explore
1. **SQL Scripts** – See the `scripts/` folder for MySQL queries.  
2. **Case Study** – Read the structured write-up in `health-tech-analytics-case-study.docx`.  

---

## 🚀 Next Steps
- Expand EDA to include **heart rate analysis** (not fully explored in the dataset).  
- Apply clustering techniques to **segment users by activity/sleep behavior**.  
- Create a **dashboard** in Tableau or Power BI to make findings more accessible.  
- Use predictive modeling to recommend **daily activity targets** for users.  

---

📌 **Author:** Reujen Gonzalez  

🔗 **Portfolio Website:** [Link](https://reujengonzalez.github.io/) | **LinkedIn:** [Link](https://www.linkedin.com/in/reujen-river-gonzalez-878356350/) | **GitHub:** [Link](https://github.com/reujengonzalez)  
