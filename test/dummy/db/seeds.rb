Delayed::Job.enqueue PutsJob.new("foo")
Delayed::Job.enqueue FailJob.new("bar")
Delayed::Job.enqueue PutsJob.new("baz")
puts "Queued up some jobs"