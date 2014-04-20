json.array!(@studygroups) do |studygroup|
  json.extract! studygroup, :id, :hour, :minute, :am, :host, :daysFromNow, :streetNumber, :streetName, :city, :state, :zipcode
  json.url studygroup_url(studygroup, format: :json)
end
