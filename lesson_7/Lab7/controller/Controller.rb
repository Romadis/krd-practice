class ApplicationController < ActionController::Base
end


class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
    @grades = @report.grades
  end

  def create 
    @report = Report.new(report_params)
    if @report.save
      redirect_to @report
    else
      render :new
    end
  end
  
  private

  def report_params
    params.require(:report).permit(:title, :content)
  end
end


class GradesController < ApplicationController
  def create
    @report = Report.find(params[:report_id])
    @grade = @report.grades.create(grade_params)
    redirect_to report_path(@report)
  end

  private

  def grade_params
    params.require(:grade).permit(:score)
  end
end
