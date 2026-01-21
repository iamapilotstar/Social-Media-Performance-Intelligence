# SQL Data Cleaning & Analysis – Social Media Intelligence

**Overview**

This folder contains the SQL-based data engineering, transformation, and analytical validation pipeline used for the SocialPulse project. The goal of this pipeline is to convert raw Instagram and Facebook exports into clean, business-ready analytical views and to compute all KPIs used in the Power BI dashboard.

This SQL layer ensures that all metrics are reproducible, traceable and analytically correct.

**Data Cleaning & Data Engineering.sql**

This file performs all core data preparation and feature engineering steps for both Instagram and Facebook datasets.

**Key operations:**

• Inspecting raw schemas using INFORMATION_SCHEMA

• Creating reusable stored procedures for raw table inspection

• Handling missing values using COALESCE

• Standardizing date formats using TRY_CONVERT

---

**Feature Engineering:**

**Engineering time-based features:**

– Year

– Month name

– Day of week

---

**Creating analytical views for:**

– instagram_profile

– instagram_post

– facebook_profile

– Facebook_post

---

**Engineering derived metrics such as:**

– Activity Score

– Engagement Rate

– Save Rate

– Total Interactions

– Post Interaction Rate %

These transformations ensure that all datasets are consistent, stable, and ready for business analysis.

---

**Instagram.sql**

This file contains all business-focused analytical queries for Instagram performance.

It includes:

• Total Media Reach

• Total Likes

• Total Shares

• Total Saves

• Total Posts

• Engagement Rate by content type (Reels vs Static)

• Engagement trends over time (month/year)

• Profile reach trends

These queries replicate the logic used in the Power BI visuals and are used to validate dashboard KPIs.


---

**Facebook.sql**

This file contains all business-focused analytical queries for Facebook performance.

It includes:

• Total Page Followers

• Total Profile Reach

• Average Engagement Rate

• Average Interaction Rate

• Total Likes

• Total Dislikes

• Average Net Likes

• Average Post Interaction Rate

• Total Post Reach

• Total Post Reactions

• Post-type performance ranking using DENSE_RANK()

• Follower growth over time

• Net likes trends

• Best day to post (weekday-level engagement analysis)

These queries enable structured analysis of growth, engagement behavior, and content effectiveness.


**This SQL pipeline was created to:**

• Ensure reproducibility of results

• Validate Power BI metrics

• Demonstrate real-world data engineering practices

• Maintain traceability of business logic

• Enable platform-independent analysis

---

How This Connects to Power BI

All SQL views act as the analytical foundation for the Power BI dashboard. The KPI logic implemented here mirrors the transformations performed in Power Query, ensuring consistency between backend transformations and frontend reporting.

This dual-layer approach prevents metric drift and ensures that dashboard insights can be trusted.
