class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: ENV["ADMIN_PASSWORD"]

  def show

  end
end
