class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name,
    :last_name,
    :email,
    :password,
    :password_confirmation,
    :remember_me,
    :road,
    :apt_number,
    :city,
    :province,
    :postal_code,
    :gender,
    :dob,
    :license_number,
    :possession_limit,
    :license_expiry,
    :license

  validates_presence_of :first_name, :last_name, :email, :road, :city, :province, :postal_code, :gender, :dob, :license_number, :possession_limit, :license_expiry
  validates_uniqueness_of :email, :case_sensative => false

  belongs_to :role

  has_one :cart

  ### License Scan Attachment related stuff
  has_attached_file :license, styles: { medium: "400x400" }

  validates_attachment_content_type :license, content_type: /image.*/
  validates_attachment_size :license, less_than: 2.megabyte

  after_initialize :init

  public

  def authorize!
    self.role = Role.authorized
    save!
  end

  def authorize_and_notify!
    authorize!
    RoleMailer.authorized(self).deliver
  end

  def unauthorize!
    self.role = Role.unauthorized
    save!
  end

  def make_admin!
    self.role = Role.admin
    save!
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
