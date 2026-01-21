
SELECT * FROM Facebook_post
SELECT * FROM facebook_profile

-- Total Page Followers
SELECT SUM(Page_followers) AS Total_Page_Followers FROM facebook_profile

-- Total Profile Reach
SELECT SUM(Total_reach) AS Total_Reach FROM facebook_profile

-- Average Engagement Rate
SELECT 
	CASE 
		WHEN SUM(Total_reach) = 0 THEN 0
		ELSE SUM(Page_post_engagements) * 100.0 / SUM(Total_reach)
	END AS avg_engagement_rate

FROM facebook_profile

-- Average Profile Interaction Rate
SELECT 
	CASE
		WHEN SUM(total_reach) = 0 THEN 0
		ELSE SUM(Total_page_reactions) * 100.0 / SUM(Total_reach)
	END AS avg_interaction_rate

FROM facebook_profile

-- Total Likes
SELECT SUM(total_likes) AS Total_Likes FROM facebook_profile

-- Avg Post Interaction Rate
SELECT ROUND(AVG(post_interaction_rate_pct),2) AS avg_post_interaction_rate FROM Facebook_post

-- Total Post Reach
SELECT SUM(Post_reach) AS Total_Post_Reach FROM Facebook_post

-- Total Engagement Rate
SELECT CAST(SUM(post_interaction_rate_pct) AS DECIMAL(10,0)) AS Total_Post_Engagement_Rate FROM Facebook_post

-- Total Post Reactions
SELECT SUM(total_post_reactions) AS Total_Post_Reactions FROM Facebook_post

-- Total Dislikes
SELECT SUM(Unlikes) AS Total_Dislikes FROM facebook_profile


SELECT * FROM Facebook_post
SELECT * FROM facebook_profile

-- Average Net Likes 
SELECT AVG(Net_likes) AS avg_net_likes FROM facebook_profile


-- Post Type by Interaction Rate using CTE and DENSE_RANK
WITH Interaction_rank AS (
SELECT Post_type, CAST(SUM(post_interaction_rate_pct) AS DECIMAL(10,0)) AS Interaction_Rate,
DENSE_RANK() OVER(ORDER BY SUM(post_interaction_rate_pct) DESC) AS I_rank
FROM Facebook_post
GROUP BY post_type
)

SELECT * FROM Interaction_rank
WHERE I_rank <= 5

-- Page Followers over time
SELECT Year_num, SUM(Page_followers) AS Total_Followers FROM facebook_profile
GROUP BY Year_num 
ORDER BY Year_num ASC

-- Net likes over time
SELECT Year_num, SUM(Net_Likes) AS Net_Likes FROM facebook_profile
GROUP BY Year_num 
ORDER BY Year_num ASC

-- Avg Engagement by Day of Week
SELECT Day_name, AVG(post_interaction_rate_pct) FROM Facebook_post
GROUP BY Day_name
ORDER BY AVG(post_interaction_rate_pct) DESC


-- Engagement vs Save Rate
