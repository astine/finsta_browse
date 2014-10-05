class WelcomeController < ApplicationController

  def index
    @companies = Company.all()
  end

  def view_company
    @company = Company.find(params[:id])
  end

  def view_company_information
    @company = Company.find(params[:id])

  end

end
