package com.university.controller;

import com.university.model.Course;
import com.university.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CourseController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/courses")
    public String listCourses(HttpSession session, Model model) {
        if (session.getAttribute("student") == null) {
            return "redirect:/login";
        }
        Student student = (Student) session.getAttribute("student");

        String sql = "SELECT c.* FROM courses c WHERE c.course_id NOT IN " +
                     "(SELECT course_id FROM registrations WHERE student_id = ?)";
        List<Course> courses = jdbcTemplate.query(sql,
            new Object[]{student.getStudentId()},
            (rs, rowNum) -> {
                Course c = new Course();
                c.setCourseId(rs.getInt("course_id"));
                c.setName(rs.getString("name"));
                c.setInstructor(rs.getString("instructor"));
                c.setCredits(rs.getInt("credits"));
                return c;
            });

        model.addAttribute("courses", courses);
        model.addAttribute("student", student);
        return "courses";
    }

    @PostMapping("/register/{courseId}")
    public String registerCourse(@PathVariable int courseId,
                                 HttpSession session,
                                 Model model) {
        if (session.getAttribute("student") == null) {
            return "redirect:/login";
        }
        Student student = (Student) session.getAttribute("student");

        jdbcTemplate.update(
            "INSERT INTO registrations (student_id, course_id, date) VALUES (?, ?, CURDATE())",
            student.getStudentId(), courseId);

        Course course = jdbcTemplate.queryForObject(
            "SELECT * FROM courses WHERE course_id = ?",
            new Object[]{courseId},
            (rs, rowNum) -> {
                Course c = new Course();
                c.setCourseId(rs.getInt("course_id"));
                c.setName(rs.getString("name"));
                c.setInstructor(rs.getString("instructor"));
                c.setCredits(rs.getInt("credits"));
                return c;
            });

        model.addAttribute("course", course);
        model.addAttribute("student", student);
        return "success";
    }
}
