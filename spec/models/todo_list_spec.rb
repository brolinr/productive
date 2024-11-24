require 'rails_helper'

RSpec.describe TodoList, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
    it { is_expected.to have_many(:task_groups).dependent(:destroy) }
  end

  describe 'factories' do
    let(:todo_list) { create(:todo_list) }

    it { expect { todo_list }.to change(described_class, :count).by(1) }
  end
end
