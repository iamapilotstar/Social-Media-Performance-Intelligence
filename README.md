# Social Media Performance Intelligence Dashboard

**The Problem:**

Social media teams are often flooded with surface-level metrics such as likes, impressions and follower counts, but these numbers alone do not tell the complete story, so teams struggle to answer critical business questions like:

• Which day of the week is best for posting to maximize engagement?

• Which content format performs better: reels or static posts?

• Is the audience actually interacting with the content, or just viewing it passively?

• Are engagement and interaction rates improving over time, or stagnating?

• Is the profile converting attention into meaningful interactions?

In most organizations, this data is scattered across dashboards, exported into spreadsheets and manually analyzed which takes time and makes it difficult to track trends, detect performance shifts or optimize content strategy in a timely manner.

This project simulates a real-world analytics team scenario, where the goal is not just to report numbers, but to generate insights that guide content strategy and profile optimization.

---

**The Solution:**

I designed and built an end-to-end Social Media Intelligence Dashboard that transforms raw social media metrics into a structured decision-support system.

This system enables analytics teams to:

• Identify the best-performing posting days

• Compare content formats (Reels vs Static Posts)

• Track engagement and interaction trends over time

• Evaluate whether the profile is converting reach into meaningful engagement

• Detect periods of growth, stagnation or decline

---

**Technical Approach:**

This project was designed as a full-stack analytics pipeline, not just a dashboarding exercise. The objective was to transform raw, platform-exported social media data into a validated, decision-ready intelligence system that could support real-world content and marketing strategy.

For the full SQL-based data cleaning, feature engineering and KPI computation logic, view the complete SQL pipeline documentation here:  [View SQL Pipeline](https://github.com/iamapilotstar/Social-Media-Performance-Intelligence/tree/main/SQL%20Data%20Cleaning%20and%20Analysis)


The pipeline consists of three tightly coupled layers:

Data Engineering & Transformation Layer - SQL + Power Query

Validation & Analytical Layer - SQL

Visualization & Insight Layer - Power BI

This architecture ensures that all metrics are computed, reproducible, traceable, and analytically sound.

---

**Data Engineering & Transformation:**



**Instagram:**

For Instagram, I performed the following transformations:

• Converted date and numeric columns into proper data types to ensure correct aggregation and time-series behavior

• Removed null and invalid records

• Created a custom Profile Activity table to support breakdown visuals

• Built DAX measures for engagement rate, post-type interaction and trend analysis

• Implemented a 1-to-many, single-directional relationship between Instagram Profile Overview and Post Engagement tables via the Date column to enable consistent slicer filtering

This structure enables accurate drill-down analysis while preserving performance.

---

**Facebook:**

For Facebook, I followed the same rigorous transformation methodology:

• Standardized data types for reach, engagement, reactions and dates

• Removed null and invalid records

• Created a custom Interaction Type table to enable donut chart breakdowns

• Built DAX measures for Net Likes per Day, Interaction Rate and Growth Metrics

• Enabled dynamic date slicers to allow time-based filtering across all visuals

---

**Feature Engineering**

I manually engineered several analytical features to move beyond surface-level reporting:

Engineered Metrics

• Engagement Rate - (Likes + Comments + Shares + Saves) ÷ Reach × 100

• Interaction Rate - (Total Reactions + Comments + Shares) ÷ Post Impressions × 100

• Save Rate - Unique Saves ÷ Reach

• Activity Score - Profile Impressions + Shares + Engagement + Profile Visits + Reach + Reel Shares + New Followers

• Time-based features (year, month, weekday)


These features allow performance to be evaluated in relative terms rather than raw volume.

---

**Findings:**

**Instagram Insights:**

• Total Media Reach: 157K

• Total Posts: 61

• Total Likes: 4,552

• Total Shares: 84

• Total Saves: 2,350

• Average Engagement Rate: 5.5%

These metrics show a strong baseline engagement relative to reach.

---

**Content Format Performance**

Static feed posts consistently outperform reels:

• Static Posts: 205 average engagement

• Reels: 131 average engagement

This suggests that the audience resonates more with text-based or visual-static storytelling rather than short-form video in this dataset.

---

**Engagement Over Time**

• Engagement peaked in November 2024 (127%), indicating a highly resonant campaign or viral post

• Engagement dropped sharply in October 2024 (8%) and December 2024 (23%)

This volatility suggests that content performance is highly sensitive to format, timing or theme.

---

**Profile Activity Breakdown**

• Profile Visits: 57.76%

• Shares: 29.44%

• Follows: 12.81%

This indicates strong curiosity-driven behavior but weaker conversion into followers, highlighting a funnel drop-off.

---

**Reach Trends**

Profile reach showed moderate fluctuations with an upward trend between August and November 2024, peaking in October.

This suggests positive momentum but inconsistent traction.

---

**Facebook Insights:**

• Total Page Followers: 384K

• Total Profile Reach: 2M

• Total Likes: 328K

• Average Engagement Rate: 3.96%

• Average Net Likes per Day: 2.86

---

**Interaction Breakdown**

• Reactions: 61.98%

• Comments: 34.44%

• Shares: 3.58%

This indicates passive approval but weaker virality, as shares are low.

---

**Growth Trends**

• Follower growth peaked at 0.22M in 2024 (up from 0.03M in 2023)

• A slight dip occurred in early 2024

This could be due to algorithm changes, seasonal behavior, or inconsistent posting.

---

**Engagement Trend**

• Engagement peaked at 254 in 2024

• Dropped sharply to 42 in 2025

This suggests content fatigue or declining relevance.

---

**Post-Type Performance**

• Photos: 175 (highest)

• Albums: 129

• Multi-share content: 112

• Lowest: Video initiatives and profile media

Visual static content clearly dominates.

---

**Value Delivered:**

• Unified Instagram and Facebook performance data into a single, interactive intelligence dashboard, eliminating manual reporting and fragmented analysis.

• Identified the highest-performing content formats, with static posts outperforming reels on Instagram (205 vs 131 avg. engagement), enabling smarter content prioritization.

• Revealed optimal posting days (Saturday and Tuesday) using engagement trend analysis, improving scheduling strategy.

• Detected major engagement volatility, including a peak in November 2024 (127%) and sharp dips in October (8%) and December (23%), enabling early content strategy intervention.

• Highlighted conversion drop-offs, showing that while profile visits dominate interactions (57.76%), follow-through actions remain low, informing CTA and funnel optimization.

• Exposed declining Facebook engagement trends (254 → 42), signaling content fatigue and the need for strategic recalibration.

• Replaced static reports with live KPI monitoring, enabling faster, data-backed content decisions instead of intuition-driven posting.

---

**Tools & Technologies**

• MS SQL Server – Data transformation, feature engineering, KPI computation, and analytical validation.

• Power Query – ETL, data cleaning, schema standardization, and preparation for BI modeling.

• Power BI – Dashboard development, DAX measures, interactive filtering, and visual analytics.

• Python (Pandas, Matplotlib, Seaborn) – Exploratory Data Analysis (EDA), correlation analysis and behavioral pattern discovery.

---


## Repository Structure

```bash

SocialPulse-Social-Media-Intelligence/
│
├── SQL Data Cleaning and Analysis/
│   ├── Data Cleaning and Engineering.sql
│   ├── Facebook.sql
│   ├── Instagram.sql
│   └── README.md
│
├── Power BI Dashboards/
│   └── Instagram.pbix
│   └── Facebook.pbix
│
│
├── Report/
│   └── Social Media Analysis Report.pdf
│
└── README.md
