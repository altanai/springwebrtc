function validateLogin()
{
	var id=document.login.uid;
	var passwd=document.login.passwd;
	var valid = /^[0-9]+$/;
	var bool=true;

	if (id.value==null || id.value=="")
	{
		document.getElementById("one").innerHTML="<font color='red'> Please Enter Id.</font>";
		id.focus;
		bool=false;
	}
	else 
		{
		if( !id.value.match(valid))
		
		{
			document.getElementById("one").innerHTML="<font color='red'>Please Enter valid Id.";
			id.focus;
			bool=false;
		}
		else
		{
			document.getElementById("one").innerHTML="";
		
		}
		}
	if (passwd.value==null || passwd.value=="")
	{
		document.getElementById("two").innerHTML="<font color='red'>Please Enter Password.</font>";
		passwd.focus;
		bool=false;
	}
	else
	{
		document.getElementById("two").innerHTML="";
		
	}
	

return bool;
}

function validation()
{
	document.getElementById("one").innerHTML="";
	document.getElementById("two").innerHTML="";
	
}