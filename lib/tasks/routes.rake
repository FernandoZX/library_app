if Rails.env.development?
  task :routes do
    puts `bin/rails routes`
  end
end