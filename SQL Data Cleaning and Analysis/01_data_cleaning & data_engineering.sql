CREATE PROCEDURE selectstatement AS
SELECT * FROM instagram_post_engagement
SELECT * FROM instagram_profile_overview
SELECT * FROM facebook_post_engagements
SELECT * FROM facebook_profile_overview
GO



EXEC selectstatement


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'instagram_post_engagement'

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'instagram_profile_overview'

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'facebook_profile_overview'

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'facebook_post_engagements'


CREATE VIEW instagram_profile AS
SELECT DATE, 
-- Replacing Null with 0 if any
COALESCE(Profile_impressions, 0) AS Profile_impressions,COALESCE(Shares, 0) AS Shares,COALESCE(Engagement, 0) AS Engagement, COALESCE(Profile_visits, 0) AS Profile_visits 
,COALESCE(Profile_reach, 0) AS Profile_reach, COALESCE(Reel_shares, 0) AS Reel_shares, COALESCE(New_followers, 0) AS New_followers, 

-- Creating a new column called activity score and replacing nulls with 0 if any.
COALESCE(Profile_impressions,0) + COALESCE(Shares,0) 
+ COALESCE(Engagement,0) + COALESCE(Profile_visits,0) + COALESCE(Profile_reach,0) + COALESCE(Reel_shares,0) + COALESCE(New_followers,0) AS Activity_score,

YEAR(TRY_CONVERT(date, DATE, 105)) AS Year_num,
DATENAME(MONTH, TRY_CONVERT(date, DATE, 105)) AS Month_name,
DATENAME(WEEKDAY, TRY_CONVERT(date, DATE, 105)) AS Day_name

FROM instagram_profile_overview

SELECT * FROM instagram_profile



CREATE VIEW instagram_post AS
SELECT *,
		CASE 
		   WHEN reach = 0 THEN 0
		   ELSE
				(
					COALESCE(like_count, 0) + COALESCE(comments_count, 0) + COALESCE(shares, 0) + COALESCE(unique_saves, 0)) * 100.0 / reach 
		END AS engagement_rate,

		CASE 
			WHEN reach = 0 THEN 0
			ELSE CAST(unique_saves AS FLOAT) / reach
		END AS save_rate,
		
		YEAR(TRY_CONVERT(date, DATE, 105)) AS Year_num,
		DATENAME(MONTH, TRY_CONVERT(date, DATE, 105)) AS Month_name,
		DATENAME(WEEKDAY, TRY_CONVERT(date, DATE, 105)) AS Day_name

FROM instagram_post_engagement

SELECT * FROM instagram_post


-- Facebook Profile Overview

CREATE VIEW facebook_profile AS

SELECT Date, COALESCE(Page_followers, 0) AS Page_followers, COALESCE(Total_impressions, 0) AS Total_impressions, COALESCE(Organic_impressions, 0) AS Organic_impressions, 
COALESCE(Total_page_reactions, 0) AS Total_page_reactions, COALESCE(Total_reach, 0) AS Total_reach, 
COALESCE(of_reach_from_organic, 0) AS of_reach_from_organic, COALESCE(of_reach_from_paid, 0) AS of_reach_from_paid, COALESCE(Page_post_engagements, 0) AS Page_post_engagements, 
COALESCE(Total_likes, 0) AS Total_likes, COALESCE(New_likes, 0) AS New_likes, 
COALESCE(Unlikes, 0) AS Unlikes, COALESCE(Net_likes, 0) AS Net_likes, 

YEAR(TRY_CONVERT(date, DATE, 105)) AS Year_num,
DATENAME(MONTH, TRY_CONVERT(date, DATE, 105)) AS Month_name,
DATENAME(WEEKDAY, TRY_CONVERT(date, DATE, 105)) AS Day_name

FROM facebook_profile_overview

SELECT * FROM facebook_profile

SELECT * FROM facebook_post_engagements

CREATE VIEW Facebook_post AS 
SELECT Post_ID, Post_creation_date, COALESCE(Post_type, 'No post') AS Post_type, COALESCE(Post_impressions, 0) AS Post_impressions, COALESCE(Post_organic_reach, 0) AS Post_organic_reach, 
COALESCE(of_reach_from_paid, 0) AS of_reach_from_paid, COALESCE(Post_reach, 0) AS Post_reach, COALESCE(Shares_on_posts, 0) AS Shares_on_posts, 
COALESCE(Total_post_reactions, 0) AS Total_post_reactions, COALESCE(Post_photo_views, 0) AS Post_photo_views, COALESCE(Video_views, 0) AS Video_views, 
COALESCE(Comments_on_posts, 0) AS Comments_on_posts,

COALESCE(shares_on_posts, 0) + COALESCE(comments_on_posts, 0) + COALESCE(total_post_reactions, 0) AS total_interactions,

CASE
	WHEN COALESCE(post_impressions, 0) = 0 THEN 0
	ELSE
		(
			COALESCE(shares_on_posts, 0) + COALESCE(comments_on_posts, 0) + COALESCE(total_post_reactions, 0)) * 100.0 / post_impressions
END AS post_interaction_rate_pct,
YEAR(TRY_CONVERT(date, post_creation_date, 105)) AS Year_num,
DATENAME(MONTH, TRY_CONVERT(date,  post_creation_date, 105)) AS Month_name,
DATENAME(WEEKDAY, TRY_CONVERT(date,  post_creation_date, 105)) AS Day_name

FROM facebook_post_engagements


CREATE PROCEDURE final_view AS
SELECT * FROM instagram_profile
SELECT * FROM instagram_post
SELECT * FROM Facebook_post
SELECT * FROM facebook_profile
GO

EXEC final_view

