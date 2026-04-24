<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>University Registration - Login</title>
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
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.12);
            width: 100%;
            max-width: 400px;
        }
        h2 { text-align: center; color: #1a3c6e; margin-bottom: 24px; }
        label { display: block; margin-bottom: 6px; font-weight: bold; color: #333; }
        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 16px;
            font-size: 14px;
        }
        button {
            width: 100%;
            padding: 11px;
            background: #1a3c6e;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 15px;
            cursor: pointer;
        }
        button:hover { background: #14306a; }
        .error {
            background: #fde8e8;
            color: #c0392b;
            padding: 10px 12px;
            border-radius: 4px;
            margin-bottom: 16px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="card">
    <h2>University Portal</h2>
    <% if (request.getAttribute("error") != null) { %>
        <div class="error">${error}</div>
    <% } %>
    <form method="post" action="${pageContext.request.contextPath}/login">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="e.g. alice@university.edu" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter password" required>

        <button type="submit">Sign In</button>
    </form>
</div>
</body>
</html>
