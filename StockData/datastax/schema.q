cqlsh> desc keyspace stocks;

CREATE KEYSPACE stocks WITH replication = {
  'class': 'NetworkTopologyStrategy',
  'Analytics': '4'
};

USE stocks;

CREATE TABLE correction (
  portfolio_id timeuuid,
  correction_date timestamp,
  symbol text,
  effective_date timestamp,
  quantity double,
  status text,
  PRIMARY KEY ((portfolio_id), correction_date, symbol)
) WITH CLUSTERING ORDER BY (correction_date DESC, symbol ASC) AND
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE TABLE dummy (
  id int,
  val text,
  PRIMARY KEY ((id))
) WITH
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE TABLE holdings (
  portfolio_id timeuuid,
  symbol text,
  quantity double,
  PRIMARY KEY ((portfolio_id), symbol)
) WITH
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE TABLE holdings_daily (
  portfolio_id timeuuid,
  lasttradeday timestamp,
  symbol text,
  current_quantity double,
  original_quantity double,
  PRIMARY KEY ((portfolio_id), lasttradeday, symbol)
) WITH
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE TABLE portfolio (
  email_address text,
  portfolio_id timeuuid,
  description text,
  invested double,
  value double,
  valuedt timestamp,
  PRIMARY KEY ((email_address), portfolio_id)
) WITH CLUSTERING ORDER BY (portfolio_id DESC) AND
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE TABLE portfolio_daily (
  portfolio_id timeuuid,
  lasttradeday timestamp,
  current_value double,
  original_value double,
  PRIMARY KEY ((portfolio_id), lasttradeday)
) WITH CLUSTERING ORDER BY (lasttradeday DESC) AND
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE TABLE quote (
  symbol text,
  lasttradedate timestamp,
  ask double,
  averagedailyvolume double,
  bid double,
  bookvaluepershare double,
  change double,
  changefromfiftydaymovingaverage double,
  changefromtwohundreddaymovingaverage double,
  changefromyearhigh double,
  changefromyearlow double,
  changeinpercent double,
  changeinpercentfromyearhigh double,
  dayshigh double,
  dayslow double,
  dilutedeps double,
  dividendpaydate timestamp,
  ebitda double,
  ema_10day double,
  ema_5day double,
  epsestimatecurrentyear double,
  epsestimatenextquarter double,
  epsestimatenextyear double,
  exdividenddate double,
  fiftydaymovingaverage double,
  lasttradeday timestamp,
  lasttradepriceonly double,
  lasttradetime text,
  lowlimit double,
  ma_10day double,
  ma_5day double,
  marketcapitalization text,
  name text static,
  oneyrtargetprice double,
  open double,
  pegratio double,
  peratio double,
  percentchangefromfiftydaymovingaverage double,
  percentchangefromtwohundreddaymovingaverage double,
  percentchangefromyearlow double,
  previousclose double,
  pricebook double,
  priceepsestimatecurrentyear double,
  priceepsestimatenextyear double,
  pricepaid double,
  pricesales double,
  revenue double,
  tradedate timestamp,
  trailingannualdividendyield double,
  trailingannualdividendyieldinpercent double,
  twohundreddaymovingaverage double,
  volume double,
  yearhigh double,
  yearlow double,
  PRIMARY KEY ((symbol), lasttradedate)
) WITH CLUSTERING ORDER BY (lasttradedate DESC) AND
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=2592000 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE TABLE quote_daily (
  symbol text,
  lasttradeday timestamp,
  ask double,
  averagedailyvolume double,
  bid double,
  bookvaluepershare double,
  change double,
  changefromfiftydaymovingaverage double,
  changefromtwohundreddaymovingaverage double,
  changefromyearhigh double,
  changefromyearlow double,
  changeinpercent double,
  changeinpercentfromyearhigh double,
  dayshigh double,
  dayslow double,
  dilutedeps double,
  dividendpaydate timestamp,
  ebitda double,
  ema_10day double,
  ema_5day double,
  epsestimatecurrentyear double,
  epsestimatenextquarter double,
  epsestimatenextyear double,
  exdividenddate double,
  fiftydaymovingaverage double,
  lasttradedate timestamp,
  lasttradepriceonly double,
  lasttradetime text,
  lowlimit double,
  ma_10day double,
  ma_5day double,
  marketcapitalization text,
  name text static,
  oneyrtargetprice double,
  open double,
  pegratio double,
  peratio double,
  percentchangefromfiftydaymovingaverage double,
  percentchangefromtwohundreddaymovingaverage double,
  percentchangefromyearlow double,
  previousclose double,
  pricebook double,
  priceepsestimatecurrentyear double,
  priceepsestimatenextyear double,
  pricepaid double,
  pricesales double,
  revenue double,
  tradedate timestamp,
  trailingannualdividendyield double,
  trailingannualdividendyieldinpercent double,
  twohundreddaymovingaverage double,
  volume double,
  yearhigh double,
  yearlow double,
  PRIMARY KEY ((symbol), lasttradeday)
) WITH CLUSTERING ORDER BY (lasttradeday DESC) AND
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE TABLE quote_history (
  symbol text,
  lasttradeday timestamp,
  lasttradedate timestamp,
  ask double,
  averagedailyvolume double,
  bid double,
  bookvaluepershare double,
  change double,
  changefromfiftydaymovingaverage double,
  changefromtwohundreddaymovingaverage double,
  changefromyearhigh double,
  changefromyearlow double,
  changeinpercent double,
  changeinpercentfromyearhigh double,
  dayshigh double,
  dayslow double,
  dilutedeps double,
  dividendpaydate timestamp,
  ebitda double,
  ema_10day double,
  ema_5day double,
  epsestimatecurrentyear double,
  epsestimatenextquarter double,
  epsestimatenextyear double,
  exdividenddate double,
  fiftydaymovingaverage double,
  lasttradepriceonly double,
  lasttradetime text,
  lowlimit double,
  ma_10day double,
  ma_5day double,
  marketcapitalization text,
  name text static,
  oneyrtargetprice double,
  open double,
  pegratio double,
  peratio double,
  percentchangefromfiftydaymovingaverage double,
  percentchangefromtwohundreddaymovingaverage double,
  percentchangefromyearlow double,
  previousclose double,
  pricebook double,
  priceepsestimatecurrentyear double,
  priceepsestimatenextyear double,
  pricepaid double,
  pricesales double,
  revenue double,
  tradedate timestamp,
  trailingannualdividendyield double,
  trailingannualdividendyieldinpercent double,
  twohundreddaymovingaverage double,
  volume double,
  yearhigh double,
  yearlow double,
  PRIMARY KEY ((symbol, lasttradeday), lasttradedate)
) WITH CLUSTERING ORDER BY (lasttradedate DESC) AND
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE TABLE quote_load_rules (
  node text,
  load int,
  zid_begin int,
  zid_end int,
  PRIMARY KEY ((node), load)
) WITH
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE TABLE quote_loader (
  node text,
  load int,
  symbol text,
  PRIMARY KEY ((node, load), symbol)
) WITH
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE TABLE session (
  session_id timeuuid,
  email_address text,
  name text,
  PRIMARY KEY ((session_id))
) WITH
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=900 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE TABLE session_history (
  email_address text,
  session_id timeuuid,
  activity counter,
  PRIMARY KEY ((email_address), session_id)
) WITH CLUSTERING ORDER BY (session_id DESC) AND
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE TABLE stock_listing (
  symbol text,
  exchange text,
  industry text,
  lasttradedate timestamp,
  lasttradepriceonly double,
  marketcap text,
  name text,
  sector text,
  solr_query text,
  zid int,
  PRIMARY KEY ((symbol))
) WITH
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE CUSTOM INDEX stocks_stock_listing_exchange_index ON stock_listing (exchange) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_industry_index ON stock_listing (industry) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_lasttradedate_index ON stock_listing (lasttradedate) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_lasttradepriceonly_index ON stock_listing (lasttradepriceonly) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_marketcap_index ON stock_listing (marketcap) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_name_index ON stock_listing (name) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_sector_index ON stock_listing (sector) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_solr_query_index ON stock_listing (solr_query) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_zid_index ON stock_listing (zid) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE TABLE stock_listing2 (
  exchange text,
  symbol text,
  industry text,
  lasttradedate timestamp,
  lasttradepriceonly double,
  marketcap text,
  name text,
  sector text,
  zid int,
  PRIMARY KEY ((exchange), symbol)
) WITH
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE TABLE transaction (
  portfolio_id timeuuid,
  transaction_id timeuuid,
  amount double,
  effective_date timestamp,
  price double,
  quantity double,
  symbol text,
  PRIMARY KEY ((portfolio_id), transaction_id)
) WITH CLUSTERING ORDER BY (transaction_id DESC) AND
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

CREATE TABLE user (
  email_address text,
  name text,
  password_hash text,
  PRIMARY KEY ((email_address))
) WITH
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.100000 AND
  gc_grace_seconds=864000 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='99.0PERCENTILE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'SizeTieredCompactionStrategy'} AND
  compression={'sstable_compression': 'LZ4Compressor'};

cqlsh> 

