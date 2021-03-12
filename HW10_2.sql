-- Построить запрос, который будет выводить следующие столбцы:
-- имя группы;
-- среднее количество пользователей в группах;
-- самый молодой пользователь в группе;
-- самый старший пользователь в группе;
-- общее количество пользователей в группе;
-- всего пользователей в системе;
-- отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100.
    
   
SELECT distinct 
communities.name AS name,
 AVG(profiles.user_id) OVER(PARTITION BY communities.id) AS average,
 MIN(profiles.birthday) OVER(PARTITION BY communities.id) AS min,
 MAX(profiles.birthday) OVER(PARTITION BY communities.id) AS max,
 count(profiles.user_id) OVER(PARTITION BY communities_users.user_id) AS total_by_group,
 count(profiles.user_id) OVER() AS total_by_system,
 count(profiles.user_id) OVER(PARTITION BY communities_users.user_id) / count(profiles.user_id) OVER() * 100 AS "%%"
    FROM communities_users
      JOIN communities
        ON communities.owner_id = communities_users.user_id
     right  JOIN profiles
        ON profiles.user_id = communities_users.user_id;

