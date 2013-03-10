function include(what)
{
	switch(what)
	{
	case 'topbar':
		document.write('\
			<header id="topbar" class="body">\
				<nav id="menu">\
					<ul>\
						<li><a href="index.html">START</a></li>\
						<li><a href="map.html">Karte</a></li>\
						<li>blubber</li>\
						<li>blabber</li>\
						<li><a href="info.html">Infos/Hilfe</a></li>\
					</ul>\
				</nav>\
				<div id="indicator">\
					<span id="clock"></span>\
				</div>\
			</header>\
		');
		break;
	case 'bottomline':
		document.write('\
			<footer id="bottomline" class="body">\
				<span id="info" align="center"><small><em>Aktuell ist dies eher eine Skizze. Zwar funktionieren die eingebundenen Bus- und Müllabfuhrpläne oder die Karte schon, aber eigentlich alles ist noch feinste <strong>work in progress</strong>.</em></small></span>\
			</footer>\
		');
		break;
	default:
		document.write('<!-- You wanted to include something here but probably didn\'t decide on what ;-) -->');
	}

}
