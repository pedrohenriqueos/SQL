CREATE TABLE sessions(
	action VARCHAR,
	action_type VARCHAR,
	action_detail VARCHAR,
	device_type VARCHAR
);

COPY sessions(
	action,
	action_type,
	action_detail,
	device_type
)
FROM  '/var/lib/postgresql/sessions_tratar.csv'
DELIMITER ','
CSV HEADER;
