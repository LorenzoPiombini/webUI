
function get_week_start()
	today_second = os.time()
	start = os.date('%w',today_second)
	if start == 0 then
		return today_second
	end
	return today_second - (start *(60*60*24))
end

function get_week_end()
	today_second = os.time()
	finish = os.date('%w',today_second)
	if finish == 6 then
		return today_second
	end
	return today_second + ((finish +(6 - finish)) *(60*60*24))
end

function date()
	today = get_week_start()
	time = os.date("%m-%d-%Y",today)
	m,d,y = string.match(time,"(%d+)-(%d+)-(%d+)")
	date = {year  = y ,month = m, day = d}
	tab= os.time(date)
	print(string.format('the seconds of %s are %d',time,tab))
	print(string.format('to prove the point %d seconds are %s, and the day is %d',tab,os.date('%m-%d-%Y',tab),os.date("%w",tab)))
	print(string.format('this week ends on %s',os.date('%m-%d-%Y',get_week_end())))
end

date()
