require 'rails_helper'

RSpec.describe 'ユーザー新規登録',  type: :systme do
  before do
    @user = FactoryBot.build(:user)
  end
end
context 'ユーザーが新規登録できる時' do
  it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
    #トップページに移動する
    visit root_path

    #トップページに新規登録ページへ移動するボタンがあるか確認する
    expect(page).to have_content('新規登録')
    
    #新規登録ページへ移動する
    visit new_user_registration_path
    
    #ユーザー情報を入力する
    @user = FactoryBot.build(:user)
    fill_in '氏名', with: @user.name
    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: @user.password
    fill_in 'パスワードの確認', with: @user.password_confirmation
    
    #新規登録ボタンを押すとユーザーモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { User.count }.by(1)
    
    #トップページに移動する
    expect(current_path).to eq root_path
  end
end

RSpec.describe "ユーザーログイン機能", type: :system do
  it 'ログインしていない状態でトップページにアクセスした場合、サインインページに移動する' do
    # トップページに遷移する
    visit root_path

    # ログインしていない場合、サインインページに遷移していることを確認する
    # expect(current_path).to eq new_user_session_path
  end

  it 'ログインに成功し、トップページに遷移する' do
    # 予め、ユーザーをDBに保存する

    # サインインページへ移動する

    # ログインしていない場合、サインインページに遷移していることを確認する

    # すでに保存されているユーザーのemailとpasswordを入力する

    # ログインボタンをクリックする

    # トップページに遷移していることを確認する

  end
  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する

    # トップページに遷移する

    # ログインしていない場合、サインインページに遷移していることを確認する

    # 誤ったユーザー情報を入力する

    # ログインボタンをクリックする

    # サインインページに戻ってきていることを確認する

  end
end