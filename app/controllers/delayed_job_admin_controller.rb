class DelayedJobAdminController < ApplicationController

  # Delegate authetication to app controller
  before_filter :delayed_job_admin_authentication

  layout 'delayed_job_admin'

  def index

    @status = if params[:current_status].to_s.include?("delayed_job: running")
      params[:current_status].to_s.sub("delayed_job", "Status")
    elsif params[:current_status].to_s.include?("no")
      "Status: Off"
    else
      'Not implemented'
    end

    @jobs = Delayed::Job.page(params[:page]).order("run_at desc")
  end

  def restart
    delayed_job_admin_restart
    redirect_to :action => 'index', :current_status => @status
  end

  def check_status
    delayed_job_admin_check_status
    redirect_to :action => 'index', :current_status => @status
  end

  def delete
    if job = Delayed::Job.find(params[:id])
      job.attempts = 10
      job.save
    end
    redirect_to :action => 'index'
  end

end
