15.times do
  FactoryBot.create(:user, password: 'password', password_confirmation: 'password')
end

user = FactoryBot.create(:user, email: 'test@test.com', password: 'password', password_confirmation: 'password')
4.times do
  project = FactoryBot.create(:project, user: user)
  message_board = FactoryBot.create(:message_board, project: project)

  FactoryBot.create(:project_user, project: project, user: user, invite_status: 'accepted')

  rejected = User.where(id: [ 14, 15 ])
  pending= User.where(id: [ 12, 13 ])
  accepted = User.limit(10)

  rejected.each do |user|
    FactoryBot.create(:project_user, project: project, user: user, invite_status: 'rejected')
  end

  pending.each do |user|
    FactoryBot.create(:project_user, project: project, user: user, invite_status: 'pending')
  end

  accepted.each do |user|
    FactoryBot.create(:project_user, project: project, user: user, invite_status: 'accepted')
  end

  15.times do
    FactoryBot.create(:message, room: message_board, sender: project.project_users.order('RANDOM()').first)
  end
end
