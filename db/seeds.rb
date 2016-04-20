# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Initial Data for Role
@admin = Role.create(name: "Admin")
Role.create(name: "Member")
# Admin User
User.create(username:"test", email: "test@ait.asia", password: "testtest",
            password_confirmation: "testtest", role_id: @admin.id)