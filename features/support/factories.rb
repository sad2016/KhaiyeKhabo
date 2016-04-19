FactoryGirl.define do

  factory :member, class: User do
    role_id 2
    email "nabilkarim@ait.asia"
    password "password"
    password_confirmation "password"
    username "ntk"
  end

  factory :admin, class: User do
    role_id 1
    email "sniper@ait.asia"
    password "password"
    password_confirmation "password"
    username "snape"
  end

  factory :memberone, class: User do
    role_id 2
    username "nandini"
    email "nandu@kyy.com"
    password "nandukyy"
    password_confirmation "nandukyy"
    picture "http://www.quemasibero.com/wp-content/uploads/2015/07/msuica-3.jpg"
    fullname "Nandini Murthy"
    #datebirth "11/05/1995"
    occupation "Student"
    otherinterest "Music"
    favcookbook "The Hungry Student Cook Book"
    location "India"
  end

  factory :membertwo, class: User do
    role_id 2
    username "manik"
    email "manik@kyy.com"
    password "manikkyy"
    password_confirmation "manikkyy"
    picture "http://www.quemasibero.com/wp-content/uploads/2015/07/msuica-3.jpg"
    fullname "Manik Malhotra"
    #datebirth "11/05/1995"
    occupation "Student"
    otherinterest "Music"
    favcookbook "The Hungry Student Cook Book"
    location "India"
  end

  factory :roleone, class: Role do
    id 1
    name "Admin"
  end

  factory :roletwo, class: Role do
    id 2
    name "Member"
  end

  factory :cuisine, class: Cuisine do
    id 4
    name "Indian"
  end
  factory :recipe, class: Recipe do
    title "Pani Puri"
  end




end