json.array!(@studygroups) do |studygroup|
  json.extract! studygroup, :id, :name, :description, :location, :time
  json.url studygroup_url(studygroup, format: :json)
end
