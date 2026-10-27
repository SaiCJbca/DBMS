from flask import Flask, render_template, request, redirect
import mysql.connector

app = Flask(__name__)

def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",
        database="student_db"
    )

@app.route("/")
def index():
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM students")
    students = cursor.fetchall()

    cursor.close()
    db.close()

    return render_template("index.html", students=students)


@app.route("/add", methods=["GET", "POST"])
def add_student():
    if request.method == "POST":
        name = request.form["name"]
        email = request.form["email"]
        course = request.form["course"]
        semester = request.form["semester"]

        db = get_db_connection()
        cursor = db.cursor()

        cursor.execute(
            "INSERT INTO students (name, email, course, semester) VALUES (%s, %s, %s, %s)",
            (name, email, course, semester)
        )

        db.commit()
        cursor.close()
        db.close()

        return redirect("/")

    return render_template("add.html")


@app.route("/edit/<int:id>", methods=["GET", "POST"])
def edit_student(id):
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)

    if request.method == "POST":
        name = request.form["name"]
        email = request.form["email"]
        course = request.form["course"]
        semester = request.form["semester"]

        cursor.execute(
            """UPDATE students
               SET name=%s, email=%s, course=%s, semester=%s
               WHERE student_id=%s""",
            (name, email, course, semester, id)
        )

        db.commit()
        cursor.close()
        db.close()

        return redirect("/")

    cursor.execute("SELECT * FROM students WHERE student_id=%s", (id,))
    student = cursor.fetchone()

    cursor.close()
    db.close()

    return render_template("edit.html", student=student)


@app.route("/delete/<int:id>")
def delete_student(id):
    db = get_db_connection()
    cursor = db.cursor()

    cursor.execute("DELETE FROM students WHERE student_id=%s", (id,))

    db.commit()
    cursor.close()
    db.close()

    return redirect("/")


if __name__ == "__main__":
    app.run(debug=True)