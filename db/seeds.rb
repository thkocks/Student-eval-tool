# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ first_name: 'Star Wars' }, { first_name: 'Lord of the Rings' }])
#   Character.create(first_name: 'Luke', movie: movies.first)

User.destroy_all
Student.destroy_all
Batch.destroy_all

teacher1 = User.create(email: "teacher1@eval.com", password:"qwer1234")
teacher2 = User.create(email: "teacher2@eval.com", password:"qwer1234")
teacher3 = User.create(email: "teacher3@eval.com", password:"qwer1234")

batch1 = Batch.create(number: 1, start_date: '2017-05-15 00:00:00', end_date: '2017-07-07 00:00:00')
batch2 = Batch.create(number: 2, start_date: '2017-06-26 00:00:00', end_date: '2017-08-31 00:00:00')

student1 = Student.create(first_name: "Dave", last_name: " Fletcher", photo: "https://goo.gl/rN13io", batch: batch1)
student2 = Student.create(first_name: "Miriam", last_name: " Donovan", photo: "https://goo.gl/rN13io", batch: batch1)
student3 = Student.create(first_name: "Anna", last_name: " Erkisson", photo: "https://goo.gl/rN13io", batch: batch1)
student4 = Student.create(first_name: "Steve", last_name: " Bushemi", photo: "https://goo.gl/rN13io", batch: batch2)
student5 = Student.create(first_name: "Markus", last_name: " Judeski", photo: "https://goo.gl/rN13io", batch: batch2)
student6 = Student.create(first_name: "Wendy", last_name: " Mussel", photo: "https://goo.gl/rN13io", batch: batch2)
