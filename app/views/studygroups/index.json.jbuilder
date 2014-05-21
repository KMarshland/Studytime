json.array!(@studygroups) do |studygroup|
  json.extract! studygroup, :id, :when, :where, :daysFromNow, :duration, :websiteLink
  json.url studygroup_url(studygroup, format: :json)
end
