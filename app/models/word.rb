class Word < ApplicationRecord
  paginates_per 10
  
  enum kind: {word: 0, problems: 1, brainstorm: 2, solutions: 3, diagnostics: 4}

  belongs_to :study_case
  belongs_to :user
end
