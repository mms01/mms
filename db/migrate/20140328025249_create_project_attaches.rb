class CreateProjectAttaches < ActiveRecord::Migration
  def change
    create_table :project_attaches do |t|
      t.references :project, null: false  # 外部キー
      t.binary :upload_file, limit: 20.megabytes # 添付ファイル
      t.string :content_type              # MIMEタイプ
      t.timestamps
    end
    
    #add_index :project_attach, :project_id

  end
end
