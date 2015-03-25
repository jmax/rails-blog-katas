require "spec_helper"

describe Article do

  describe "Associations" do
    it { should have_many(:comments) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }

    describe "publication date restrictions" do
      it "allows article to be published this year" do
        subject.published_at = Time.now
        expect(subject).to have(:no).errors_on(:published_at)
      end

      it "doesn't allow article to be published on a future year" do
        subject.published_at = 1.year.from_now
        expect(subject).to have_at_least(1).errors_on(:published_at)
      end
    end
  end

  describe "Finders" do
    describe "#published" do
      it "lists published articles" do
        article_1 = create(:article)
        article_2 = create(:article, published_at: 2.days.from_now)

        expect(Article.published).to include(article_1)
        expect(Article.published).not_to include(article_2)
      end
    end

    describe "#latest" do
      it "lists newest articles first" do
        article_1 = create(:article, published_at: 2.days.ago)
        article_2 = create(:article, published_at: 1.day.ago)

        expect(Article.latest(2).first).to eql(article_2)
        expect(Article.latest(2).last).to eql(article_1)
      end
    end

    describe "#featured" do
      let!(:article_1) { create(:article, featured_at: 2.days.ago) }
      let!(:article_2) { create(:article, featured_at: 1.days.ago) }
      let!(:article_3) { create(:article) }

      it "lists only featured articles" do
        featured_articles = Article.featured(3)

        expect(featured_articles).to include(article_1)
        expect(featured_articles).to include(article_2)
        expect(featured_articles).not_to include(article_3)
      end

      it "lists newest featured articles first" do
        featured_articles = Article.featured(3)
        expect(featured_articles.first).to eql(article_2)
        expect(featured_articles.last).to eql(article_1)
      end
    end
  end

  describe "Featured support" do
    let(:featured_article) { create(:article, :featured) }

    it "knows when the article is featured" do
      expect(featured_article).to be_featured
    end

    it "knows how to mark an article as featured" do
      article = create(:article)

      expect{ article.feature! }.
        to change{ article.featured? }.from(false).to(true)
    end

    it "knows how to unmark an article as featured" do
      expect{ featured_article.unfeature! }.
        to change{ featured_article.featured? }.from(true).to(false)
    end
  end

end
