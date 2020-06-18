class ApplicationController < ActionController::Base

	include Admin::GenresHelper

  include Admin::CustomersHelper

end
