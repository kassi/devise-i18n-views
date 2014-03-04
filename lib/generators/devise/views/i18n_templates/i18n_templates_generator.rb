module Devise
  module Views
    class I18nFormForTemplatesGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../../../../app/views', __FILE__)
      def copy_views
        directory("devise", Rails.root.join("app", "views", "devise"))
      end
    end

    class I18nPlainTemplatesGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../../../../app/views/devise', __FILE__)
      def copy_views
        directory("mailer", Rails.root.join("app", "views", "devise", "mailer"))
        directory("shared", Rails.root.join("app", "views", "devise", "shared"))
      end
    end

    class I18nSimpleFormForTemplatesGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../../templates/simple_form_for', __FILE__)
      def copy_views
        directory("devise", Rails.root.join("app", "views", "devise"))
      end
    end

    class I18nTemplatesGenerator < Rails::Generators::Base
      if defined?(SimpleForm)
        invoke I18nSimpleFormForTemplatesGenerator
        invoke I18nPlainTemplatesGenerator
      else
        invoke I18nFormForTemplatesGenerator
      end
    end
  end
end
