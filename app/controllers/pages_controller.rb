class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @cars = Car.all.order('RANDOM()').limit(6)
  end
end
