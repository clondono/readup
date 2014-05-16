json.array!(@summaries) do |summary|
  json.extract! summary, 
  json.url summary_url(summary, format: :json)
end
