package com.university.controller;

import com.university.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/login")
    public String showLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String email,
                               @RequestParam String password,
                               HttpServletRequest request,
                               HttpSession session,
                               Model model) {
        String sql = "SELECT * FROM students WHERE email = ? AND password = ?";
        List<Student> results = jdbcTemplate.query(sql,
            new Object[]{email, password},
            (rs, rowNum) -> {
                Student s = new Student();
                s.setStudentId(rs.getInt("student_id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                return s;
            });

        if (!results.isEmpty()) {
            session.setAttribute("student", results.get(0));
            request.setAttribute("loginResult", "success");
            return "redirect:/courses";
        }

        request.setAttribute("loginResult", "failure");
        model.addAttribute("error", "Invalid email or password.");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
