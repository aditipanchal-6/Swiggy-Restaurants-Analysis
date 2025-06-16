# Swiggy-Restaurants-Analysis

Project Overview
This SQL-based project explores and analyzes a dataset of Swiggy restaurants across various Indian cities. The aim is to derive insights on customer ratings, cuisine patterns, pricing behavior, licensing status, and regional performance to support business decisions like premium service targeting, quality control, and expansion planning.

Dataset Information
Source: cleaned_swiggy.csv (locally stored)
Dataset: https://drive.google.com/file/d/1sBWlBMrYTNRIVC9mJZ_I_sGKjZZV8PUj/view?usp=sharing

Imported Into: PostgreSQL using the COPY command

Table Name: swiggy_data

Key Fields:
id, name, city, rating, rating_count, cost, cuisine, lic_no, link, address, menu

Note: Due to GitHub file size restrictions, the dataset is hosted externally.
Download Dataset (Google Drive)

Business Questions Answered
Which cities have the highest and lowest-rated restaurants?

What are the most popular cuisines across India?

Do customers pay more for higher-rated restaurants?

Which cities or cuisines offer the best value for money?

Which restaurants consistently receive poor ratings?

Are there underrated restaurants with high ratings but low visibility?

How many restaurants are FSSAI licensed?

Which cities show potential for business expansion?

Key Insights and Observations
Top-rated restaurants aren’t limited to Tier-1 cities. Localities like Mylapore (Chennai) and Frazer Town (Bangalore) consistently score high, making them strong candidates for hyperlocal promotions and curated premium services.

Some restaurants, such as "Ice Cream and Shakes Co" (Chandigarh) and "Persian Delight" (Bangalore), maintain extremely low ratings (1.0–1.4) despite over 20 reviews. These likely indicate systemic quality issues and may warrant audits or platform action.

Data shows a clear correlation between average rating and cost. Higher-rated restaurants typically charge more, suggesting a willingness among users to pay for quality experiences.

Chinese and North Indian cuisines dominate the restaurant landscape. However, fast food, snacks, and beverages are rapidly growing—reflecting the increasing demand for convenience and quick meals in urban India.

A niche group of restaurants show high ratings (4.5+) but have fewer than 20 reviews. These may be either undiscovered culinary gems or early-stage vendors with limited data. Further validation is recommended before promotional placement.

Several cities have fewer than 20 restaurants listed, indicating potential for expansion and market penetration.

