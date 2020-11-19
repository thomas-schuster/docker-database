SELECT * FROM pg_stat_activity WHERE pg_stat_activity.datname='warehouse';
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'warehouse';