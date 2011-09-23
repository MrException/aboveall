class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :role_id

  validates_presence_of :first_name, :last_name, :email, :role_id
  validates_uniqueness_of :email, :case_sensative => false

  belongs_to :role, :readonly => true

  has_one :cart

  after_initialize :init

  public

  def authorize!
    self.role = Role.authorized
  end

  def unauthorize!
    self.role = Role.unauthorized
  end

  def make_admin!
    self.role = Role.admin
  end

  def admin?
    # not sure if this is the proper way?
    # self.role == Role.admin
    # I think just testing name equality is faster
    self.role.name == "admin"
  end

  def unauthorized?
    self.role.name == "unauthorized"
  end

  def authorized?
    self.role.name == "authorized"
  end

  def full_name
    "#{last_name}, #{first_name}"
  end

  private

  def init
    self.role ||= Role.unauthorized
    self.cart ||= Cart.new
  end
end
