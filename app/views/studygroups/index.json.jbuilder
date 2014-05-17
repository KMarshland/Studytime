json.array!(@studygroups) do |studygroup|
  json.extract! studygroup, :id, :when, :where, :daysFromNow, :websiteLink
  json.url studygroup_url(studygroup, format: :json)
end
