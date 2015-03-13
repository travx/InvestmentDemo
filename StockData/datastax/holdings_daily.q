insert overwrite table stocks.holdings_daily
select portfolio_id, TO_DATE(from_unixtime(unix_timestamp())), symbol, quantity
from stocks.holdings;

insert overwrite table stocks.portfolio_daily
select portfolio_id, TO_DATE(from_unixtime(unix_timestamp())), sum(h.quantity * sl.lasttradepriceonly), sum(h.quantity * sl.lasttradepriceonly)
from stocks.holdings h
	join stocks.stock_listing sl
		on h.symbol = sl.symbol
group by portfolio_id, TO_DATE(from_unixtime(unix_timestamp()))
