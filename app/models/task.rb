class Task < ApplicationRecord
  belongs_to :todo_list, inverse_of: :tasks

  validates :description, presence: true
  validates :todo_list, presence: true

  EMAIL_COLORS_HEX = { red: '#ff0000', blue: '#0000ff', yellow: '#ffff00', green: '#00cc00', orange: '#ff9933' }
  EMAIL_CONGRATZ_MSG = { pt: 'parabéns', en: 'congratulations', es: 'felicitaciones',
                         de: 'herzliche glückwünsche', it: 'complimenti' }

  enum email_color: { red: 0, blue: 1, yellow: 2, green: 3, orange: 4 }
  enum email_congratulations: { pt: 0, en: 1, es: 2, de: 3, it: 4 }

  delegate :user, to: :todo_list

  def color_in_hex
    EMAIL_COLORS_HEX[email_color.to_sym]
  end

  def congratulations_message
    EMAIL_CONGRATZ_MSG[email_congratulations.to_sym]
  end
end
