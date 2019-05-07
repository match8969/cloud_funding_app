# Class ProductStates < Inum::Base
#   # Rails 4 
#   define :DRAFT, 0
#   define :ACTIVE, 10
#   define :ACHIEVED, 20
#   define :UNACCHIEVED, 30
#   define :STOP, 40

#   def to_s
#     case self
#     when DRAFT
#         "下書き"
#     when ACTIVE
#         "支援募集中"
#     when ACHIEVED
#         "達成"
#     when UNACCHIEVED
#         "未達成終了"
#     when STOP
#         "一時募集停止中"
#     end 
#   end
# end