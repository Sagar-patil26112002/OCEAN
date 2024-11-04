<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<%       
int jid = Integer.parseInt(request.getParameter("id"));
int exp = Integer.parseInt(request.getParameter("exp"));
%>


      <div class="wrapper">
         <div class="title-text">
            <div class="title login">
                CANDIDATE INFORMATION
            </div>
           
         </div>
         <div class="form-container">
        
              
               
               <div class="slider-tab"></div>
            </div>
            <div class="form-inner">
            
               <form action="aaplyjobs" method="post" class="login">
                <div class="field">
                     <input type="number" placeholder="Enter Job ID" value="<%=jid%>" name="jid" readonly>
                  </div>
                   <div class="field">
                     <input type="text" placeholder="Name" name="name" required>
                  </div>
                  <div class="field">
                     <input type="text" placeholder="EMAIL" name="email" required>
                  </div>
                  <div class="field">
                     <input type="text" placeholder="EDUCATION" name="education" required>
                  </div>
                   <div class="field">
                     <input type="number" placeholder="AGE" name="age" required>
                  </div>
                   <div class="field">
                     <label>EXPERIENCE</label>
                     <input type="number" placeholder="EXPERIENCE" name="experience" min="<%=exp %>" required>
                  </div>
                  <div class="pass-link">
                     <a href="admincheck"></a>
                  </div>
                  <div class="field btn">
                     <div class="btn-layer"></div>
                     <input type="submit" value="submit">
                  </div>
               </form>
            
            </div>
         </div>
      </div>
      <script>
         const loginText = document.querySelector(".title-text .login");
         const loginForm = document.querySelector("form.login");
         const loginBtn = document.querySelector("label.login");
         const signupBtn = document.querySelector("label.signup");
         const signupLink = document.querySelector("form .signup-link a");
         signupBtn.onclick = (()=>{
           loginForm.style.marginLeft = "-50%";
           loginText.style.marginLeft = "-50%";
         });
         loginBtn.onclick = (()=>{
           loginForm.style.marginLeft = "0%";
           loginText.style.marginLeft = "0%";
         });
         signupLink.onclick = (()=>{
           signupBtn.click();
           return false;
         });
      </script>
   </body>
</html>