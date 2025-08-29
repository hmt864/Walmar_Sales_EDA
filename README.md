# Walmar_Sales_EDA
Analyze historical Walmart sales data from 2010-2012 to understand sales performance in total and individual stores, presenting the yearly trend line for the sales and providing actionable recommendations for inventory and marketing strategies.<br>
The original dataset of Walmart Sales was on Kaggle, being used for EDA after going through data cleaning and preperation processes to remove inappropriate data like **Null** value, **duplicated records** or populate the determinable missing value.<br>

## Situation
In any chain retailer, the regional management needed to look past superficial sales levels to observe the underlying trends impacting performance. They needed to know not just which stores were their best performers, but why they were doing so well and where the greatest opportunities for expansion and enhancement were hidden.<br>
One of the primary difficulties for EDA process was the integrity of the provided dataset, which did not include the first month of 2010 and part of the highly significant Q4 holiday season for 2012. This real-world limitation put the strict and cautious methodology into place to ensure the analysis was both accurate and true.<br>

## Objective
1. Performance Baseline: What does a typical sales year look like, and who are our most consistent top-performing stores?

2. Growth Opportunities: Which of our top stores are gaining momentum, and where should we focus our investment for growth?

3. Holiday Impact: How much do holidays really impact sales, and can we identify specific stores that are "holiday superstars" to create a more targeted marketing strategy?

4. Actionable Recommendations: What clear, data-backed actions should management take to increase revenue and optimize operations?

## Insights
### Q1. Establishing a Performance Baseline:<br> 
To understand a "normal" year, exclusively focusing on the complete 2011 data. This create a seasonality chart that clearly visualized the smooth sales spike from Q1 to Q4, establishing a predictable annual pattern. Then, calculated the total and average weekly sales for each store in 2011 to definitively identify our top 10 performers by volume. 
A trend line for 2011 showing that the two peaks for the whole year are dedicated at the end of the year with two massive holidays, Thanksgiving and Christmas, and a bottom on the Jan.<br><br>
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/db9c9af2-0101-4f8a-8ed1-9097be86ce2e" />
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/636c1621-18f4-4983-9097-088ee85baaa7" />
<br><br>
From the overall sales performance noticed that the top 10 sales stores in 2011 can be grouped into 3, and the interval for each group is around 10M. The lead of stores is store 4 with 111.09M total sales and 2.14M for each week.<br><br>
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/3a79ff32-4386-4ddc-a4af-2ba841b49536" /><img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/1e0e4920-cbf0-439f-866f-b8f628dcd0ee" /><br><br>
### Q2. Identifying Growth Opportunities:<br>
The dataset was incomplete for certain months. Therefore, to ensure a consistent comparison, the period for the Year-over-Year (YoY) analysis was limited to February–October. <br>
The Top 10 and Bottom 10 charts YoY growth for 2011 <br><br>
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/61539a62-119d-49d0-b6e9-01a03f316cde" />
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/4ea07426-3598-468a-8692-8d67c56cbfa8" /><br>
### Q3. Holiday Sales Performance:<br>
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/797a4996-52a0-4c80-9db0-35e80cc94ef0" />
<img width="600" height="600" alt="image" src="https://github.com/user-attachments/assets/e3b3cca7-1367-48ec-ab44-5e8ee8a7e5c6" />


