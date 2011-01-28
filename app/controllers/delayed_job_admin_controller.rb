class DelayedJobAdminController < ApplicationController

  layout 'delayed_job_admin'

  def index
    unless current_user.is_admin
      render :nil => true
    else
      p @status = params[:current_status]
    end
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
