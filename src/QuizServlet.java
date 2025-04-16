import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.util.*;

@WebServlet("/quiz")
public class QuizServlet extends HttpServlet {
    private static final Map<String, String> CAPITALS = new HashMap<>();
    
    static {
        CAPITALS.put("japan", "Tokyo");
        CAPITALS.put("france", "Paris");
        CAPITALS.put("italy", "Rome");
        CAPITALS.put("spain", "Madrid");
        CAPITALS.put("germany", "Berlin");
        CAPITALS.put("united kingdom", "London");
        CAPITALS.put("russia", "Moscow");
        CAPITALS.put("china", "Beijing");
        CAPITALS.put("india", "New Delhi");
        CAPITALS.put("brazil", "Brasília");
        CAPITALS.put("australia", "Canberra");
        CAPITALS.put("canada", "Ottawa");
        CAPITALS.put("mexico", "Mexico City");
        CAPITALS.put("south africa", "Pretoria");
        CAPITALS.put("egypt", "Cairo");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get a random capital and its country
        List<String> countries = new ArrayList<>(CAPITALS.keySet());
        String randomCountry = countries.get(new Random().nextInt(countries.size()));
        String capital = CAPITALS.get(randomCountry);
        
        // Store in session for checking the answer later
        HttpSession session = request.getSession();
        session.setAttribute("correctCountry", randomCountry);
        session.setAttribute("currentCapital", capital);
        
        // Forward to the quiz page
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String answer = request.getParameter("answer");
        HttpSession session = request.getSession();
        String correctCountry = (String) session.getAttribute("correctCountry");
        String currentCapital = (String) session.getAttribute("currentCapital");
        
        // Trim whitespace and convert to lowercase for case-insensitive comparison
        boolean correct = correctCountry.equals(answer != null ? answer.trim().toLowerCase() : "");
        
        request.setAttribute("isCorrect", correct);
        request.setAttribute("correctCountry", correctCountry);
        request.setAttribute("currentCapital", currentCapital);
        
        RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
        rd.forward(request, response);
    }
}
