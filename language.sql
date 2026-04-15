SELECT sp.browser AS browser,COUNT(DISTINCT acs.ga_session_id) AS session_cnt,COUNT(DISTINCT CASE WHEN sp.language IS NULL THEN sp.ga_session_id END) AS session_cnt_with_empty_language,COUNT(DISTINCT CASE WHEN sp.language IS NULL THEN sp.ga_session_id END)/COUNT( DISTINCT sp.ga_session_id)*100 AS session_cnt_with_empty_language_percent
FROM `DA.account_session` acs
JOIN `DA.session_params` sp
ON acs.ga_session_id=sp.ga_session_id
GROUP BY sp.browser;

