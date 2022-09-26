    class UsersController < ApplicationController
        def index
          @users=User.all 
          flash[:alert] = "Users view page"

        end
      
        def show 
          @user=User.find(params[:id])
          flash[:notice] = "Users page"
        end
      end