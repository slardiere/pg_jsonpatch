EXTENSION = pg_jsonpatch
DATA = pg_jsonpatch--0.1.sql
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
