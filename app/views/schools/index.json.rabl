collection @schools

attributes :id, :name, :location, :major, :enrolled_on, :left_on, :did_graduate

node :href do |school|
  school_url(school)
end
