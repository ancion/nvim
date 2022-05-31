" please read through this file and change what you need to change

" python 解释器的位置
let g:python3_host_prog = '/usr/bin/python3'
let g:python3_host_prog = 'F:\Scoop\apps\python\current\python.exe'

" ruby 解释器的位置
let g:ruby_host_prog = 'F:\SCOOP\apps\ruby\current\bin\ruby.exe'

" nvim 需要使用预览 Markdown 文件的浏览器
let g:mkdp_browser = 'chromium'

" 配置文件对应的位置
let g:setting_dir = stdpath('config')

" 窗口是否透明
let g:window_transparency = 0

" 使用的终端程序
let g:shell = "zsh"
let g:shell = "powershell -NoLogo"

" 设置 fzf 的位置
set rtp+=/usr/bin/fzf
set rtp+=F:/Scoop/apps/fzf/current/fzf.exe
