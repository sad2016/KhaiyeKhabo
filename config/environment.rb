# Load the Rails application.
require File.expand_path('../application', __FILE__)


ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings ={
    :address              => "mail.cs.ait.ac.th",
    :domain               => "cs.ait.ac.th",
    :port                 => 25,
    :user_name            => "st117739",
    :password             => '',
    :authentication       => 'plain',
    :enable_starttls_auto => true
}
# Initialize the Rails application.
Rails.application.initialize!
