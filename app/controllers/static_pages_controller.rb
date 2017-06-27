class StaticPagesController < ApplicationController
  def home
    @current_user = current_user
  end
end
