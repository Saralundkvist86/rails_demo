feature "Visitor can edit articles" do
  let(:test_article) { FactoryBot.create(:article, title: "A very bad title", content: "But the content is awesome") }
  before do
    visit article_path(test_article)
    click_on "Edit Article"
    fill_in "article[title]", with: "This is a much better title"
    click_on "Update Article"
  end

  describe "Visitor can edit an article" do
    it "and it displays an successmessage" do
      expect(page).to have_content "the article was successfully updated"
    end

    it "displays updated article" do
      expect(page).to have_content "This is a much better title"
    end
  end
end
