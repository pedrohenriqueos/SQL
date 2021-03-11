CREATE TABLE data(
	language VARCHAR,
	gender VARCHAR,
	signup_method VARCHAR,
	affiliate_channel VARCHAR,
	affiliate_provider VARCHAR,
	first_affiliate_tracked VARCHAR,
	signup_app VARCHAR,
	first_device_type VARCHAR,
	first_browser VARCHAR
);

COPY data(
	language,
	gender,
	signup_method,
	affiliate_channel,
	affiliate_provider,
	first_affiliate_tracked,
	signup_app,
	first_device_type,
	first_browser
)
FROM '/var/lib/postgresql/trab.csv'
DELIMITER ','
CSV HEADER;
