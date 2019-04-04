# frozen_string_literal: true

puts '*** Admin user ***'
admin_user = User.find_by_email('admin@gmail.com')
if admin_user
  puts 'Admin user already created'
else
  User.create!(name: 'Admin', role: 'member', email: 'admin@gmail.com', password: '1qaz2wsx3edc*', password_confirmation: '1qaz2wsx3edc*')
  puts 'Admin user created'
end

MODELS = %w[
  setting
  proposal
  solution_proposal
  protocol
  conclusion
  solution
  certificate
  attachment
  permission
  ikcontract
  certcontract
  inventory
].freeze

# MODELS.each do |model|
#   File.open("db/seeds/#{model}.json","w") do |f|
#     f.write(JSON.pretty_generate(model.classify.constantize.last.attributes.except('id', 'created_at', 'updated_at')))
#   end
# end

MODELS.each do |model|
  object_class = model.classify.constantize
  puts "*** #{model.humanize} ***"
  next puts "#{model.humanize} already created" unless object_class.count.zero?

  object_hash = JSON.parse(File.read("db/seeds/#{model}.json"))
  object_class.create!(object_hash)
  puts "#{model.humanize} was created"
end
