require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:time) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to have_many(:notifees).dependent(:destroy) }
  end

  describe 'factories' do
    let(:event) { create(:event) }

    it { expect { event }.to change(described_class, :count).by(1) }
  end
end
