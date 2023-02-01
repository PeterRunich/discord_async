module DiscordAsync
  module REST
    module ApplicationRoleConnectionMetadata
      def get_application_role_connection_metadata_records
        @internet.get "#{@base_url}/applications/#{@app_id}/role-connections/metadata"
      end

      def update_application_role_connection_metadata_records(body)
        @internet.put "#{@base_url}/applications/#{@app_id}/role-connections/metadata", default_headers, body
      end
    end
  end
end