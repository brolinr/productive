15.times do
  FactoryBot.create(:user, password: 'password', password_confirmation: 'password')
end

user = FactoryBot.create(:user, email: 'test@test.com', password: 'password', password_confirmation: 'password')
4.times do
  project = FactoryBot.create(:project, user: user)

  message_board = FactoryBot.create(:message_board, project: project)

  puts('Project users feature start')
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


  puts('Project users feature end')


  puts('Message board feature start')
  15.times do
    FactoryBot.create(:message, room: message_board, sender: project.project_users.order('RANDOM()').first)
  end

  puts('Message board feature end')


  puts('Chats feature start')
  project_users = project.project_users.accepted.to_a

  project_users.each do |project_user|
    project_users.each do |second_user|
      next if project_user == second_user
      chat = FactoryBot.create(:chat, project: project)
      first_chat_member = ChatMember.create chat: chat, project_user: project_user
      second_chat_memer = ChatMember.create chat: chat, project_user: second_user

      FactoryBot.create(:message, room: chat, sender: first_chat_member)
      FactoryBot.create(:message, room: chat, sender: first_chat_member)
      FactoryBot.create(:message, room: chat, sender: second_chat_memer)
    end
  end

  puts('Chat feature end')


  puts('Todo list feature start')
  14.times do
    todo_list = FactoryBot.create(:todo_list, project: project)

    rand(5).times do
      group = FactoryBot.create(:task_group, todo_list: todo_list)
      rand(6).times do
        FactoryBot.create(:task, list: todo_list, group: group, assignee: project.project_users.accepted.order('RANDOM()').first)
      end
    end

    4.times do
      FactoryBot.create(:task, list: todo_list, assignee: project.project_users.accepted.order('RANDOM()').first)
    end
  end

  puts('Todo list feature end')

  puts('Events feature start')

  40.times { FactoryBot.create(:event, project: project) }

  project.events.each do |event|
    project.project_users.order('RANDOM()').limit(4).each do |project_user|
      event.notifees.create!(project_user: project_user, notifyable: event)
    end
  end

  puts('Events feature end')
end
