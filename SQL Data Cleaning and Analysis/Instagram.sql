

SELECT * FROM instagram_post
SELECT * FROM instagram_profile


-- KPI Metrics Instagram

-- Total Media Reach
SELECT SUM(reach) AS Total_Media_Reach FROM instagram_post

-- Total Likes
SELECT SUM(like_count) AS Total_Likes FROM instagram_post

-- Total Unique Saves
SELECT SUM(unique_saves) AS Unique_Saves FROM instagram_post

-- Total Posts
SELECT COUNT(media_id) AS Total_Posts AS Total_posts FROM instagram_post

-- Total Shares
SELECT SUM(shares) AS Total_Shares FROM instagram_post

-- Engagement Rate by Media Type
SELECT media_product_type, CAST(SUM(engagement_rate) AS DECIMAL(10,0)) AS Engagement_rate FROM instagram_post
GROUP BY media_product_type

-- Engagement Rate over time
SELECT Year_num, month_name, CAST(SUM(engagement_rate) AS DECIMAL(10,0)) AS Engagement_rate FROM instagram_post
GROUP BY year_num, month_name
ORDER BY year_num, 
			CASE
				WHEN month_name = 'January' THEN 1
				WHEN month_name = 'Feburary' THEN 2
				WHEN month_name = 'March' THEN 3
				WHEN month_name = 'April' THEN 4
				WHEN month_name = 'May' THEN 5
				WHEN month_name = 'June' THEN 6
				WHEN month_name = 'July' THEN 7
				WHEN month_name = 'August' THEN 8
				WHEN month_name = 'September' THEN 9
				WHEN month_name = 'October' THEN 10
				WHEN month_name = 'November' THEN 11
				WHEN month_name = 'December' THEN 12
			END

-- Profile Reach

SELECT Year_num, month_name, SUM(Profile_reach) AS Profile_Reach FROM instagram_profile
GROUP BY Year_num, month_name
ORDER BY
		CASE
			WHEN month_name = 'January' THEN 1
			WHEN month_name = 'February' THEN 2
			WHEN month_name = 'March' THEN 3
			WHEN month_name = 'April' THEN 4
			WHEN month_name = 'May' THEN 5
			WHEN month_name = 'June' THEN 6
			WHEN month_name = 'July' THEN 7
			WHEN month_name = 'August' THEN 8
			WHEN month_name = 'September' THEN 9
			WHEN month_name = 'October' THEN 10
			WHEN month_name = 'November' THEN 11
			WHEN month_name = 'December' THEN 12
		END





