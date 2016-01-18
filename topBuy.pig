trades = LOAD 'output4_parsed.txt' AS (timeStamp:chararray, tradeID:chararray, rate:double, amount:double, site:chararray, type:chararray, time:chararray);
tradeSorted = GROUP trades by type;
top3 = foreach tradeSorted {
	sortTrades = order trades by amount desc;
	doneSort = LIMIT sortTrades 5;
	GENERATE group, flatten(doneSort);
};
store top3 into 'output4_top';
