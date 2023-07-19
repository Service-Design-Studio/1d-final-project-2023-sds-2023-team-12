include Warden::Test::Helpers
require "rake"

module CapybaraHelper
  PAGE_MAP = {
    # General
    "Home": "/",
    "Show All Posts": "/posts",
    "Log In": "/users/sign_in",
    "Report Case": "/admin",
  }

  POST_FORM_FIELD={"Full name" => "David", "Age" => "34", "Location" => "Changi", "Description" => "Wearing a red T shirt", "Special note" => "elderly", "Missing time" => "Sat, 17 Jun 2023 21:33:00 +0000"}

  BUTTON_MAP = {
    "Home": "home-button",
    "More details...": "more-detail-button",
    "Log in": "login-button",
    "Sign Out": "sign-out-button",
    "Create Post": "create-post-button",
    "Create Comment": "create-comment-button",
    "Delete": "delete-comment-button",
    "Edit": "edit-comment-button",
    "Cancel": "cancel-button",
  }

  FORM_BUTTON_MAP = {
    "Upload": "upload-button",
    "Save": "save-button",
    "Add new Tag": "add-new-tag-button",
    "Add Category": "add-category-button",
  }


  def capybara_get_article_idx(article_name)
    CapybaraHelper::ARTICLES_ARRAY.index(article_name) + 1
  end

  def capybara_get_tag_idx(tag_name)
    CapybaraHelper::TAG_ARRAY.index(tag_name) + 1
  end

  def capybara_upload_zip(zip_name)
    if zip_name != ""
      Zip::File.open(Rails.root + "app/assets/test_zip/#{zip_name}") do |zip_file|
        zip_file.each do |entry|
          if entry.file? && entry.name.end_with?(".pdf")
            new_upload = Upload.new
            content = ExtractPdf.get_pdf_text(entry)
            new_upload.file.attach(io: StringIO.new(entry.get_input_stream.read), filename: entry.name)
            summariser_response = Summariser.request(content)
            summary = summariser_response[:summary]
            new_upload.content = content
            new_upload.summary = summary
            new_upload.ml_status = "Complete"
            new_upload.save
          end
        end
      end
    end
  end

  def capybara_set_categories(category_bank)
    Category.destroy_all
    category_bank.each do |category_name|
      Category.create(name: category_name)
    end
  end

  def capybara_delete_categories(category_bank)
    category_bank.each do |category_name|
      Category.find_by(name: category_name).destroy
    end
  end

  def capybara_remove_all_categories
    Category.destroy_all
  end

  def capybara_add_categories(category_bank)
    category_bank.each do |category_name|
      category = Category.find_by(name: category_name)
      if category.nil?
        Category.create(name: category_name)
      end
    end
  end

  def capybara_login(email, password)
    User.destroy_all
    user = User.create(email: email, password: password, password_confirmation: password)
    login_as(user, :scope => :user)
  end

  def capybara_logout
    logout
  end

  def setup_db
    Rails.application.load_tasks
    Rake::Task['db:reset'].invoke
  end
end
World(CapybaraHelper)