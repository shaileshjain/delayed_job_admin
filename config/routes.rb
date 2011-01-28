Rails.application.routes.draw do
  scope '/:permalink' do
    match 'delayed_job_admin' => 'delayed_job_admin#index', :as => 'delayed_job_admin'
    match 'delayed_job_admin/restart' => 'delayed_job_admin#restart', :as => 'delayed_job_admin/restart'
    match 'delayed_job_admin/check_status' => 'delayed_job_admin#check_status', :as => 'delayed_job_admin/check_status'
    match 'delayed_job_admin/delete/:id' => 'delayed_job_admin#delete', :as => 'delayed_job_admin/delete'
  end
end

