class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  belongs_to :cookcategory
  before_save :assign_role

  has_many :comments, dependent: :destroy

  validates_presence_of(:username)
  mount_uploader :picture, ProfilepicUploader

  ratyrate_rater

  def assign_role
    self.role = Role.find_by_name("Member") if self.role.nil?
  end

  def admin?
    self.role.name == "Admin" if !self.role.blank?
  end
  def member?
    self.role.name == "Member" if !self.role.blank?
  end
end