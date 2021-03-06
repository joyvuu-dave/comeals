module Api
  class BillsController < ApplicationController
    def index
      if params[:start].present? && params[:end].present?
        bills = Bill.includes(:meal, { :resident => :unit }).joins(:meal).where("meals.date >= ?", params[:start]).where("meals.date <= ?", params[:end])
      else
        bills = Bill.includes(:meal, { :resident => :unit }).joins(:meal).all
      end

      render json: bills
    end
  end
end
