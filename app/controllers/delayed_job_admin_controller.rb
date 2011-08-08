class DelayedJobAdminController < ApplicationController

  layout 'delayed_job_admin'

  def index
    @status = if params[:current_status].to_s.include?("delayed_job: running")
      params[:current_status].to_s.sub("delayed_job", "Status")
    elsif params[:current_status].to_s.include?("no")
      "Status: Off"
    end
    
    @jobs = Delayed::Job.page(params[:page])
  end

  def restart
    %x[script/delayed_job restart]
    @status = %x[script/delayed_job status]
    redirect_to :action => 'index', :current_status => @status
  end

  def check_status
    @status = %x[script/delayed_job status]
    redirect_to :action => 'index', :current_status => @status
  end

  def delete
    if job = Delayed::Job.find(params[:id])
      job.delete
    end
    redirect_to :action => 'index'
  end

end
