json.words @words do |word|
  json.id word.id
  json.name word.name
  json.kind word.kind
  json.study_case word.study_case_id
  json.user word.user_id
  json.created_at word.created_at
  json.updated_at word.updated_at
end

json.problems @problems do |problem|
  json.id problem.id
  json.name problem.name
  json.kind problem.kind
  json.study_case problem.study_case_id
  json.user problem.user_id
  json.created_at problem.created_at
  json.updated_at problem.updated_at
end


json.problems @problems do |problem|
  json.id problem.id
  json.name problem.name
  json.kind problem.kind
  json.study_case problem.study_case_id
  json.user problem.user_id
  json.created_at problem.created_at
  json.updated_at problem.updated_at
end

json.braistorms @braistorms do |braistorm|
  json.id braistorm.id
  json.name braistorm.name
  json.kind braistorm.kind
  json.study_case braistorm.study_case_id
  json.user braistorm.user_id
  json.created_at braistorm.created_at
  json.updated_at braistorm.updated_at
end
json.solutions @solutions do |solution|
  json.id solution.id
  json.name solution.name
  json.kind solution.kind
  json.study_case solution.study_case_id
  json.user solution.user_id
  json.created_at solution.created_at
  json.updated_at solution.updated_at
end
json.diagnostics @diagnostics do |diagnostic|
  json.id diagnostic.id
  json.name diagnostic.name
  json.kind diagnostic.kind
  json.study_case diagnostic.study_case_id
  json.user diagnostic.user_id
  json.created_at diagnostic.created_at
  json.updated_at diagnostic.updated_at
end

json.knows @knows do |know|
  json.id know.id
  json.name know.name
  json.kind know.kind
  json.study_case know.study_case_id
  json.user know.user_id
  json.created_at know.created_at
  json.updated_at know.updated_at
end

json.knowledges @knowledges do |knowledge|
  json.id knowledge.id
  json.name knowledge.name
  json.kind knowledge.kind
  json.study_case knowledge.study_case_id
  json.user knowledge.user_id
  json.created_at knowledge.created_at
  json.updated_at knowledge.updated_at
end