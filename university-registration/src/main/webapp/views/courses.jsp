<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Courses</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f0f2f5; }
        header {
            background: #1a3c6e;
            color: #fff;
            padding: 14px 32px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header h1 { font-size: 20px; }
        header a { color: #cce0ff; text-decoration: none; font-size: 14px; }
        header a:hover { text-decoration: underline; }
        .container { max-width: 900px; margin: 32px auto; padding: 0 16px; }
        h2 { color: #1a3c6e; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; background: #fff;
                border-radius: 8px; overflow: hidden;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        th { background: #1a3c6e; color: #fff; padding: 12px 16px; text-align: left; }
        td { padding: 12px 16px; border-bottom: 1px solid #eee; color: #333; }
        tr:last-child td { border-bottom: none; }
        tr:hover td { background: #f7f9fc; }
        .btn-register {
            background: #27ae60;
            color: #fff;
            border: none;
            padding: 7px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 13px;
        }
        .btn-register:hover { background: #219150; }
        .empty { text-align: center; padding: 32px; color: #777; }
    </style>
</head>
<body>
<header>
    <h1>University Registration</h1>
    <span>Welcome, ${student.name} &nbsp;|&nbsp; <a href="${pageContext.request.contextPath}/logout">Logout</a></span>
</header>
<div class="container">
    <h2>Available Courses</h2>
    <c:choose>
        <c:when test="${empty courses}">
            <p class="empty">You are already registered for all available courses.</p>
        </c:when>
        <c:otherwise>
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Course Name</th>
                        <th>Instructor</th>
                        <th>Credits</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="course" items="${courses}">
                        <tr>
                            <td>${course.courseId}</td>
                            <td>${course.name}</td>
                            <td>${course.instructor}</td>
                            <td>${course.credits}</td>
                            <td>
                                <form method="post"
                                      action="${pageContext.request.contextPath}/register/${course.courseId}">
                                    <button class="btn-register" type="submit">Register</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
