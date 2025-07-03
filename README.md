# 📝 Online Exam Management System

## 📌 Overview

The **Online Exam System** is a dynamic web-based application developed using Java technologies (JSP, Servlets, JDBC, and MVC architecture) to conduct and manage online examinations for students. 
It provides separate interfaces for **Admin** and **Students**, enabling exam creation, question management, real-time exam participation, and result evaluation.

---

## 🚀 Features

### 👤 User Module
- User registration and login
- Role-based access (Student/Admin)
- Secure password handling

### 🧑‍🏫 Admin Module
- Add, edit, delete exams
- Add and manage questions for each exam
- View all student results
- Dashboard overview

### 🧑‍🎓 Student Module
- View available exams
- Attempt MCQ-based tests
- Auto-calculated score upon submission
- View past results

---

## 🛠️ Technologies Used

| Category           | Tech Stack                                      |
|-------------------|--------------------------------------------------|
| **Frontend**       | HTML, CSS, JavaScript, Bootstrap                |
| **Backend**        | Java (JSP, Servlets), JDBC, MVC Architecture    |
| **Database**       | MySQL                                           |
| **IDE**            | Eclipse                                         |
| **Server**         | Apache Tomcat                                   |
| **Tools**          | SQLyog or MySQL Workbench for DB management     |

---

## 🗃️ Database Schema

**Database Name:** `online_exam_system`

### Tables:
- `users(id, name, email, password, role)`
- `exams(id, title, date, duration)`
- `questions(id, exam_id, question_text, option1, option2, option3, option4, correct_option)`
- `results(id, user_id, exam_id, score, date_taken)`

> ✅ You can modify or extend the schema to add more fields (like timer, negative marking, etc.)

---

## 🧱 Project Structure

OnlineExamSystem/
│
├── WebContent/
│ ├── register.jsp
│ ├── login.jsp
│ ├── dashboard.jsp
│ ├── admin.jsp
│ └── exam.jsp
│
├── src/
│ ├── com.model/
│ │ └── UserVO.java, ExamVO.java, QuestionVO.java
│ ├── com.dao/
│ │ └── UserDAO.java, ExamDAO.java, QuestionDAO.java
│ └── com.controller/
│ └── RegController.java, LoginController.java, ExamController.java
│
├── lib/ (JAR dependencies like MySQL JDBC)
└── README.md

## 🧪 How to Run

1. **Clone or Download** the project.
2. **Import in Eclipse** as a Dynamic Web Project.
3. **Create MySQL Database** using the schema above.
4. **Update DB Credentials** in the DAO files.
5. **Add MySQL Connector JAR** to the `lib` folder.
6. **Run on Apache Tomcat Server**.
7. Open the browser and go to:  
   `http://localhost:8080/OnlineExamSystem/`
