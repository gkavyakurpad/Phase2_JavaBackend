<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet"> <!-- Corrected line to properly reference the local CSS file -->
<meta charset="ISO-8859-1">
<title>MyZumbaApp Login (Participant)</title>
</head>

  <body class="vh-100">
    <div class="container h-100">
      <div class="loginContainer">
        <div class="loginWrapper">
          <div class="loginTitle">
            <h1>MyZumba App (Participant)</h1>
          </div>
          <div class="loginContent">
            <form action="Participant/ParticipantLogin.jsp">
              <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label"
                  >Username</label
                >
                <input type="text" class="form-control" name="username" />
              </div>

              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" />
              </div>

              <button type="submit" class="btn btn-primary">Submit</button>
            </form>
            <div class="login">
            <p>
            	<a href="index.jsp">Click Here</a> To Login as Admin
            <p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>