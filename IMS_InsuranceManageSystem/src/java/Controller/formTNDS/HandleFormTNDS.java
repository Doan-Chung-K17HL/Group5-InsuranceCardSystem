    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.formTNDS;

import Dao.FormTNDS;
import Dao.UserDAO;
import Model.Form_TNDS;
import Model.TNDS_Level;
import Model.TNDS_LevelNop;
import Model.TNDS_Type;


import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.sql.Date;
import java.util.ArrayList;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author Dell
 */
@WebServlet(name="HandleFormTNDS", urlPatterns={"/HandleFormTNDS"})
public class HandleFormTNDS extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HandleFormTNDS</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HandleFormTNDS at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        FormTNDS dao = new FormTNDS();
         ArrayList<TNDS_Type> listType = dao.getAllType();
         ArrayList<TNDS_Level> listLevel = dao.getAllLevel();
         ArrayList<Integer> listNum = dao.getNumberOfPerson();
          // Set data as attributes in the request
        request.setAttribute("listType", listType);
        request.setAttribute("listLevel", listLevel);
        request.setAttribute("listNum", listNum);
      
        // Forward the request to the JSP page
        request.getRequestDispatcher("FormTNDS.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        StringBuilder jsonBuilder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonBuilder.append(line);
        }
         

        // Khởi tạo một đối tượng JSONParser
        JSONParser parser = new JSONParser();
        try {
            JSONObject jsonObject = (JSONObject) parser.parse(jsonBuilder.toString());
            int type = Integer.parseInt((String) jsonObject.get("type")); 
            String level = (String) jsonObject.get("level");
            String num = (String) jsonObject.get("num");
            
            System.out.println(type);
            System.out.println(level);
            System.out.println(num);
            
            FormTNDS dao = new FormTNDS();
            TNDS_LevelNop ln = dao.getLevelNop(Integer.parseInt(num), Integer.parseInt(level));
            TNDS_Type type_object = dao.getType(type);
            int lnPrice = ln.getLn_price();
            System.out.println(lnPrice);
            Form_TNDS form = dao.getForm_TNDS(type, ln.getLn_id());
            
            
//    // Gửi dữ liệu về trang JSP dưới dạng JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        System.out.println("{\"levelFee\": \"" + lnPrice + "\", \"taxFee\": \"" + 1 + "\"}");
        out.println("{\"levelFee\": \"" + lnPrice + "\", \"taxFee\": \"" + type_object.getType_tax_price() + "\"}");
//          out.println("{\"levelFee\": \"" + lnPrice + "\", \"taxFee\": \"" + type_object.getType_tax_price() + "\", \"totalPrice\": \"" + form.getFtnds_totalPrice() + "\"}");

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/plain");
            PrintWriter out = response.getWriter();
            out.println("Có lỗi xảy ra khi cập nhật thông tin");
        }
        

       
}


    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
