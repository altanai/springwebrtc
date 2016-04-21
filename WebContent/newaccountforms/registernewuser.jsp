
 
 <form name="f2" onsubmit="return validateRegistration(this);" method="get" action="../loginServlet">
<table>
<tr>
<td>Display Name*:</td>
<td><input type="text" name="displayName" id="displayName" onblur="checkDisplayName('displayName')"></td><td id="nameError" style="color: red;"></td>
</tr>
<tr>
<td>Public Identity*:</td>
<td><input type="text" name="publicIdentity" id="publicIdentity" onblur="checkPublicIdentity('publicIdentity')"></td><td id="publicIdenError" style="color: red;"></td>
</tr>
<tr>
<td>Private Identity*:</td>
<td><input type="text" name="privateIdentity" id="privateIdentity" onblur="checkPrivateIdentity('privateIdentity')"></td><td id="privateIdenError" style="color: red;"></td>
</tr>
<tr>
<td>Password*:</td>
<td><input type="password" name="password" id="password" onblur="checkPassword('password')"></td><td id="passwordError" style="color: red;"></td>
</tr>
<!-- <tr> -->
<!-- <td>WS Uri:</td> -->
<!-- <td><input type="text" name="wsuri"></td><td></td> -->
<!-- </tr> -->
<tr>
<td>Realm*:</td>
<td><input type="text" name="realm" id="realm" onblur="checkRealm('realm')"></td><td id="realmError" style="color: red;"></td>
</tr>
<tr>
<td>Secret Question:</td>
<td><select name="secretQuestion" id="secretQuestion" onblur="secretQuestion('secretQuestion');">
<option value ="Select">----Select---</option>
<option value="nameOfFavouriteTeacher">Name Of Favourite Teacher</option>
<option value="placeOfBirth">Place Of Birth</option>
<option value="motherMedianName">Mother Median Name</option>
<option value="bestFriend'sName">Best Friend's Name</option>
<option value="favouritePalace">Favourite Palace</option>
</select></td><td id="quesError" style="color: red;"></td>
</tr>
<tr>
<td>Secret Answer*:</td>
<td><input type="text" name="secretAnswer" id="secretAnswer" onblur="checkForSecretAnswer('secretAnswer');"/></td><td id="answerError" style="color: red;"></td>
</tr>
 <tr>

<td  align="center"><input type="submit" name="register" value="Submit"/></td>
<td ><input type="reset" name="reset" value="Reset"/></td>
</tr>
</table>
</form> 