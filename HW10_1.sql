
CREATE UNIQUE INDEX users_email_uq ON users(email);
CREATE UNIQUE INDEX users_phone_uq ON users(phone);
CREATE INDEX user_name_user_last_name_idx ON users (first_name, last_name);

CREATE INDEX profiles_birthday_idx ON profiles(birthday);
CREATE INDEX profiles_country_profiles_city_idx ON profiles(country, city);

CREATE INDEX posts_user_id_idx ON posts(user_id);
CREATE INDEX posts_community_id_idx ON posts(community_id);

CREATE INDEX communities_owner_id_idx ON communities(owner_id);