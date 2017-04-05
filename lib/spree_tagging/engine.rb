module SpreeTagging
  class Engine < Rails::Engine
    require 'spree/core'
    require 'acts-as-taggable-on'
    isolate_namespace Spree
    engine_name 'spree_tagging'

    # if ActsAsTaggableOn::Utils.using_mysql?
    #   ActsAsTaggableOn.force_binary_collation = true
    # end

    ActsAsTaggableOn::Tag.class_eval do
      self.table_name_prefix = 'spree_'
    end

    ActsAsTaggableOn::Tagging.class_eval do
      self.table_name_prefix = 'spree_'
    end

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
