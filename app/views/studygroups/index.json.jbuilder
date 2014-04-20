json.array!(@studygroups) do |studygroup|
  json.extract! studygroup, :id, :host, :streetNumber, :streetName, :city, :state, :zipcode, :when
  json.url studygroup_url(studygroup, format: :json)
end
