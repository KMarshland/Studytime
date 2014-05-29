class User < ActiveRecord::Base

  has_and_belongs_to_many :studygroups

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      if user.name.nil?
        user.name = auth.info.name
      end
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def anonymized_email
    pcs =  self.email.split('@')
    pc1 = pcs[0]

    if (pc1.length > 3)
      pc1 = ''
      for i in (0..2)
        pc1 <<= pcs[0][i]
      end

      for i in (3..pcs[0].length)
        pc1 <<= '*'
      end
    end

    return pc1 << '@' << pcs[1]
  end

end
