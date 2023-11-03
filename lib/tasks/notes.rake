namespace :notes do
  desc "Delete records older than 30 days"
  task delete_30_days_old: :environment do
    Note.where(['deleted_at < ?', 1.minutes.ago]).destroy_all
  end
end
