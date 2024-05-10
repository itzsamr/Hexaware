# Task 3: Implement Methods

from datetime import datetime


class Student:
    def __init__(
        self, student_id, first_name, last_name, date_of_birth, email, phone_number
    ):
        self.student_id = student_id
        self.first_name = first_name
        self.last_name = last_name
        self.date_of_birth = date_of_birth
        self.email = email
        self.phone_number = phone_number
        self.enrolled_courses = []
        self.payment_history = []

    def enroll_in_course(self, course):
        self.enrolled_courses.append(course)

    def update_student_info(
        self, first_name, last_name, date_of_birth, email, phone_number
    ):
        self.first_name = first_name
        self.last_name = last_name
        self.date_of_birth = date_of_birth
        self.email = email
        self.phone_number = phone_number

    def make_payment(self, amount, payment_date):
        self.payment_history.append((amount, payment_date))

    def display_student_info(self):
        print(f"Student ID: {self.student_id}")
        print(f"Name: {self.first_name} {self.last_name}")
        print(f"Date of Birth: {self.date_of_birth}")
        print(f"Email: {self.email}")
        print(f"Phone Number: {self.phone_number}")

    def get_enrolled_courses(self):
        return self.enrolled_courses

    def get_payment_history(self):
        return self.payment_history


class Course:
    def __init__(self, course_id, course_name, course_code, instructor_name):
        self.course_id = course_id
        self.course_name = course_name
        self.course_code = course_code
        self.instructor_name = instructor_name
        self.enrollments = []

    def assign_teacher(self, teacher):
        self.instructor_name = teacher

    def update_course_info(self, course_code, course_name, instructor):
        self.course_code = course_code
        self.course_name = course_name
        self.instructor_name = instructor

    def display_course_info(self):
        print(f"Course ID: {self.course_id}")
        print(f"Course Name: {self.course_name}")
        print(f"Course Code: {self.course_code}")
        print(f"Instructor: {self.instructor_name}")

    def get_enrollments(self):
        return self.enrollments

    def get_teacher(self):
        return self.instructor_name


class Enrollment:
    def __init__(self, enrollment_id, student_id, course_id, enrollment_date):
        self.enrollment_id = enrollment_id
        self.student_id = student_id
        self.course_id = course_id
        self.enrollment_date = enrollment_date

    def get_student(self):
        return self.student_id

    def get_course(self):
        return self.course_id


class Teacher:
    def __init__(self, teacher_id, first_name, last_name, email):
        self.teacher_id = teacher_id
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.assigned_courses = []

    def update_teacher_info(self, name, email, expertise):
        self.first_name, self.last_name = name.split()
        self.email = email

    def display_teacher_info(self):
        print(f"Teacher ID: {self.teacher_id}")
        print(f"Name: {self.first_name} {self.last_name}")
        print(f"Email: {self.email}")

    def get_assigned_courses(self):
        return self.assigned_courses


class Payment:
    def __init__(self, payment_id, student_id, amount, payment_date):
        self.payment_id = payment_id
        self.student_id = student_id
        self.amount = amount
        self.payment_date = payment_date

    def get_student(self):
        return self.student_id

    def get_payment_amount(self):
        return self.amount

    def get_payment_date(self):
        return self.payment_date


class SIS:
    def __init__(self):
        self.enrollments = []
        self.teachers = []
        self.payments = []

    def enroll_student_in_course(self, student, course):
        enrollment_id = len(self.enrollments) + 1
        enrollment = Enrollment(enrollment_id, student, course, datetime.now())
        self.enrollments.append(enrollment)
        student.enroll_in_course(course)
        course.enrollments.append(enrollment)

    def assign_teacher_to_course(self, teacher, course):
        course.assign_teacher(teacher)
        teacher.assigned_courses.append(course)

    def record_payment(self, student, amount, payment_date):
        payment_id = len(self.payments) + 1
        payment = Payment(payment_id, student.student_id, amount, payment_date)
        self.payments.append(payment)
        student.make_payment(amount, payment_date)

    def generate_enrollment_report(self, course):
        print(f"Enrollment Report for Course: {course.course_name}")
        for enrollment in course.enrollments:
            student = enrollment.get_student()
            print(
                f"Student ID: {student.student_id}, Name: {student.first_name} {student.last_name}"
            )

    def generate_payment_report(self, student):
        print(f"Payment Report for Student: {student.first_name} {student.last_name}")
        for payment in student.payment_history:
            print(
                f"Payment ID: {payment.payment_id}, Amount: {payment.amount}, Date: {payment.payment_date}"
            )

    def calculate_course_statistics(self, course):
        total_enrollments = len(course.enrollments)
        total_payments = sum(
            payment.amount
            for payment in self.payments
            if payment.student_id
            in [enrollment.student.student_id for enrollment in course.enrollments]
        )
        print(f"Statistics for Course: {course.course_name}")
        print(f"Total Enrollments: {total_enrollments}")
        print(f"Total Payments: {total_payments}")
