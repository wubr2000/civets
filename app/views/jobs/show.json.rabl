collection @job

attributes :id, :company, :location, :title, :hired_on, :left_on, :responsibilities

node :href do |job|
  job_url(job)
end
