collection @ref

attributes :id, :name, :title, :email, :phone, :relationship

node :href do |ref|
  ref_url(ref)
end
