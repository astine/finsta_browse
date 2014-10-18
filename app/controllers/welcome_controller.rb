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

  def list_unread_reports
    @reports = Report.where(read:0)
  end

  def view_report
    @reports = Report.find(params[:id])
  end

  def mark_as_read
    @reports = Report.find(params[:id])
    @reports.read = 1
    @reports.save
    redirect_to :action => "view_report", :id => @reports.id

  end



end
