class Komodo < Struct.new(:obj, :func, :args)  
  # delayed_job wrapper, creates a new monitored job and queues it
  def self.queue(obj, func, args = [])
    
    Delayed::Job.enqueue MonitoredJob.new(obj, func, args)
  end
    
  protected
  # nothing of note here
  def perform
    obj.send(func, args)
  end
  
  # adds a heroku worker, if required
  def enqueue(job)
    if Rails.env == "production" && Delayed::Job.count == 0
      heroku = Heroku::Client.new(@@config['username'], @@config['password'])
      heroku.set_workers(@@config['application_name'], 1)
    end
  end
  
  # removes heroku workers if queue is empty, or falling below max_workers
  def after(job)
    if Rails.env == "production" && Delayed::Job.count == 0
      heroku = Heroku::Client.new(@@config['username'], @@config['password'])
      heroku.set_workers(@@config['application_name'], 0)
    end
  end
  
  private
  def self.configure
    
  end
end
