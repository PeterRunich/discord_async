


module DiscordAsync
  module Resources
    class Interaction < Dry::Struct
      class ResolvedData < Dry::Struct
        attribute? :users,
        attribute? :members,
        attribute? :roles,
        attribute? :channels,
        attribute? :messages,
        attribute? :attachments,
      end
    end
  end
end