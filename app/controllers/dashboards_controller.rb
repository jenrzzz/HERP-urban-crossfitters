class DashboardsController < ApplicationController
  def show
    @title = 'Dashboard'
    render 'show'
  end
end
