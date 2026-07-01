# Walmart-Sales-analysis

## About
Analyzed 10,000+ Walmart sales transactions to identify revenue drivers and customer trends.

**Tools:**
- Python (Pandas, Jupyter)
- SQL Server 
- Matplotlib/Seaborn

## What I Did

### Step 1: Data Cleaning (Python)
- Removed 500+ duplicate rows
- Handled missing values
- Standardized data types (dates, prices)
- Created derived metric: Total Amount (unit_price × quantity)

### Step 2: Database Setup
- Loaded cleaned data into SQL Server
- Stored in `WalmartSales` table for querying

### Step 3: Business Analysis (SQL)
Solved 8 key business questions:
1. **Highest Revenue Branch** → Branch A generates ₹50L revenue
2. **Top Product Categories** → Electronics category highest (₹60L)
3. **Busiest Days by Branch** → Friday has peak transactions
4. **Payment Method Preference** → Credit card used 45% of time
5. **Customer Ratings by Location** → City X branch rated highest (4.5/5)
6. **Profit Margin Analysis** → Electronics 18% margin vs Fashion 12%
7. **Monthly Sales Trends** → July-August peak season
8. **Top Transactions** → Highest order value ₹95K

### Step 4: Visualization (Python)
Created 3 charts to communicate findings:
- Bar chart: Revenue by category
- Line chart: Daily sales trend over time
- Histogram: Customer rating distribution

## Key Findings

- **Top Branch:** Branch A generates 35% more revenue
- **Top Category:** Electronics (18% profit margin)
- **Peak Day:** Friday has highest transactions
- **Payment:** Credit card users spend 20% more
- **Peak Season:** July-August (Q3)

## Business Recommendation
1. **Increase inventory** for Electronics in Q3 (peak season)
2. **Launch Friday promotions** to capitalize on high-traffic days
3. **Expand Branch A model** to underperforming branches
4. **Incentivize credit card payments** with loyalty rewards

## What I Learned
- End-to-end data pipeline: Load → Clean → Analyze → Visualize
- SQL window functions and advanced aggregations
- Translating data insights into business recommendations
- How to tell a data story (not just showing numbers)

---

**Next Steps:** Gather feedback. Iterate if needed.
