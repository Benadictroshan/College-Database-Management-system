CREATE DATABASE collegeDB;
USE collegeDB;

-- Departments Table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE
);

-- Students Table
CREATE VIEW StudentProfile AS
SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    s.email,
    s.phone,
    d.department_name,
    s.dob,
    s.gender,
    s.department_id
FROM Students s
JOIN Departments d ON s.department_id = d.department_id;

SELECT * FROM StudentProfile;


-- Professors Table
CREATE TABLE Professors (
    professor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE SET NULL
);

-- Courses Table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    department_id INT,
    credits INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE SET NULL
);

-- Enrollments Table (Student-Course Many-to-Many Relationship)
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(10),
    year INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- Faculty Assignments Table (Professor-Course Relationship)
CREATE TABLE FacultyAssignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    professor_id INT,
    course_id INT,
    FOREIGN KEY (professor_id) REFERENCES Professors(professor_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- Classrooms Table
CREATE TABLE Classrooms (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(20) UNIQUE,
    capacity INT
);

-- Timetable Table
CREATE TABLE Timetable (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    classroom_id INT,
    day_of_week ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'),
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE,
    FOREIGN KEY (classroom_id) REFERENCES Classrooms(classroom_id) ON DELETE CASCADE
);

-- Exams Table
CREATE TABLE Exams (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    exam_date DATE,
    exam_type ENUM('Midterm', 'Final', 'Quiz'),
    total_marks INT,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- Exam Results Table
CREATE TABLE ExamResults (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    exam_id INT,
    obtained_marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (exam_id) REFERENCES Exams(exam_id) ON DELETE CASCADE
);


INSERT INTO Departments (department_name) VALUES
('Computer Science'),
('Mechanical Engineering'),
('Electrical Engineering'),
('Civil Engineering'),
('Biomedical Engineering'),
('Aerospace Engineering'),
('Chemical Engineering'),
('Environmental Science'),
('Physics'),
('Mathematics'),
('Statistics'),
('Biology'),
('Psychology'),
('Business Administration'),
('Law');


INSERT INTO Students (first_name, last_name, dob, gender, email, phone, department_id) VALUES
('John', 'Doe', '2002-05-15', 'Male', 'john.doe@example.com', '9876543210', 1),
('Jane', 'Smith', '2001-07-22', 'Female', 'jane.smith@example.com', '9876543211', 2),
('Alice', 'Johnson', '2003-03-10', 'Female', 'alice.johnson@example.com', '9876543212', 1),
('Bob', 'Williams', '2000-12-05', 'Male', 'bob.williams@example.com', '9876543213', 3),
('Charlie', 'Brown', '2002-09-17', 'Male', 'charlie.brown@example.com', '9876543214', 2),
('David', 'Jones', '2001-06-25', 'Male', 'david.jones@example.com', '9876543215', 3),
('Emma', 'Garcia', '2002-04-19', 'Female', 'emma.garcia@example.com', '9876543216', 1),
('Fiona', 'Martinez', '2000-11-30', 'Female', 'fiona.martinez@example.com', '9876543217', 2),
('George', 'Harris', '2001-08-07', 'Male', 'george.harris@example.com', '9876543218', 3),
('Hannah', 'Clark', '2003-01-14', 'Female', 'hannah.clark@example.com', '9876543219', 1),
('Isaac', 'Lewis', '2002-02-28', 'Male', 'isaac.lewis@example.com', '9876543220', 2),
('Jack', 'Walker', '2000-10-13', 'Male', 'jack.walker@example.com', '9876543221', 3),
('Kate', 'Hall', '2001-09-21', 'Female', 'kate.hall@example.com', '9876543222', 1),
('Liam', 'Allen', '2003-07-05', 'Male', 'liam.allen@example.com', '9876543223', 2),
('Mia', 'Young', '2002-06-18', 'Female', 'mia.young@example.com', '9876543224', 3),
('Nathan', 'King', '2001-05-02', 'Male', 'nathan.king@example.com', '9876543225', 1),
('Olivia', 'Wright', '2003-03-23', 'Female', 'olivia.wright@example.com', '9876543226', 2),
('Paul', 'Scott', '2000-12-11', 'Male', 'paul.scott@example.com', '9876543227', 3),
('Quinn', 'Green', '2002-08-26', 'Other', 'quinn.green@example.com', '9876543228', 1),
('Rachel', 'Adams', '2001-07-08', 'Female', 'rachel.adams@example.com', '9876543229', 2),
('Samuel', 'Baker', '2002-04-14', 'Male', 'samuel.baker@example.com', '9876543230', 3),
('Tina', 'Perez', '2000-11-20', 'Female', 'tina.perez@example.com', '9876543231', 1),
('Umar', 'Collins', '2001-10-31', 'Male', 'umar.collins@example.com', '9876543232', 2),
('Victoria', 'Rivera', '2003-05-17', 'Female', 'victoria.rivera@example.com', '9876543233', 3),
('William', 'Carter', '2002-03-29', 'Male', 'william.carter@example.com', '9876543234', 1),
('Xavier', 'Mitchell', '2001-09-12', 'Male', 'xavier.mitchell@example.com', '9876543235', 2),
('Yasmin', 'Roberts', '2000-06-15', 'Female', 'yasmin.roberts@example.com', '9876543236', 3),
('Zack', 'Evans', '2002-01-04', 'Male', 'zack.evans@example.com', '9876543237', 1),
('Amelia', 'Torres', '2001-02-19', 'Female', 'amelia.torres@example.com', '9876543238', 2),
('Benjamin', 'Gomez', '2003-08-08', 'Male', 'benjamin.gomez@example.com', '9876543239', 3);


INSERT INTO Professors (first_name, last_name, email, phone, department_id) VALUES
('Dr. John', 'Doe', 'john.doe@example.com', '9876543210', 1),
('Dr. Alice', 'Smith', 'alice.smith@example.com', '9876543211', 2),
('Dr. Robert', 'Brown', 'robert.brown@example.com', '9876543212', 3),
('Dr. Emily', 'Davis', 'emily.davis@example.com', '9876543213', 4),
('Dr. Michael', 'Johnson', 'michael.johnson@example.com', '9876543214', 5),
('Dr. Jessica', 'White', 'jessica.white@example.com', '9876543215', 6),
('Dr. David', 'Miller', 'david.miller@example.com', '9876543216', 7),
('Dr. Sarah', 'Wilson', 'sarah.wilson@example.com', '9876543217', 8),
('Dr. Daniel', 'Moore', 'daniel.moore@example.com', '9876543218', 9),
('Dr. Laura', 'Taylor', 'laura.taylor@example.com', '9876543219', 10),
('Dr. James', 'Anderson', 'james.anderson@example.com', '9876543220', 11),
('Dr. Sophia', 'Thomas', 'sophia.thomas@example.com', '9876543221', 12),
('Dr. William', 'Jackson', 'william.jackson@example.com', '9876543222', 13),
('Dr. Olivia', 'Harris', 'olivia.harris@example.com', '9876543223', 14),
('Dr. Matthew', 'Martin', 'matthew.martin@example.com', '9876543224', 15),
('Dr. Ethan', 'Thompson', 'ethan.thompson@example.com', '9876543225', 1),
('Dr. Ava', 'Garcia', 'ava.garcia@example.com', '9876543226', 2),
('Dr. Benjamin', 'Martinez', 'benjamin.martinez@example.com', '9876543227', 3),
('Dr. Chloe', 'Robinson', 'chloe.robinson@example.com', '9876543228', 4),
('Dr. Alexander', 'Clark', 'alexander.clark@example.com', '9876543229', 5),
('Dr. Emma', 'Rodriguez', 'emma.rodriguez@example.com', '9876543230', 6),
('Dr. Mason', 'Lewis', 'mason.lewis@example.com', '9876543231', 7),
('Dr. Harper', 'Lee', 'harper.lee@example.com', '9876543232', 8),
('Dr. Logan', 'Walker', 'logan.walker@example.com', '9876543233', 9),
('Dr. Lily', 'Hall', 'lily.hall@example.com', '9876543234', 10),
('Dr. Jacob', 'Allen', 'jacob.allen@example.com', '9876543235', 11),
('Dr. Madison', 'Young', 'madison.young@example.com', '9876543236', 12),
('Dr. Elijah', 'King', 'elijah.king@example.com', '9876543237', 13),
('Dr. Grace', 'Wright', 'grace.wright@example.com', '9876543238', 14),
('Dr. Lucas', 'Scott', 'lucas.scott@example.com', '9876543239', 15);


INSERT INTO Courses (course_name, department_id, credits) VALUES
('Data Structures and Algorithms', 1, 4),
('Database Management Systems', 2, 3),
('Operating Systems', 3, 4),
('Computer Networks', 4, 3),
('Software Engineering', 5, 3),
('Artificial Intelligence', 6, 4),
('Machine Learning', 7, 3),
('Cyber Security', 8, 3),
('Digital Signal Processing', 9, 4),
('Cloud Computing', 10, 3),
('Embedded Systems', 11, 4),
('Big Data Analytics', 12, 3),
('Internet of Things (IoT)', 13, 4),
('Blockchain Technology', 14, 3),
('Human-Computer Interaction', 15, 3);

INSERT INTO Enrollments (student_id, course_id, semester, year) VALUES
(1, 3, 'Fall', 2024),
(2, 5, 'Spring', 2023),
(3, 1, 'Fall', 2022),
(4, 7, 'Spring', 2024),
(5, 2, 'Fall', 2023),
(6, 8, 'Spring', 2024),
(7, 4, 'Fall', 2023),
(8, 9, 'Spring', 2022),
(9, 6, 'Fall', 2024),
(10, 10, 'Spring', 2023),
(11, 12, 'Fall', 2022),
(12, 15, 'Spring', 2024),
(13, 3, 'Fall', 2023),
(14, 14, 'Spring', 2022),
(15, 1, 'Fall', 2024),
(16, 4, 'Spring', 2023),
(17, 6, 'Fall', 2022),
(18, 11, 'Spring', 2024),
(19, 8, 'Fall', 2023),
(20, 13, 'Spring', 2022),
(21, 3, 'Fall', 2024),
(22, 5, 'Spring', 2023),
(23, 1, 'Fall', 2022),
(24, 7, 'Spring', 2024),
(25, 2, 'Fall', 2023),
(26, 10, 'Spring', 2024),
(27, 14, 'Fall', 2023),
(28, 9, 'Spring', 2022),
(29, 12, 'Fall', 2024),
(30, 15, 'Spring', 2023);


INSERT INTO FacultyAssignments (professor_id, course_id) VALUES
(1, 3),(2, 5),(3, 1),(4, 7),(5, 2),
(6, 8),(7, 4),(8, 9),(9, 6),(10, 10),
(11, 12),(12, 15),(13, 3),(14, 14),(15, 1),
(16, 4),(17, 6),(18, 11),(19, 8),(20, 13),
(21, 3),(22, 5),(23, 1),(24, 7),(25, 2),
(26, 10),(27, 14),(28, 9),(29, 12),(30, 15);


INSERT INTO Classrooms (room_number, capacity) VALUES
('C101', 40),
('C102', 35),
('C103', 50),
('C104', 45),
('C105', 30),
('C106', 60),
('C107', 40),
('C108', 55),
('C109', 50),
('C110', 35),
('C111', 45),
('C112', 60),
('C113', 30),
('C114', 55),
('C115', 40);


INSERT INTO Timetable (course_id, classroom_id, day_of_week, start_time, end_time) VALUES
(1, 3, 'Monday', '09:00:00', '10:30:00'),
(2, 5, 'Tuesday', '10:45:00', '12:15:00'),
(3, 7, 'Wednesday', '13:00:00', '14:30:00'),
(4, 9, 'Thursday', '09:00:00', '10:30:00'),
(5, 11, 'Friday', '10:45:00', '12:15:00'),
(6, 13, 'Saturday', '13:00:00', '14:30:00'),
(7, 1, 'Monday', '14:45:00', '16:15:00'),
(8, 4, 'Tuesday', '09:00:00', '10:30:00'),
(9, 6, 'Wednesday', '10:45:00', '12:15:00'),
(10, 8, 'Thursday', '13:00:00', '14:30:00'),
(11, 10, 'Friday', '14:45:00', '16:15:00'),
(12, 12, 'Saturday', '09:00:00', '10:30:00'),
(13, 14, 'Monday', '10:45:00', '12:15:00'),
(14, 2, 'Tuesday', '13:00:00', '14:30:00'),
(15, 15, 'Wednesday', '14:45:00', '16:15:00');


INSERT INTO Exams (course_id, exam_date, exam_type, total_marks) VALUES
(1, '2024-04-10', 'Midterm', 60),
(2, '2024-05-15', 'Final', 100),
(3, '2024-03-20', 'Quiz', 25),
(4, '2024-06-05', 'Midterm', 70),
(5, '2024-07-10', 'Final', 100),
(6, '2024-04-25', 'Quiz', 30),
(7, '2024-08-20', 'Midterm', 55),
(8, '2024-09-15', 'Final', 100),
(9, '2024-05-10', 'Quiz', 20),
(10, '2024-10-01', 'Midterm', 65),
(11, '2024-06-12', 'Final', 100),
(12, '2024-07-05', 'Quiz', 28),
(13, '2024-04-22', 'Midterm', 75),
(14, '2024-05-30', 'Final', 100),
(15, '2024-08-10', 'Quiz', 22),
(1, '2024-09-05', 'Midterm', 60),
(2, '2024-10-20', 'Final', 100),
(3, '2024-06-30', 'Quiz', 30),
(4, '2024-07-15', 'Midterm', 50),
(5, '2024-11-10', 'Final', 100),
(6, '2024-08-05', 'Quiz', 25),
(7, '2024-12-15', 'Midterm', 70),
(8, '2024-09-25', 'Final', 100),
(9, '2024-10-15', 'Quiz', 20),
(10, '2024-11-22', 'Midterm', 55),
(11, '2024-12-10', 'Final', 100),
(12, '2024-08-28', 'Quiz', 27),
(13, '2024-06-14', 'Midterm', 75),
(14, '2024-07-22', 'Final', 100),
(15, '2024-09-30', 'Quiz', 23);


INSERT INTO ExamResults (student_id, exam_id, obtained_marks) VALUES
(1, 3, 22),(2, 5, 68),(3, 1, 55),(4, 7, 45),(5, 2, 92),(6, 8, 80),
(7, 4, 66),(8, 9, 18),(9, 6, 27),(10, 10, 58),(11, 12, 19),(12, 14, 98),
(13, 16, 62),(14, 18, 74),(15, 20, 23),(16, 22, 65),(17, 24, 94),(18, 26, 30),
(19, 28, 15),(20, 30, 88),(21, 1, 40),(22, 3, 20),(23, 5, 76),(24, 7, 52),
(25, 9, 25),(26, 11, 84),(27, 13, 68),(28, 15, 19),(29, 17, 90),(30, 19, 100);

-- Display All Students -- 1
DELIMITER //
CREATE PROCEDURE ShowAllStudents()
BEGIN
    SELECT * FROM Students;
END //
DELIMITER ;

CALL ShowAllStudents();

-- Display All Courses with Department Names --2
DELIMITER //
CREATE PROCEDURE ShowCoursesWithDepartments()
BEGIN
    SELECT c.course_id, c.course_name, d.department_name
    FROM Courses c
    JOIN Departments d ON c.department_id = d.department_id;
END //
DELIMITER ;

CALL ShowCoursesWithDepartments();

--  Display All Exam Results --3
DELIMITER //
CREATE PROCEDURE ShowAllExamResults()
BEGIN
    SELECT r.*, s.first_name, s.last_name, e.exam_date, c.course_name
    FROM ExamResults r
    JOIN Students s ON r.student_id = s.student_id
    JOIN Exams e ON r.exam_id = e.exam_id
    JOIN Courses c ON e.course_id = c.course_id;
END //
DELIMITER ;

call ShowAllExamResults();

-- Display All Enrollments -- 4
DELIMITER //
CREATE PROCEDURE ShowAllEnrollments()
BEGIN
    SELECT e.enrollment_id, s.first_name, s.last_name, c.course_name
    FROM Enrollments e
    JOIN Students s ON e.student_id = s.student_id
    JOIN Courses c ON e.course_id = c.course_id;
END //
DELIMITER ;

CALL ShowAllEnrollments();

-- Show Students with Their Departments --5
DELIMITER //
CREATE PROCEDURE ShowStudDept()
BEGIN
    SELECT s.student_id, s.first_name, s.last_name, d.department_name
    FROM Students s
    JOIN Departments d ON s.department_id = d.department_id;
END //
DELIMITER ;

call ShowStudDept();

-- Show Student Details by ID -- 6
DELIMITER //
CREATE PROCEDURE GetStudentByID(IN sid INT)
BEGIN
    SELECT * FROM Students
    WHERE student_id = sid;
END //
DELIMITER ;

CALL GetStudentByID(9);

-- Get All Students in a Specific Course -- 7
DELIMITER //
CREATE PROCEDURE GetStudentsInCourse(IN courseCode VARCHAR(20))
BEGIN
    SELECT s.student_id, s.first_name, s.last_name
    FROM Enrollments e
    JOIN Students s ON e.student_id = s.student_id
    WHERE e.course_id = course_id;
END //
DELIMITER ;

CALL GetStudentsInCourse('CS101');

-- Get Professor Details by Name --8
DELIMITER //
CREATE PROCEDURE GetProfessorByName(IN profName VARCHAR(100))
BEGIN
    SELECT * FROM Professors
    WHERE CONCAT(first_name, ' ', last_name) LIKE CONCAT('%', profName, '%');      -- it will fetch employees ( is name is alex) who has same first name 
END //
DELIMITER ;

CALL GetProfessorByName('John');
CALL GetProfessorByName('Alex');


-- Get Courses by Professor ID --9
DELIMITER //
CREATE PROCEDURE Profcourse(IN profID INT)
BEGIN
    SELECT c.course_name, c.credits, d.department_name
    FROM Courses c
    JOIN FacultyAssignments fa ON c.course_id = fa.course_id
    JOIN Departments d ON c.department_id = d.department_id
    WHERE fa.professor_id = profID;
END //
DELIMITER ;

call Profcourse(4);

-- Assign classroom to timetable
DELIMITER //
CREATE PROCEDURE AssignClassroom(
    IN cid INT,
    IN room_id INT,
    IN class_time TIME
)
BEGIN
    INSERT INTO Timetable (course_id, classroom_id, start_time)
    VALUES (cid, room_id, class_time);
END //
DELIMITER ;

Call AssignClassroom(1, 4, '09:30:00');


-- Views
-- Shows student details along with department name
CREATE VIEW StudentProfile AS
SELECT 
    s.StudentID,
    s.FirstName,
    s.LastName,
    s.Email,
    s.Phone,
    d.DepartmentName,
    s.EnrollmentDate
FROM Students s
JOIN Departments d ON s.DepartmentID = d.DepartmentID;

--
CREATE VIEW TopPerformingStudentsView AS
SELECT 
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name,
    er.obtained_marks
FROM ExamResults er
JOIN Students s ON er.student_id = s.student_id
JOIN Exams e ON er.exam_id = e.exam_id
JOIN Courses c ON e.course_id = c.course_id
WHERE er.obtained_marks > 85;

SELECT * FROM TopPerformingStudentsView
ORDER BY obtained_marks DESC;

