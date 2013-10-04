class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :password, :password_confirmation, :name, :blog_title, :about, :twitter, :github, :ga_id

  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates_uniqueness_of :email
  validates_presence_of :email

  before_create :set_username_to_email_name

  def self.info(field)
    User.last ? User.last.send(field).to_s : User.new.send(field).to_s
  end

  private

  def set_username_to_email_name
    self.username = email.gsub(/[@].*/, '')
  end
end
