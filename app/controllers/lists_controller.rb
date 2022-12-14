class ListsController < ApplicationController

  def new
    @list = List.new
  end

  # 以下を追加
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @list.save
    # 4. トップ画面へリダイレクト
      redirect_to list_path(@list.id)
    else
      render :new#viewを表示（アクション無し
    end
  end

  def index
    @lists = List.all#テーブルに保存されたデータを全取得する
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])#投稿済みのデータを取得
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])#データを一見取得
    list.destroy#データを削除
    redirect_to '/lists' #投稿画面一覧にリダイレクト
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end