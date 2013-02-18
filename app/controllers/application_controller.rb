class ApplicationController < ActionController::Base

  before_filter :basic_auth if Rails.env.staging?
  include SocNetworkHelper

end

