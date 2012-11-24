module Paperclip
  module Interpolations
    def user_id(attachment, style)
      attachment.instance.user_id
    end
  end
end