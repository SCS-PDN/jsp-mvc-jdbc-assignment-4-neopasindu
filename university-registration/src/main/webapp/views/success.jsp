<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Successful</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .card {
            background: #fff;
            padding: 48px 40px;
            border-radius: 8px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.12);
            max-width: 480px;
            width: 100%;
            text-align: center;
        }
        .icon { font-size: 56px; margin-bottom: 16px; color: #27ae60; }
        h2 { color: #27ae60; margin-bottom: 12px; }
        p { color: #555; margin-bottom: 8px; font-size: 15px; }
        .detail { font-weight: bold; color: #1a3c6e; }
        .actions { margin-top: 28px; display: flex; gap: 12px; justify-content: center; }
        a {
            display: inline-block;
            padding: 10px 24px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 14px;
        }
        .btn-primary { background: #1a3c6e; color: #fff; }
        .btn-primary:hover { background: #14306a; }
        .btn-secondary { background: #eee; color: #333; }
        .btn-secondary:hover { background: #ddd; }
    </style>
</head>
<body>
<div class="card">
    <div class="icon">&#10003;</div>
    <h2>Registration Successful!</h2>
    <p>Hello, <span class="detail">${student.name}</span></p>
    <p>You have been registered for:</p>
    <p class="detail">${course.name}</p>
    <p>Instructor: <span class="detail">${course.instructor}</span>
       &nbsp;|&nbsp; Credits: <span class="detail">${course.credits}</span></p>
    <div class="actions">
        <a href="${pageContext.request.contextPath}/courses" class="btn-primary">Register Another</a>
        <a href="${pageContext.request.contextPath}/logout" class="btn-secondary">Logout</a>
    </div>
</div>
</body>
</html>
