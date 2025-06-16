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
1) Top-rated restaurants aren’t limited to Tier-1 cities. Localities like Mylapore (Chennai) and Frazer Town (Bangalore) consistently score high, making them strong candidates for hyperlocal promotions and curated premium services.
2) Some restaurants, such as "Ice Cream and Shakes Co" (Chandigarh) and "Persian Delight" (Bangalore), maintain extremely low ratings (1.0–1.4) despite over 20 reviews. These likely indicate systemic quality issues and may warrant audits or platform action.
3) Data shows a clear correlation between average rating and cost. Higher-rated restaurants typically charge more, suggesting a willingness among users to pay for quality experiences.
4) Chinese and North Indian cuisines dominate the restaurant landscape. However, fast food, snacks, and beverages are rapidly growing—reflecting the increasing demand for convenience and quick meals in urban India.
5) A niche group of restaurants show high ratings (4.5+) but have fewer than 20 reviews. These may be either undiscovered culinary gems or early-stage vendors with limited data. Further validation is recommended before promotional placement.
6) Several cities have fewer than 20 restaurants listed, indicating potential for expansion and market penetration.


Business Solutions
1) Hyperlocal Targeting: Focus marketing and premium services in high-performing zones like Mylapore (Chennai) and Frazer Town (Bangalore) rather than only Tier-1 cities.
2) Quality Control: Identify consistently low-rated restaurants for audits, retraining, or de-ranking to maintain platform standards.
3) Value Positioning: Promote high-rated, higher-cost restaurants as quality-first options to match user preference for experience over price.
4) Category Strategy: Boost offerings in trending segments like Fast Food, Snacks, and Beverages through campaigns, combos, and quick-serve visibility.
5) Restaurant Vetting: Monitor restaurants with high ratings but few reviews to avoid featuring possibly biased or unverified listings.
6) Expansion Planning: Use city-wise restaurant density data to identify underserved markets and drive targeted vendor onboarding.



