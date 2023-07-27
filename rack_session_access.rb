# Add the `RackSessionAccess::Middleware` to this Rails application's middleware stack
# Only in the test environment.
#if Rails.env.test?
  #Rails.application.config.middleware.use RackSessionAccess::Middleware
#end