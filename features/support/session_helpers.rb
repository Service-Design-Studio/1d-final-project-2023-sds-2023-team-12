# Helper method to set the user session for Rack::Session::Access
# Yixuan

module SessionHelper
    def set_session(key, value)
      page.set_rack_session(key => value)
    end
  
    def get_session(key)
      page.get_rack_session[key]
    end
  end
  
  World(SessionHelper)
  



