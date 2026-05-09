Rack::Attack.throttle("contact_form/ip", limit: 5, period: 60) do |req|
  req.ip if req.post? && req.path.end_with?("/contact")
end
