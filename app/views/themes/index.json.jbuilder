json.array!(@themes) do |theme|
  json.extract! theme, :id, :name, :father
  json.url theme_url(theme, format: :json)
end
