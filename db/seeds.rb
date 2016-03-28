if Teacher.count.zero?
  Teacher.create email: 'azeroths@gmail.com', password: Devise.friendly_token[0,20]
end
