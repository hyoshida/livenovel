class Novel < Volt::Model
  own_by_user

  field :body, String

  belongs_to :user

  permissions(:update, :delete) do
    # Only the person who created the post can delete or update it
    deny unless owner?
  end

  def body=(body)
    set(:body, body.strip)
  end
end
