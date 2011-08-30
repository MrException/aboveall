class Role < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :users

  class << self
    def unauthorized
      where(:name => 'unauthorized').first
    end

    def authorized
      where(:name => 'authorized').first
    end

    def admin
      where(:name => 'admin').first
    end
  end
end
