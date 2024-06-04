

// ==================================================================================
// для экспорта и импорта Postgres, запускаем cmd в какомй-либо пустом каталоге
// порядок указания параметров - важен. 
// экспорт:
//      только схема:
//          pg_dump -U postgres --schema-only -d degr_etalon -f degr-etalon-schema.sql
//      вместе с данными:
//          pg_dump -U postgres -d degr_etalon -f degr-etalon-schema.sql
// импорт
//      psql -f degr-etalon-schema.sql -U postgres test_database
// ==================================================================================



pg_dump -U postgres --schema-only -d db__full_indexed -f db_03_schema-indexed.sql
pg_dump -U postgres --schema-only -d db__full_not_indexed -f db_03_schema-not-indexed.sql
pg_dump -U postgres --schema-only -d shard_indexed__barnaul -f db_03_schema-shard-indexed.sql
pg_dump -U postgres --schema-only -d shard_not_indexed__barnaul -f db_03_schema-shard-not-indexed.sql


psql -f db_03_schema-not-indexed.sql -U postgres db__full_indexed > "import-db__full_indexed.log"