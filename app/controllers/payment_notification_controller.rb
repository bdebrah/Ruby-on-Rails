class PaymentNotificationController < ApplicationController
    protect_from_forgery except: [:create]

  def create
    # @payment = PaymentNotification.create!(params: params, product_id: params[:invoice], status: params[:payment_status], transaction_id: params[:txn_id] )
    @payment = PaymentNotification.create()
    @cart = [];
    # render nothing: true
    redirect_to root_url, notice: 'Success!'
    #if @payment.status == 'Completed'
    #    redirect_to root_url, notice: 'Success!'
    #  else
    #    redirect_to root_url, notice: 'Error'
    #end

  end
end