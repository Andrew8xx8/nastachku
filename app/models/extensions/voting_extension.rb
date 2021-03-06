module Extensions
  module VotingExtension

    def voted_by?(user)
      voting = where(user_id: user.id).first
      voting.present?
    end

    def vote_by(user)
      return false if voted_by? user
      voting = proxy_association.build(user: user)
      voting.save
    end
  end
end
