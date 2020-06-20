class ApplicationController < ActionController::Base

  include Admin::GenresHelper

  include Admin::CustomersHelper

  include Admin::ProductsHelper

end
