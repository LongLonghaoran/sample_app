控制器中render 是叫做视图(文件以名字开头)，视图中render叫做模板（文件以_开头)是吗？

form_for的 remote选项为true,让表单发送ajax请求，表示请求是js类型的（和http请求类型应该没什么关系），在控制器使用respond_to do |format|进行判断，执行与动作名相同的那个js.erb文件
