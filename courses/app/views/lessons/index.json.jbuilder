json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :title, :course_id, :description, :level_id, :contenturl
  json.url lesson_url(lesson, format: :json)
end
