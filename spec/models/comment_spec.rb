require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @factory_article = FactoryGirl.create(:article)
  end

  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :email }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_presence_of :article_id }
    it { should belong_to :article}
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(FactoryGirl.create(:comment, article_id: @factory_article.id)).to be_valid
    end

    it 'should have a valid Factory with an email' do
      expect(FactoryGirl.create(:comment, article_id: @factory_article.id, email: 'jenny@random.com')).to be_valid
    end
  end

  describe 'Email validation' do
    it 'should reject emails with no @ sign' do
      expect(FactoryGirl.create(:comment, article_id: @factory_article.id, email: 'jennyrandom.com')).not_to be_valid
    end
  end
end
