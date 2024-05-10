# Task 1: Define Classes
# Task 2: Implement Constructors
# Task 3: Implement Methods

from datetime import datetime
from entity import Student, Course, Enrollment, Teacher, Payment


class SIS:
    def __init__(self):
        self.enrollments = []
        self.teachers = []
        self.payments = []

    def enroll_student_in_course(self, student, course):
        enrollment_id = len(self.enrollments) + 1
        enrollment = Enrollment(
            enrollment_id, student.student_id, course.course_id, datetime.now()
        )
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
            student = self.get_student_by_id(enrollment.student_id)
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
            in [enrollment.student_id for enrollment in course.enrollments]
        )
        print(f"Statistics for Course: {course.course_name}")
        print(f"Total Enrollments: {total_enrollments}")
        print(f"Total Payments: {total_payments}")

    def get_student_by_id(self, student_id):
        # Implement method to retrieve student by ID
        pass

    def get_teacher_by_id(self, teacher_id):
        # Implement method to retrieve teacher by ID
        pass


# Example usage:
sis = SIS()
student1 = Student(
    1, "John", "Doe", "1990-01-01", "john.doe@example.com", "123-456-7890"
)
course1 = Course(101, "Introduction to Python", "PY101", "Dr. Smith")
teacher1 = Teacher(1, "Dr.", "Smith", "smith@example.com")

sis.enroll_student_in_course(student1, course1)
sis.assign_teacher_to_course(teacher1, course1)
sis.record_payment(student1, 500.00, datetime.now())
sis.generate_enrollment_report(course1)
sis.generate_payment_report(student1)
sis.calculate_course_statistics(course1)
