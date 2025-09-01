# Walmar_Sales_EDA
Analyze historical Walmart sales data from 2010-2012 to understand sales performance in total and for individual stores, and present the yearly trend line for the sales to provide findings, insights, and actionable recommendations for inventory and marketing strategies.<br>
The original dataset of Walmart Sales is on Kaggle, being used for EDA after data cleaning and preperation processes to remove inappropriate data like **Null** value, **duplicated records** or populate the determinable missing value.<br>

## Situation
In any chain retailer, the regional management needed to observe the underlying trends and the impacting performance to know not just which stores were their best performers, but why they were doing so well and where the greatest opportunities for expansion and enhancement were hidden.<br>
One of the primary difficulties for EDA process was the integrity of the provided dataset, which did not include the first month of 2010 and part of the highly significant Q4 holiday season for 2012. This real-world limitation put the strict and cautious methodology into place to ensure the analysis was both accurate and true.<br>

## Objective
1. Performance Baseline: What does a typical sales year look like, and who are our most consistent top-performing stores?

2. Growth Opportunities: Which of our top stores are gaining momentum, and where should we focus our investment for growth?

3. Holiday Impact: How much do holidays really impact sales, and can we identify specific stores that are "holiday superstars" to create a more targeted marketing strategy?

4. Actionable Recommendations: What clear, data-backed actions should management take to increase revenue and optimize operations?

## Findings
### 1. Establishing a Performance Baseline:<br> 
To understand a "normal" year, exclusively focusing on the complete 2011 data. This create a seasonality chart that clearly visualized the smooth sales spike from Q1 to Q4, establishing a predictable annual pattern. Then, calculated the total and average weekly sales for each store in 2011 to definitively identify our top 10 performers by volume.<br><br>
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/d6d12cc8-352f-4c8b-bdb8-680c23ea9a9b" /><br>

In the monthly trend line, showing that the five peaks (Apr, July, Sep, Nov, Dec) have over 200M sales in a month as well as December is the only one sales month that has over 250M close to 300M sales. For the weekly sales trend line, the peaks are dedicated on the end of year. Because of the massive holiday events Thanksgiving and Christmas<br><br>
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/ca95b3bc-cf6e-4f9a-a9a4-ebdca7bfbb16" />
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/a6cb0027-40da-49fe-a837-e1779998fb42" /><br><br>
The top 10 stores don't show a gradual decline in sales, but clustered into clear performance tiers. There's a "Top 4" tier (Stores 4, 20, 14, 13) all performing above $104M, a significant drop to the next group, and another drop to the bottom three. The lead of stores #4 has 111.09M total sales and 2.14M in average for each week. <br><br>
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/3a79ff32-4386-4ddc-a4af-2ba841b49536" /><img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/1e0e4920-cbf0-439f-866f-b8f628dcd0ee" /><br><br>
### 2. Identifying Growth Opportunities:<br>
The dataset was incomplete for certain months. Therefore, to ensure a consistent comparison standard, the period for the Year-over-Year (YoY) analysis was limited to February–October. <br>
The stores #7 (11.98%), #38 (10.49%), and #4 (8.71%) are the top 3 stores growing the most, and the buttom 3 stores are #35 (-24.1%), #36 (-17.13%), and #18 (-11.46%) that decline the .<br><br>
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/61539a62-119d-49d0-b6e9-01a03f316cde" />
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/4ea07426-3598-468a-8692-8d67c56cbfa8" /><br>
### 3. Holiday Sales Performance:<br>
In terms of the average sales performance, the holiday sales is higher than non-holiday on the performance of weekly average sales, but one thing crucial is that non-holidays make up the majority of the calendar and holiday weeks are limited. So even if holiday weeks are stronger on average, the total is dominated by the many more non-holiday weeks.<br><br>
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/797a4996-52a0-4c80-9db0-35e80cc94ef0" /><br><br>
While most of stores benefit from holidays, some are far more effective at capitalizing on them. Store #10 generated the highest incremental sales lift (over $230k weekly average), which is only store over 200K sales lift, but Store #7 achieved the highest percentage lift (approximate 20%), indicating a highly efficient holiday strategy relative to its size. 
<img width="600" height="600" alt="image" src="https://github.com/user-attachments/assets/e3b3cca7-1367-48ec-ab44-5e8ee8a7e5c6" />
<img width="600" height="600" alt="image" src="https://github.com/user-attachments/assets/a448aeb6-04c3-4ce2-a100-37a3aa3835d1" />

### Insights
1. General Sales Performance for Weeks and Months:
  - The annual season pattern can be used as reference to estimate the demand in the following years 
  - The reason for the sluggish performance of sales weeks in Jan could be the emotional and behavioral dip that follows heavy holiday spending. 
  - The top-tier stores have mastered operational efficiencies, supply chain management, or local marketing in a way that others have yet to replicate, creating the higher performance.
2. Growth and Volume for each Stores: 
  - The highest-volume stores (e.g., #20, #13) are the base of sales that contribute steady amount to the total sales. The stores with rapid growth rates like #7 and #38 are demonstrating the proofed strategies that are capturing new market share highly effective, these strong points benefit the future development of new stores. Some sharp decline stores like #35, #36 need to be reviewed for their strategies or operations to discover the potential factors that drop down their sales conspicuously.
  - Stores #4 and #39 are surprising, they perform highest-volume and nice growth rates of over 5%, which are good learning objects for other stores to reference the models or strategies as the reasons they can achieve that well.
3. Holiday Marketing Effectiveness Varies Greatly: 
  - The volume of holiday average sales identifying the most valuable stores in absolute terms, and the percentage sales lift preventing to mask the the performance of smaller stores.
  - Some stores (like #10) with large incremental sales lift contribute directly to the holiday sales base, and the highest percentage lift stores (like #7) indicate effective, targeted strategies that appeal to their local customer base. 

### Actionable Recommendations
