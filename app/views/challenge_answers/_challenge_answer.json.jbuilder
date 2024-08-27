json.extract! challenge_answer, :id, :user_id, :challenge_id, :submitted_code, :created_at, :updated_at
json.url challenge_answer_url(challenge_answer, format: :json)
