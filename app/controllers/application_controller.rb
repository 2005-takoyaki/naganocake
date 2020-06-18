class ApplicationController < ActionController::Base

  include Admin::AdminHelper
	include Admin::GenresHelper
  include Admin::CustomersHelper

end
