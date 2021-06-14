/**
 * 
 */
 
 function getContextPath(){
	var hostIndex=location.href.indexOf(location.host) +location.host.length;
	console.log(location.host);
	return location.href.substring(hostIndex,location.href.indexOf('/',hostIndex+1));
 }