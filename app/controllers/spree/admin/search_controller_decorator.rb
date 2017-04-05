module Spree
  module Admin
    SearchController.class_eval do
      def tags
        @tags =
          if params[:ids]
            Tag.where(id: params[:ids].split(",").flatten)
          else
            Tag.ransack(params[:q]).result
          end
      end
    end
  end
end
