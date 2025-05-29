namespace :slurp do
  desc "TODO"
  task user: :environment do
    require "csv"
    #wipe old users

    User.destroy_all
    puts "Users after destroy_all: #{User.count}"

    csv_text = File.read(Rails.root.join("lib", "csvs", "fake_users.csv"))
csv = CSV.parse(csv_text, headers: true, encoding: "ISO-8859-1")
    puts "Found #{csv.size} rows in the CSV"
    csv.each do |row|
      user = User.new
      user.email = row["email"]
      user.encrypted_password = row["encrypted_password"]
      user.reset_password_token = row["reset_password_token"]
      user.reset_password_sent_at = row["reset_password_sent_at"]
      user.remember_created_at = row["remember_created_at"]
      user.upload_image = row["upload_image"]
      user.bio = row["bio"]
      user.username = row["username"]
      # if you really need to preserve your CSV’s timestamps, you can uncomment:
      # user.created_at            = row["created_at"]
      # user.updated_at            = row["updated_at"]
      # ← here we bypass Devise/AR validations

      puts "There are now #{User.count} users in the database"

      # Added this row to get it to upload - needed to surpass some of the devise restrictions
      user.save(validate: false)
    end
  end
end

namespace :slurp do
  desc "Load recommendations from fake_recommendations.csv"
  task recommendations: :environment do
    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "fake_recommendations.csv"))
    csv = CSV.parse(csv_text, headers: true, encoding: "ISO-8859-1")


    csv.each do |row|
      r = Recommendation.new
      r.description = row.fetch("description")
      r.name = row.fetch("name")
      r.category_id = row.fetch("category_id")
      r.user_id = row.fetch("user_id")
      # If your CSV also includes timestamps and you want to preserve them:
      r.created_at = row.fetch("created_at")
      r.updated_at = row.fetch("updated_at")
      r.save
      puts "Recommendation '#{r.name}' saved"
    end

    puts "There are now #{Recommendation.count} rows in the recommendations table"
  end
end
