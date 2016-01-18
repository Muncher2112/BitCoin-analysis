trades = LOAD 'output4_parsed.txt' AS (timeStamp:chararray, tradeID:chararray, rate:double, amount:double, site:chararray, type:chararray, time:chararray);
tradeSorted = group trades by type;
avg = foreach tradeSorted {
	sum = SUM(trades.amount);
	count = COUNT(trades);
	generate sum/count as mean;
};
store avg into 'output4_avg';
