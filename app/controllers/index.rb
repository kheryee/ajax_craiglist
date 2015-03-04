get '/' do
  # Look in app/views/index.erb
  @category = Category.all
  erb :index
end


get '/new_post' do
  @category = Category.all
  erb :new_post
end

post '/post_complete' do
  begin
    params.each do |key,value|
      raise ArgumentError.new if params[key]==""
    end
    post = Post.create(title: params[:title], body: params[:body],
                      img_link: params[:img_link], location: params[:location],
                      email: params[:email], phone: params[:phone],
                      category_id: Category.where(name: params[:category])[0].id)
    post.generate_edit_key
    @key = post.edit_key
    erb :post_complete
  rescue ArgumentError
    @error = "Form Incomplete"
    erb :error
  end
end

get '/edit' do
  @update = nil
  @category = Category.all
  key_edit = params[:key]
  @post = Post.where(edit_key: key_edit)[0]
  erb :edit_post
end

post '/edit' do
  @post = Post.find(params[:id].to_i)
  @update = "Your post has been updated! #{@post.click_count}"
  @count = @post.click_count
  @count += 1
  @category = Category.all
  Post.update(params[:id].to_i, title: params[:title], body: params[:body],
                      img_link: params[:img_link], location: params[:location],
                      email: params[:email], phone: params[:phone],
                      category_id: Category.where(name: params[:category])[0].id)
  erb :edit_post
end



get %r{/([\d]+)/([\d]+)$} do
  @post_id = request.path.split("/")[2].to_i
  @post = Post.find(@post_id)
  erb :posts
end

get %r{/([\d]+)$} do
  begin
    @category_path = request.path
    @category = Category.find(request.path[1..-1].to_i)
    @category_name = @category.name
    @posts = @category.posts
    erb :category
  rescue
    @error = "Category Not Found"
    erb :error
  end
end

