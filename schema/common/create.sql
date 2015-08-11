-- ======================================================================
-- COMMON Schema Entries
-- ======================================================================


-- ----------------------------------------------------------------------
-- SIF 3.0 Infrastructure
-- ----------------------------------------------------------------------
-- TODO Copied from example, needs review

CREATE TABLE IF NOT EXISTS consumer (
	consumer_key varchar(100) UNIQUE,
	consumer_secret varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Environment details
CREATE TABLE IF NOT EXISTS environment (
	id varchar(36) UNIQUE,
	consumer_key varchar(100),
	sessionToken varchar(200),
	zone_id varchar(36),
	FOREIGN KEY (consumer_key) REFERENCES consumer(consumer_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS queue (
	id varchar(36) UNIQUE,
	name varchar(200),
	environment_id varchar(36),
	FOREIGN KEY (environment_id) REFERENCES environment(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS subscription (
	id varchar(36) UNIQUE,
	queue_id varchar(36),	-- Implied environment_id therefore consumer
	zone_id varchar(36),	-- Future support zone match
	context_id varchar(36), -- Future support context
	serviceType varchar(36),	-- 'OBJECT'
	serviceName varchar(36),	-- 'StudentPersonal'
	FOREIGN KEY (queue_id) REFERENCES queue(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS queue_data (
	id varchar(36) UNIQUE,	-- Guarantee Order - incremement.
	subscription_id varchar(36),	-- To lookup zone_id etc (imples queue?)
	event_datetime DATETIME,
	action varchar(25),	 -- CREATE UPDATE DELETE (ENUM)
	data TEXT,
	FOREIGN KEY (subscription_id) REFERENCES subscription(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------------------------------------------------
-- LOCAL EVENTS
-- ----------------------------------------------------------------------
-- Local events are a way to record changes to allow SIF to send change
-- via queues

