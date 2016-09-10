require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :content }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
    it { should have_many :comments}
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(FactoryGirl.create(:article)).to be_valid
    end
  end

  describe 'Sad path' do

    before do
      FactoryGirl.create(:article, title: "Title One")
      FactoryGirl.create(:article, title: "Title Two")
      FactoryGirl.create(:comment, article_id: Article.find_by(title: "Title One").id)
    end
    it 'should have no comments if article is destroyed' do
      expect(Comment.all).not_to eq []
      Article.destroy(Article.find_by(title: "Title One").id)
      expect(Comment.all).to eq []
    end
  end
end
