desc 'First Whenever rake task'
task first_sample_task: :environment do
  Rails.logger.info "First Sample Task"
end
