require 'rails_helper'

RSpec.describe TaskGroup, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:todo_list) }
    it { is_expected.to have_many(:tasks).dependent(:nullify) }
  end

  describe 'factories' do
    let(:task_group) { create(:task_group) }

    it { expect { task_group }.to change(described_class, :count).by(1) }
  end
end
