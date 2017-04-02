
function focuspwd2() {
//	this.form1.pwd1.focus();
}

function modpwdr() {
	console.log("modpwdr");
	
	if (this.document.getElementsByName("user.username")[0].value.length ==0) {//user.username
		console.log("inside");
		window.alert("用户名不能为空！");
//		form2.user.username.focus();
		return false;

	}
	
//	if (this.form2[0]["user.username"].value.length ==0) {//user.username
//		console.log("inside");
//		window.alert("用户名不能为空xx！");
////		form2.user.username.focus();
//		return false;
//
//	}
}