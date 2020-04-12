class BlogsController < ApplicationController
    def index
    end
    def show_all
        @blogs = Blog.all
    end
    def create
        puts params
        blog = Blog.create(blog_params)
        if blog.valid?
            redirect_to "/blogs"
        else
            redirect_to "/blogs", flash: blog.errors.full_messages
        end
    end
    private
    def blog_params
        params.require(:blog).permit(:name, :description)
    end
end
