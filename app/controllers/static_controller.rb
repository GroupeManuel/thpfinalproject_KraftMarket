class StaticController < ApplicationController

def home_buyer
end

def home_seller
   
end

def about
end

def contact
end

private

def testeur
    params.permit(:redirect_status)
end

end

