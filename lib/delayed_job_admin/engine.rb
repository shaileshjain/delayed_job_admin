module DelayedJobAdmin
  class Engine < Rails::Engine
  end
  
  def self.jquery_url
    @jquery_url ||= "https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"
  end
  
  def self.jquery_url=(url)
    @jquery_url = url
  end
  
  def self.layout
    @layout ||= "delayed_job_admin"
  end
  
  def self.layout=(layout)
    @layout = layout
  end
  
  class << self
    attr_accessor :header, :footer, :time_zone
  end
  
end
