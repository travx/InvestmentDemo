DROP TABLE IF EXISTS stocks.run_time;
CREATE TABLE stocks.run_time(
        run timestamp);

insert overwrite table stocks.run_time
select from_unixtime(unix_timestamp()) from stocks.dummy;

insert overwrite table stocks.holdings_daily
select hd.portfolio_id, hd.lasttradeday, hd.symbol, hd.current_quantity+c.quantity, hd.original_quantity
from stocks.correction c
  join stocks.run_time rt
    on c.status = 'PENDING'
  join stocks.holdings_daily hd
    on hd.portfolio_id = c.portfolio_id
    and hd.symbol = c.symbol
where c.correction_date <= rt.run
and hd.lasttradeday >= TO_DATE(c.effective_date);


insert overwrite table stocks.portfolio_daily
select hd.portfolio_id, hd.lasttradeday, sum(hd.current_quantity * coalesce(qd.lasttradepriceonly, 1.0)), sum(hd.original_quantity * coalesce(qd.lasttradepriceonly,1.0))
from stocks.holdings_daily hd
  left outer join stocks.quote_daily qd
    on hd.symbol = qd.symbol
    and hd.lasttradeday = qd.lasttradeday
  join stocks.correction c
    on hd.portfolio_id = c.portfolio_id
    and hd.symbol = c.symbol
  join stocks.run_time rt
    on c.status = 'PENDING'
where c.correction_date <= rt.run
group by hd.portfolio_id, hd.lasttradeday;


insert overwrite table stocks.correction
select c.portfolio_id, c.correction_date, c.effective_date, c.quantity, 'COMPLETE', c.symbol
from stocks.correction c
join stocks.run_time rt
on c.status = 'PENDING'
where c.correction_date <= rt.run;

DROP TABLE IF EXISTS stocks.run_time;

