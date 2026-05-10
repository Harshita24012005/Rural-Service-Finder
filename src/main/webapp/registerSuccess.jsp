<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

    <style>
        body {
            background: var(--cream);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .success-box {
            background: var(--white);
            padding: 50px 40px;
            border-radius: var(--radius-xl);
            box-shadow: var(--shadow-lg);
            text-align: center;
            max-width: 420px;
            animation: fadeUp 0.6s ease;
        }

        .success-icon {
            width: 90px;
            height: 90px;
            background: var(--green-pale);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 40px;
            color: var(--green-main);
            border: 3px solid var(--green-light);
        }

        .success-box h2 {
            font-family: 'Playfair Display', serif;
            font-size: 26px;
            color: var(--green-dark);
            margin-bottom: 10px;
        }

        .success-box p {
            font-size: 14px;
            color: var(--text-mid);
            margin-bottom: 25px;
            line-height: 1.6;
        }

        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .btn {
            padding: 12px;
            border-radius: var(--radius-md);
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
            transition: var(--transition);
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--green-main), var(--green-mid));
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .btn-outline {
            border: 1.5px solid var(--green-mid);
            color: var(--green-main);
            background: transparent;
        }

        .btn-outline:hover {
            background: var(--green-pale);
        }
    </style>
</head>

<body>

<div class="success-box">

    <div class="success-icon">
        ✔
    </div>

    <h2>Registration Successful</h2>

    <p>
        Welcome to Rural Service Finder 🌿<br>
        Your account has been created successfully.
    </p>

    <div class="btn-group">

        <a href="login.jsp" class="btn btn-primary">
            Go to Login →
        </a>

        <a href="home.jsp" class="btn btn-outline">
            Back to Home
        </a>

    </div>

</div>

</body>
</html>