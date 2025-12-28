# Fix for best_in_place gem compatibility with Rails 7.1
# The gem's railtie tries to initialize ActionView::Base.new without arguments
# Rails 7.1 requires 3 arguments: lookup_context, assigns, controller
# This patch provides a compatible initialization

module ActionView
  class Base
    # Monkey patch to allow ActionView::Base.new() without arguments
    # This is needed for best_in_place gem compatibility
    class << self
      alias_method :new_without_best_in_place, :new
      
      def new(*args)
        if args.empty?
          # Create a minimal instance for best_in_place
          # This is a workaround - best_in_place only needs the helper methods
          instance = allocate
          # Initialize with minimal required components
          lookup_context = ActionView::LookupContext.new([])
          instance.instance_variable_set(:@lookup_context, lookup_context)
          instance.instance_variable_set(:@assigns, {})
          instance.instance_variable_set(:@controller, nil)
          instance
        else
          new_without_best_in_place(*args)
        end
      end
    end
  end
end

