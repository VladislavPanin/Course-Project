psql -f db_03_schema-db-indexed.sql        -U postgres   db__full_indexed               > "import-db__full_indexed.log"
psql -f db_03_schema-db-not-indexed.sql    -U postgres   db__full_not_indexed           > "import-db__full_not_indexed.log"
                                                                                            
psql -f db_03_schema-shard-indexed.sql     -U postgres   shard_indexed__tomsk           > "import-shard_indexed__tomsk.log"
psql -f db_03_schema-shard-indexed.sql     -U postgres   shard_indexed__moscow          > "import-shard_indexed__moscow.log"
psql -f db_03_schema-shard-indexed.sql     -U postgres   shard_indexed__samara          > "import-shard_indexed__samara.log"
psql -f db_03_schema-shard-indexed.sql     -U postgres   shard_indexed__novosibirsk     > "import-shard_indexed__novosibirsk.log"
psql -f db_03_schema-shard-indexed.sql     -U postgres   shard_indexed__orel            > "import-shard_indexed__orel.log"
psql -f db_03_schema-shard-indexed.sql     -U postgres   shard_indexed__kemerovo        > "import-shard_indexed__kemerovo.log"
psql -f db_03_schema-shard-indexed.sql     -U postgres   shard_indexed__barnaul         > "import-shard_indexed__barnaul.log"
psql -f db_03_schema-shard-indexed.sql     -U postgres   shard_indexed__smolensk        > "import-shard_indexed__smolensk.log"
psql -f db_03_schema-shard-indexed.sql     -U postgres   shard_indexed__belgorod        > "import-shard_indexed__belgorod.log"
psql -f db_03_schema-shard-indexed.sql     -U postgres   shard_indexed__tula            > "import-shard_indexed__tula.log"
                                                   								            								
psql -f db_03_schema-shard-not-indexed.sql -U postgres   shard_not_indexed__tomsk       > "import-shard_not_indexed__tomsk.log"
psql -f db_03_schema-shard-not-indexed.sql -U postgres   shard_not_indexed__moscow      > "import-shard_not_indexed__moscow.log"
psql -f db_03_schema-shard-not-indexed.sql -U postgres   shard_not_indexed__samara      > "import-shard_not_indexed__samara.log"
psql -f db_03_schema-shard-not-indexed.sql -U postgres   shard_not_indexed__novosibirsk > "import-shard_not_indexed__novosibirsk.log"
psql -f db_03_schema-shard-not-indexed.sql -U postgres   shard_not_indexed__orel        > "import-shard_not_indexed__orel.log"
psql -f db_03_schema-shard-not-indexed.sql -U postgres   shard_not_indexed__kemerovo    > "import-shard_not_indexed__kemerovo.log"
psql -f db_03_schema-shard-not-indexed.sql -U postgres   shard_not_indexed__barnaul     > "import-shard_not_indexed__barnaul.log"
psql -f db_03_schema-shard-not-indexed.sql -U postgres   shard_not_indexed__smolensk    > "import-shard_not_indexed__smolensk.log"
psql -f db_03_schema-shard-not-indexed.sql -U postgres   shard_not_indexed__belgorod    > "import-shard_not_indexed__belgorod.log"
psql -f db_03_schema-shard-not-indexed.sql -U postgres   shard_not_indexed__tula        > "import-shard_not_indexed__tula.log"






