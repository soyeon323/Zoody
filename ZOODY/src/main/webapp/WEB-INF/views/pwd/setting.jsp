<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    html ,body{
        background-color: #f4f7fd;
    }

    #wrap{
        margin: auto;
        margin-top: 130px;
        width: 500px;
        height: 600px;
        background-color: white;
        border: 2px solid black;
        border-radius: 20px;
    }

    form{
        display: grid;
        grid-template-rows: 3fr 1fr 1fr 1fr;
        grid-gap: 50px;
        place-content: center center;      
    }

    form input{
        row-gap: 20px;
    }

    .btn btn-primary{
        color: rgb(105, 105, 204);
    }
    
</style>
</head>
<body>
		<div id="wrap">
            <form action="" method="POST">
                <input type="text" name="id" placeholder="ID">
                <input class="btn btn-primary" style="color: whitesmoke;" type="submit" value="비밀번호 설정하기"> 
                <input type="text" name="" placeholder="ID">
                <input type="text" name="" placeholder="ID">
                <input class="btn btn-primary" style="color: whitesmoke;" type="submit" value="비밀번호 설정하기"> 
            </form>
		</div>
</body>
</html>