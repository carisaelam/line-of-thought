class LikesController < ApplicationController
  # POST /likes or /likes.json
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build
    @like.user = current_user

    respond_to do |format|
      if @like.save
        format.html { redirect_to @post, notice: "You liked this post!" }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1 or /likes/1.json
  def destroy
    @post = Post.find(params[:post_id])
    like = @post.likes.find_by(user: current_user)
    like.destroy if like

    respond_to do |format|
      format.html { redirect_to @post, notice: "Like was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end
