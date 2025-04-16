<%@ page contentType="text/html;charset=UTF-8" %>
<%
    boolean isCorrect = (Boolean) request.getAttribute("isCorrect");
    String correctCountry = (String) session.getAttribute("correctCountry");
    String currentCapital = (String) session.getAttribute("currentCapital");
    
    // Capitalize first letter of each word in the country name
    String[] words = correctCountry.split(" ");
    for (int i = 0; i < words.length; i++) {
        words[i] = words[i].substring(0, 1).toUpperCase() + words[i].substring(1);
    }
    String formattedCountry = String.join(" ", words);
%>
<html>
<head>
    <title>Quiz Result</title>
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
        
        .result-container {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            max-width: 600px;
            width: 100%;
            text-align: center;
        }
        
        .result-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
        }
        
        .correct {
            color: #4CAF50;
        }
        
        .incorrect {
            color: #f44336;
        }
        
        h2 {
            color: #2c3e50;
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
        }
        
        .try-again {
            display: inline-block;
            background: #4CAF50;
            color: white;
            text-decoration: none;
            padding: 1rem 2rem;
            border-radius: 8px;
            margin-top: 1rem;
            transition: all 0.3s ease;
        }
        
        .try-again:hover {
            background: #45a049;
            transform: translateY(-2px);
        }
        
        @media (max-width: 480px) {
            .result-container {
                padding: 1.5rem;
            }
            
            h2 {
                font-size: 1.5rem;
            }
            
            .result-icon {
                font-size: 3rem;
            }
        }
    </style>
</head>
<body>
    <div class="result-container">
        <div class="result-icon <%= isCorrect ? "correct" : "incorrect" %>">
            <%= isCorrect ? "✓" : "✗" %>
        </div>
        <h2>
            <%= isCorrect ? "Correct! Well done!" : "Incorrect! The correct answer was " + formattedCountry + "." %>
        </h2>
        <a href="quiz" class="try-again">Try Another Question</a>
    </div>
</body>
</html>
