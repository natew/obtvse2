class AddDefaultUser < ActiveRecord::Migration
  def up
    execute "insert into users(id,username,email,crypted_password,salt) values('1','username','username@example.com','$2a$10$B0dA63CQWofEb4L6PYeqPuHZPGLy9crS4K0k1vq0YbCah/L50/kxm','zzSZPpSsdbM9j6HtXjXT');"
  end

  def down
    execute "delete from users where id = '1';"
  end
end
