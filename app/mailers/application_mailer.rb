class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@rails-awesome-microblog.com'
  layout 'mailer'
end
