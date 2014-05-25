json.array!(@studygroups) do |studygroup|
  json.extract! studygroup, :id, :when, :where, :websiteLink, :duration
  json.url studygroup_url(studygroup, format: :json)
end
