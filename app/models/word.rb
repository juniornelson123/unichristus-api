class Word < ApplicationRecord
  enum kind: {word: 0, problems: 1, brainstorm: 2, solutions: 3, diagnostics: 4}

  belongs_to :study_case
  belongs_to :user
end
