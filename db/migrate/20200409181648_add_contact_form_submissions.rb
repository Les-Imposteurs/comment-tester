class AddContactFormSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_form_submissions do |t|
      t.string  :email
      t.string  :subject
      t.text    :content
      t.timestamps
    end
  end
end
