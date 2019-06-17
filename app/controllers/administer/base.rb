class Administer::Base < ApplicationController
  before_action :authenticate_user!
  before_action :administer_user

  layout 'administer'
end