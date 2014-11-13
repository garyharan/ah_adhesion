class ReportsController < ApplicationController
  layout "widget"

  before_action :find_answer
  after_action :allow_iframe

  def new
    @report ||= Report.new
  end

  def create
    @report = Report.new report_params

    if @report.save
      render 'thank_you'
    else
      render 'new'
    end
  end

  def thank_you
  end

  private

  def find_answer
    @answer = Answer.find params[:answer_id]
  end

  def report_params
    params.require(:report).permit(:name, :email, :body, :answer_id)
  end
end
