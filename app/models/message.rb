class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :hive

  def getMessage()
    activity = {
      'id' => self.id,
      'body' => self.body,
      'hived' => self.hived,
      'published' => self.created_at,
      'type' => 'message',
      'actor' => {
        'displayName' => self.user.name,
        'objectType' => 'person',
        'image' => self.user.image_url
      }
    }
    return activity
  end

  def set_default_options(options)
    defaults = {
      'email' => nil,
      'displayName' => nil,
      'image' => {
          'url' => 'http://www.gravatar.com/avatar/00000000000000000000000000000000?d=wavatar&s=48',
          'width' => 48,
          'height' => 48
       }
    }

    defaults.each {
      |key, value|
      if( !options[key] )
        options[key] = value
      end
    }

    return options
  end
end
