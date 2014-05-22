module Obtvse
  class PostsController < ApplicationController
    before_filter :require_login, except: [:index, :show, :admin]

    layout :get_layout

    def index
      @posts = Post.published.newest.page(params[:page]).per(8)

      respond_to do |format|
        format.html
        format.xml { render xml: @posts }
        format.rss { render layout: false }
      end
    end

    def show
      @single_post = true
      @post = Post.find_by_slug(params[:slug]) || (not_found && return)

      not_found && return if @post.draft and !logged_in?

      @next = Post.next(@post).last
      @previous = Post.previous(@post).first

      respond_to do |format|
        if @post.present?
          format.html
          format.xml { render xml: @post }
        else
          format.any { render status: 404  }
        end
      end
    end

    def admin
      if logged_in?
        @no_header = true
        @post = Post.new
        @published = Post.where(draft:false).order('published_at desc')
        @drafts = Post.where(draft:true).order('updated_at desc')
      else
        if no_users?
          render 'obtvse/users/create'
        else
          render 'obtvse/sessions/new'
        end
      end
    end

    def new
      @post = Post.new(title: params[:title] || '')
      @post_path = '/'

      respond_to do |format|
        format.html
      end
    end

    def edit
      @post = Post.find_by_slug(params[:slug])
      @post_path = post_path(@post)
    end

    def create
      @post = Post.new(params.require(:post).permit!)

      respond_to do |format|
        if @post.save
          format.html { redirect_to "/edit/#{@post.id}", notice: "Post created successfully" }
          format.xml { render xml: @post, status: :created, location: @post }
          format.text { render text: @post.to_json }
        else
          format.html { render action: 'new' }
          format.xml { render xml: @post.errors, status: :unprocessable_entity}
          format.text { head :bad_request }
        end
      end
    end

    def update
      @post = Post.find_by_slug(params[:slug])
      logger.info @post

      respond_to do |format|
        if @post.update_attributes(params.require(:post).permit!)
          format.html { redirect_to "/edit/#{@post.id}", notice: "Post updated successfully" }
          format.xml { head :ok }
          format.text { render text: @post.to_json }
        else
          format.html { render action: 'edit' }
          format.xml { render xml: @post.errors, status: :unprocessable_entity}
          format.text { head :bad_request }
        end
      end
    end

    def destroy
      @post = Post.find_by_slug(params[:slug])
      @post.destroy
      flash[:notice] = 'Post has been deleted'

      respond_to do |format|
        format.html { redirect_to '/admin' }
        format.xml { head :ok }
      end
    end

    private

    def admin?
      session[:admin] == true
    end

    def get_layout
      if %w[index show].include? action_name
        'obtvse/layouts/application'
      else
        'obtvse/layouts/obtvse_admin'
      end
    end
  end
end
