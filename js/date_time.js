function myclock(id)
{
	// taken from http://www.webestools.com/scripts_tutorials-code-source-7-display-date-and-time-in-javascript-real-time-clock-javascript-date-time.html

	date = new Date;

	year = date.getFullYear();
	month = date.getMonth();
	//months = new Array('January', 'February', 'March', 'April', 'May', 'June', 'Jully', 'August', 'September', 'October', 'November', 'December');
	d = date.getDate();
	day = date.getDay();
	//days = new Array('Sonntag', 'Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag');
	days = new Array('So', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa');
	h = date.getHours();
	if(h<10)
	{
		h = "0"+h;
	}
	m = date.getMinutes();
	if(m<10)
	{
		m = "0"+m;
	}
	s = date.getSeconds();
	if(s<10)
	{
		s = "0"+s;
	}

	result = ''+days[day]+', '+year+'-'+month+'-'+d+' &nbsp;&nbsp;&nbsp; '+h+':'+m+':'+s;
	//result = date.toGMTString();
	//result = date.toString();

	document.getElementById(id).innerHTML = result;
	setTimeout('myclock("'+id+'");','1000');
	return true;
}
