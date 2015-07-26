#!/bin/bash
ssh root@video.online-lab.ru << EOF
mkdir -p /root/videos/onlinelab/cam1
echo -e '#!/bin/bash\nexec /root/bin/ffmpeg -i rtsp://admin:12345@193.33.63.136:1554/Streaming/Channels/1 -c copy -map 0 -f segment -strftime 1 -segment_time 600 -segment_format mov "/root/videos/onlinelab/cam1/%Y-%m-%d_%H-%M-%S.mov" 2> /tmp/onlinelab_cam1_ffmpeg.log' > /root/onlinelab_cam1_ffmpeg.sh
chmod +x /root/onlinelab_cam1_ffmpeg.sh
echo -e '[program:onlinelab_cam1_ffmpeg]\ncommand=/root/onlinelab_cam1_ffmpeg.sh\nstdout_logfile=/tmp/onlinelab_cam1_ffmpeg.log\nstopsignal=KILL\nkillasgroup=true' > /etc/supervisor/conf.d/onlinelab_cam1_ffmpeg.conf
#echo -e '[program:onlinelab_cam1_ffmpeg]\ncommand=/root/bin/ffmpeg -i rtsp://admin:12345@193.33.63.136:1554/Streaming/Channels/1 -c copy -map 0 -f segment -strftime 1 -segment_time 600 -segment_format mov "/root/videos/onlinelab/cam1/%%Y-%%m-%%d_%%H-%%M-%%S.mov" 2> /tmp/onlinelab_cam1_ffmpeg.log \nstdout_logfile=/tmp/onlinelab_cam1_ffmpeg.log' > /etc/supervisor/conf.d/onlinelab_cam1_ffmpeg.conf
supervisorctl reread && supervisorctl update
EOF
