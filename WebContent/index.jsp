<%@ page contentType="text/html;charset=UTF-8" %>
<%
    // If no capital is set in the session, redirect to the servlet
    if (session.getAttribute("currentCapital") == null) {
        response.sendRedirect("quiz");
        return;
    }
    String currentCapital = (String) session.getAttribute("currentCapital");
%>
<html>
<head>
    <title>Geography Quiz</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .quiz-container {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            max-width: 600px;
            width: 100%;
        }
        
        h2 {
            color: #2c3e50;
            margin-bottom: 1.5rem;
            text-align: center;
            font-size: 1.8rem;
        }
        
        .input-container {
            margin: 2rem 0;
        }
        
        input[type="text"] {
            width: 100%;
            padding: 1rem;
            font-size: 1.1rem;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        input[type="text"]:focus {
            outline: none;
            border-color: #4CAF50;
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.1);
        }
        
        input[type="text"]::placeholder {
            color: #adb5bd;
        }
        
        .hint {
            color: #6c757d;
            font-size: 0.9rem;
            margin-top: 0.5rem;
            text-align: center;
        }
        
        input[type="submit"] {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-size: 1.1rem;
            transition: background 0.3s ease;
        }
        
        input[type="submit"]:hover {
            background: #45a049;
        }
        
        @media (max-width: 480px) {
            .quiz-container {
                padding: 1.5rem;
            }
            
            h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="quiz-container">
        <h2>Which country has this capital: <span style="color: #4CAF50"><%= currentCapital %></span>?</h2>
        <form action="quiz" method="post">
            <div class="input-container">
                <input type="text" name="answer" placeholder="Enter the country name" required>
                <div class="hint">Type your answer (case doesn't matter)</div>
            </div>
            <input type="submit" value="Submit Answer">
        </form>
    </div>
</body>
</html>
