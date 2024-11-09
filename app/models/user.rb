class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :assignments, :dependent => :destroy
  has_many :shifts, through: :shift_assignments
  has_many :time_logs



  after_create :assign_default_role

  private

  def assign_default_role
    self.add_role(:worker) if self.roles.blank?
  end

end
