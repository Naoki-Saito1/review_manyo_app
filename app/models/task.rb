class Task < ApplicationRecord
  belongs_to :user
  enum status: {"待機中":1, "稼働中":2, "終了":3, "完全制覇":4}
  enum priority: {"A":1,"B":2,"C":3,"D":4}
  scope :sort_hoge, -> {order(limit: :desc)}
  scope :sort_status, -> {order(status: :desc)}
  scope :sort_priority, -> {order(priority: :desc)}
  scope :task_sort, -> (title_hoge){where('title LIKE ?', "%#{title_hoge}%")}
                      #  モデル名.where('検索するカラム名 LIKE(?)', "検索するキーワード")
  scope :status_sort, -> (status_hoge){where(status: status_hoge)}    
  scope :and_sort, -> (title_hoge,status_hoge) { where('title LIKE ?', "%#{title_hoge}%").where(status: status_hoge) }
                
end
