Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF174E993
	for <lists+nouveau@lfdr.de>; Fri, 21 Jun 2019 15:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11A88855B;
	Fri, 21 Jun 2019 13:40:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC326E894
 for <nouveau@lists.freedesktop.org>; Fri, 21 Jun 2019 13:40:33 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [92.201.52.62] ([92.201.52.62]) by web-mail.gmx.net
 (3c-app-gmx-bs06.server.lan [172.19.170.55]) (via HTTP); Fri, 21 Jun 2019
 15:40:32 +0200
MIME-Version: 1.0
Message-ID: <trinity-35f9facc-7a00-4a02-8f6f-98f3a451a5e2-1561124432206@3c-app-gmx-bs06>
From: "Harald Harders" <harald.harders@gmx.de>
To: nouveau@lists.freedesktop.org
Date: Fri, 21 Jun 2019 15:40:32 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-16f49b00-55d6-4efb-a770-85f3c109b3de-1560947450982@3c-app-gmx-bs75>
References: <trinity-60f06d18-ea3c-49a9-8a25-d6aa7f233436-1560886110718@3c-app-gmx-bs22>
 <CAKb7UvifuLNe_Nq+7oGHTzgmo4a3mQ1kg0QX-kKfdABB8Ok_Hg@mail.gmail.com>
 <trinity-1a0b5a21-eb2a-4e86-81ce-5c34a2831c44-1560888767918@3c-app-gmx-bs22>
 <CAKb7Uvg4=G5Y_jGr8MGJ08ghkvv+FPPiz-zkkHKP2bZNjhrd7g@mail.gmail.com>
 <trinity-500c06a8-5dd3-4622-88f6-d6f4a3a6088a-1560924194315@3c-app-gmx-bs56>
 <CAKb7UvhUeDGqcNepqTpZ_opFo9MWBJexPLaAdMdnqX3gCexqXw@mail.gmail.com>
 <trinity-a8b265d3-e433-4ed5-a5ac-490a62fb2a92-1560939088597@3c-app-gmx-bs49>
 <trinity-16f49b00-55d6-4efb-a770-85f3c109b3de-1560947450982@3c-app-gmx-bs75>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Rc8nwiGGajii+00ihPAQqrxZIJnUdnzbhuYsFHr9rYWyZ79+eLpc+tvAUFad66Wc9wxm8
 zT70mNHPiv0pYSkNhjHS7+WIUOfKwmy82qd5Zv1keOHVSvaQPQIvI9l2b3PvrxXRQDZTp+YBuvIL
 hGQDTonflPWV6znDJQpxLiP3+4+XsrAtxiAr2DTQaEKweGJYSYs+AXCKSEmBr8W50eGNROflsKLx
 MckkdTDcZYLKam0ssjxlW/FzTzcEGRECUw9uF1iEuQOvJABEV957wp6RsKMbecmZDIrXuxtFUs66
 qU=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oTXvPEPRitQ=:Ul/JgVnfrlwz2iAvCCVFMM
 JrWxL+8LktvLwMwHcNagjXO0wbR8WNSg90sqK9vXYVvL3+mBI0o137OyvwLOk/nwVxs9Hzi2h
 1PNiUDYVma3f7iTy4tuODH4eVDyjcuKe9vsWKtqC/ev4CMue98pr0GaxDSqeAIK73Jk8gDfjg
 3WnNan3eb4RYeljQhQoJJh8sslvFqCkVxBTBBBz8gUVX5H6uarVVcLuIPAiaOBhwFMTPWjsn3
 X31BrmJCkmTxV75yYySHdKTNs7FfNGIZPGJP0wYPStL3VlZ3ytNimaEQuyUx8SQIhEUrWr+Z1
 zBuyRzht8o2ffIfHBEKpT/fUsLPb4txhIeaOwNViEVhmxUnpwAc+Zzu3ZtlclWzu8xqgjUC/s
 Q7UyKZZ6XqMcMNAyCQx++rNOEKKw6UQV/SO8dsgsKqRe1onkqwmI5BuqUs6k3uw66+DJBmwcb
 VHG7H+QQZMStht+cAkooZk4XivOi8+65xtJuJMbwRbqNP/42UkjqizGxK6YOG0wGz75ydHpCh
 4mcWEQc9TZtYeuVIC9YTn0YMGY534orUGm4f/R90HnKD/Q5I+m5SQ4M+E2D4DQhWJ3qwmt4nH
 uke5/EkpSkLy2/DxCToskglREWICdFSd8mnY28uKl9AFFRIO1Qu33xLw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1561124432;
 bh=aKL0spaYv/Czr/WQag+4yV/WTQz/liO8oPaWkT/QEhA=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=OPB6sjcOw0+BK2RP/QvS2++5AeQBev9X/1SwbDe3iJRpI9ZQf8fuyK87EQd7wfXSf
 0SEc+mfWE4ADI84miG2bJFv4fq+ICgZ6TmVurdLHyBpPO7Vz4Gn+nxl4itVHdRjM4y
 AFI7MOIhVCQwhU18PDplmqYCX8ZqH6RqxgX3MnjU=
Subject: Re: [Nouveau] Instable graphics with GeForce GT 730M,
 especially on external monitor
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0507387362=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0507387362==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>In the meanwhile I have tried OpenSUSE Tumbleweed as live version:</div>

<div>Kernel version 5.1.7</div>

<div>xf86-video-nouveau 1.0.15</div>

<div>libdrm_nouveau2 2.4.98</div>

<div>libvdpau_nouveau 19.0.5</div>

<div>Mesa-dri-nouveau 19.0.5</div>

<div>&nbsp;</div>

<div>Behaviour is the same:</div>

<div>- In most cases, external display does not show correct screen</div>

<div>- After hot-plugging the connection cable, the external display usually works until screensaver is invoked once.</div>

<div>&nbsp;</div>

<div>Do you have any idea how to narrow down the problem?</div>

<div>&nbsp;</div>

<div>Best regards</div>

<div>Harald</div>

<div>&nbsp;
<div>&nbsp;
<div name="quote" style="margin:10px 5px 5px 10px; padding: 10px 0 10px 10px; border-left:2px solid #C3D9E5; word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">
<div style="margin:0 0 10px 0;"><b>Gesendet:</b>&nbsp;Mittwoch, 19. Juni 2019 um 08:30 Uhr<br/>
<b>Von:</b>&nbsp;&quot;Harald Harders&quot; &lt;harald.harders@gmx.de&gt;<br/>
<b>An:</b>&nbsp;nouveau@lists.freedesktop.org<br/>
<b>Betreff:</b>&nbsp;Re: [Nouveau] Instable graphics with GeForce GT 730M, especially on external monitor</div>

<div name="quoted-content">
<div style="font-family: Verdana;font-size: 12.0px;">
<div>One additional remark: I have the impression that the graphics output works with higher probability after unplugging and plugging the cable.</div>

<div>After system start, display is usually distorted and after screensaver, display is usually distorted...</div>

<div>
<div>&nbsp;
<div style="margin: 10.0px 5.0px 5.0px 10.0px;padding: 10.0px 0 10.0px 10.0px;border-left: 2.0px solid rgb(195,217,229);">
<div style="margin: 0 0 10.0px 0;"><b>Gesendet:</b>&nbsp;Mittwoch, 19. Juni 2019 um 12:11 Uhr<br/>
<b>Von:</b>&nbsp;&quot;Harald Harders&quot; &lt;harald.harders@gmx.de&gt;<br/>
<b>An:</b>&nbsp;nouveau@lists.freedesktop.org<br/>
<b>Betreff:</b>&nbsp;Re: [Nouveau] Instable graphics with GeForce GT 730M, especially on external monitor</div>

<div>
<div style="font-family: Verdana;font-size: 12.0px;">
<div>Please excuse that I might be not too clever in finding the problem. I&#39;m an experienced user, but I&#39;m not that deep into administration and hardware.</div>

<div>&nbsp;</div>

<div>When connected via DVI on the docking station: the output is as follows:</div>

<div>&nbsp;</div>

<div>
<div>harders@lose:~&gt; grep . /sys/class/drm/card*-*/status<br/>
/sys/class/drm/card0-DP-1/status:disconnected<br/>
/sys/class/drm/card0-DP-2/status:disconnected<br/>
/sys/class/drm/card0-DP-3/status:disconnected<br/>
/sys/class/drm/card0-DP-4/status:connected<br/>
/sys/class/drm/card0-DP-5/status:disconnected<br/>
/sys/class/drm/card0-eDP-1/status:connected<br/>
/sys/class/drm/card0-HDMI-A-1/status:disconnected<br/>
/sys/class/drm/card0-HDMI-A-2/status:disconnected<br/>
/sys/class/drm/card0-VGA-1/status:disconnected</div>

<div>&nbsp;</div>

<div>When connected via VGA on the docking station, it is:</div>

<div>&nbsp;</div>

<div>
<div>harders@lose:~&gt; grep . /sys/class/drm/card*-*/status<br/>
/sys/class/drm/card0-DP-1/status:disconnected<br/>
/sys/class/drm/card0-DP-2/status:disconnected<br/>
/sys/class/drm/card0-DP-3/status:disconnected<br/>
/sys/class/drm/card0-DP-5/status:disconnected<br/>
/sys/class/drm/card0-DP-6/status:connected<br/>
/sys/class/drm/card0-eDP-1/status:connected<br/>
/sys/class/drm/card0-HDMI-A-1/status:disconnected<br/>
/sys/class/drm/card0-HDMI-A-2/status:disconnected<br/>
/sys/class/drm/card0-VGA-1/status:disconnected</div>

<div>&nbsp;</div>

<div>When connected via VGA on the computer directly, it is:</div>

<div>&nbsp;</div>

<div>
<div>harders@lose:~&gt; grep . /sys/class/drm/card*-*/status<br/>
/sys/class/drm/card0-DP-1/status:disconnected<br/>
/sys/class/drm/card0-DP-2/status:disconnected<br/>
/sys/class/drm/card0-eDP-1/status:connected<br/>
/sys/class/drm/card0-HDMI-A-1/status:disconnected<br/>
/sys/class/drm/card0-HDMI-A-2/status:disconnected<br/>
/sys/class/drm/card0-VGA-1/status:connected</div>

<div>&nbsp;</div>

<div>After hot-plugging the DVI cable again, the output is as follows:</div>

<div>&nbsp;</div>

<div>
<div>harders@lose:~&gt; grep . /sys/class/drm/card*-*/status<br/>
/sys/class/drm/card0-DP-1/status:disconnected<br/>
/sys/class/drm/card0-DP-2/status:disconnected<br/>
/sys/class/drm/card0-DP-3/status:disconnected<br/>
/sys/class/drm/card0-DP-5/status:connected<br/>
/sys/class/drm/card0-DP-6/status:disconnected<br/>
/sys/class/drm/card0-eDP-1/status:connected<br/>
/sys/class/drm/card0-HDMI-A-1/status:disconnected<br/>
/sys/class/drm/card0-HDMI-A-2/status:disconnected<br/>
/sys/class/drm/card0-VGA-1/status:disconnected</div>

<div>&nbsp;</div>

<div>Thus, the number of connected DP has changed from 4 to 5, while the hardware condition is identical.</div>
</div>

<div>&nbsp;</div>

<div>I guess your assumption is correct that most connectors are handled as DP internally. The only thing which makes me wonder is that I have encountered the problem also with VGA on the laptop itself (which is listed as VGA-1, here.</div>

<div>&nbsp;</div>

<div>Side note: After booting my computer (with monitor connected via DVI), I had the display error. After switching to VGA on docking station, to VGA on laptop, and back to DVI on docking station, the diplay is just fine right now. That&#39;s the strange thing that the error is not showing consistently.</div>
</div>
</div>
&nbsp;

<div style="margin: 10.0px 5.0px 5.0px 10.0px;padding: 10.0px 0 10.0px 10.0px;border-left: 2.0px solid rgb(195,217,229);">
<div style="margin: 0 0 10.0px 0;"><b>Gesendet:</b>&nbsp;Mittwoch, 19. Juni 2019 um 08:09 Uhr<br/>
<b>Von:</b>&nbsp;&quot;Ilia Mirkin&quot; &lt;imirkin@alum.mit.edu&gt;<br/>
<b>An:</b>&nbsp;&quot;Harald Harders&quot; &lt;harald.harders@gmx.de&gt;<br/>
<b>Cc:</b>&nbsp;nouveau &lt;nouveau@lists.freedesktop.org&gt;<br/>
<b>Betreff:</b>&nbsp;Re: [Nouveau] Instable graphics with GeForce GT 730M, especially on external monitor</div>

<div>Sigh ... you&#39;re on wayland. xrandr is just showing you what&#39;s passed<br/>
through via Xwayland, which is not the connector names. Let&#39;s try<br/>
something else...<br/>
<br/>
grep . /sys/class/drm/card*-*/status<br/>
<br/>
Should give you the status of each connector. Is it the DP-* ones that<br/>
are connected, or are e.g. VGA-1 or DVI-D-1/etc connected?<br/>
<br/>
-ilia<br/>
<br/>
On Wed, Jun 19, 2019 at 2:03 AM Harald Harders &lt;harald.harders@gmx.de&gt; wrote:<br/>
&gt;<br/>
&gt; When the monitor is connected via DVI, the xrandr output is as follows:<br/>
&gt;<br/>
&gt; harders@lose:~&gt; xrandr<br/>
&gt; Screen 0: minimum 320 x 200, current 3840 x 1200, maximum 8192 x 8192<br/>
&gt; XWAYLAND0 connected 1920x1080+1920+0 (normal left inverted right x axis y axis) 310mm x 170mm<br/>
&gt; 1920x1080 59.96*+<br/>
&gt; XWAYLAND1 connected 1920x1200+0+0 (normal left inverted right x axis y axis) 520mm x 320mm<br/>
&gt; 1920x1200 59.88*+<br/>
&gt;<br/>
&gt; or verbose:<br/>
&gt;<br/>
&gt; harders@lose:~&gt; xrandr --verbose<br/>
&gt; Screen 0: minimum 320 x 200, current 3840 x 1200, maximum 8192 x 8192<br/>
&gt; XWAYLAND0 connected 1920x1080+1920+0 (0x24) normal (normal left inverted right x axis y axis) 310mm x 170mm<br/>
&gt; Identifier: 0x21<br/>
&gt; Timestamp: 41572<br/>
&gt; Subpixel: unknown<br/>
&gt; Gamma: 1.0:1.0:1.0<br/>
&gt; Brightness: 0.0<br/>
&gt; Clones:<br/>
&gt; CRTC: 0<br/>
&gt; CRTCs: 0<br/>
&gt; Transform: 1.000000 0.000000 0.000000<br/>
&gt; 0.000000 1.000000 0.000000<br/>
&gt; 0.000000 0.000000 1.000000<br/>
&gt; filter:<br/>
&gt; non-desktop: 0<br/>
&gt; supported: 0, 1<br/>
&gt; 1920x1080 (0x24) 173.000MHz -HSync +VSync *current +preferred<br/>
&gt; h: width 1920 start 2048 end 2248 total 2576 skew 0 clock 67.16KHz<br/>
&gt; v: height 1080 start 1083 end 1088 total 1120 clock 59.96Hz<br/>
&gt; XWAYLAND1 connected 1920x1200+0+0 (0x25) normal (normal left inverted right x axis y axis) 520mm x 320mm<br/>
&gt; Identifier: 0x23<br/>
&gt; Timestamp: 41572<br/>
&gt; Subpixel: unknown<br/>
&gt; Gamma: 1.0:1.0:1.0<br/>
&gt; Brightness: 0.0<br/>
&gt; Clones:<br/>
&gt; CRTC: 1<br/>
&gt; CRTCs: 1<br/>
&gt; Transform: 1.000000 0.000000 0.000000<br/>
&gt; 0.000000 1.000000 0.000000<br/>
&gt; 0.000000 0.000000 1.000000<br/>
&gt; filter:<br/>
&gt; non-desktop: 0<br/>
&gt; supported: 0, 1<br/>
&gt; 1920x1200 (0x25) 193.250MHz -HSync +VSync *current +preferred<br/>
&gt; h: width 1920 start 2056 end 2256 total 2592 skew 0 clock 74.56KHz<br/>
&gt; v: height 1200 start 1203 end 1209 total 1245 clock 59.88Hz<br/>
&gt;<br/>
&gt; When switching to VGA cable, the only changes are in the gamma, brightness, and Identifier values. I don&#39;t find anything which refers to DP or a port. What else can I do to narrow it down?<br/>
&gt; --<br/>
&gt; Harald Harders<br/>
&gt; harald.harders@gmx.de<br/>
&gt;<br/>
&gt;<br/>
&gt; Gesendet: Dienstag, 18. Juni 2019 um 22:30 Uhr<br/>
&gt; Von: &quot;Ilia Mirkin&quot; &lt;imirkin@alum.mit.edu&gt;<br/>
&gt; An: &quot;Harald Harders&quot; &lt;harald.harders@gmx.de&gt;<br/>
&gt; Cc: nouveau &lt;nouveau@lists.freedesktop.org&gt;<br/>
&gt; Betreff: Re: [Nouveau] Instable graphics with GeForce GT 730M, especially on external monitor<br/>
&gt; What&#39;s the connector name when you plug in via, say, DVI? Is it &quot;DP-1&quot;<br/>
&gt; or is it &quot;DVI-D-1&quot; or whatever? You should be able to see the name in<br/>
&gt; &#39;xrandr&#39;. Unfortunately I don&#39;t know how the T440p is wired, there are<br/>
&gt; a few ways it could go. In some cases, even the &quot;VGA&quot; port is secretly<br/>
&gt; a DP -&gt; VGA active adapter inside the laptop.<br/>
&gt;<br/>
&gt; Basically I&#39;m trying to rule DisplayPort as a source of potential issues.<br/>
&gt;<br/>
&gt; -ilia<br/>
&gt;<br/>
&gt; On Tue, Jun 18, 2019 at 4:12 PM Harald Harders &lt;harald.harders@gmx.de&gt; wrote:<br/>
&gt; &gt;<br/>
&gt; &gt; Hi Ilia,<br/>
&gt; &gt;<br/>
&gt; &gt; First I had upgraded from OpenSUSE 13.2 (where it worked) to OpenSUSE Leap 15.1. After having the same issue I have done a clean new install. The new kernel version is 4.12.14, as you suspected. In OpenSUSE, I suspect it was version 3.16.7. Unfortunately, I cannot find out anymore which nouveau version I have used before. I have a file backup of the old installation. Can I find out which nouveau version I had before?<br/>
&gt; &gt;<br/>
&gt; &gt; During all my attempts, I have also installed Ubuntu 18.04.2 with the same strange behaviour. I guess this was the 4.18 kernel version?<br/>
&gt; &gt; Do you know which distrubtion already uses a 5.0 kernel? I will try a live system, then.<br/>
&gt; &gt;<br/>
&gt; &gt; I have a docking station with 4 monitor ports: VGA, DVI, HDMI, Displayport. And my laptop has VGA and Mini-Displayport. My monitor (Fujitsu P24W-7 LED) has VGA, DVI, HDMI, and Displayport.<br/>
&gt; &gt; I have tried DVI-&gt;DVI and DisplayPort-&gt;HDMI cable on the docking station (I don&#39;t hav. In one of my attempts, I have connected the screen via analog VGA cable directly to the computer. The same effect resulted. Thus, I believe the docking station and digital connection to the monitor are not part of the problem.<br/>
&gt; &gt;<br/>
&gt; &gt; Best regards<br/>
&gt; &gt; Harald<br/>
&gt; &gt;<br/>
&gt; &gt; PS: I guess sending to the mailing list and omitting your personal mail address is correct, right?<br/>
&gt; &gt;<br/>
&gt; &gt;<br/>
&gt; &gt; Gesendet: Dienstag, 18. Juni 2019 um 21:36 Uhr<br/>
&gt; &gt; Von: &quot;Ilia Mirkin&quot; &lt;imirkin@alum.mit.edu&gt;<br/>
&gt; &gt; An: &quot;Harald Harders&quot; &lt;harald.harders@gmx.de&gt;<br/>
&gt; &gt; Cc: nouveau &lt;nouveau@lists.freedesktop.org&gt;<br/>
&gt; &gt; Betreff: Re: [Nouveau] Instable graphics with GeForce GT 730M, especially on external monitor<br/>
&gt; &gt; Which kernel did you update from and to? Also, 4.12 is fairly old -<br/>
&gt; &gt; can you try like a live usb image of some distro with e.g. a 5.0<br/>
&gt; &gt; kernel or something?<br/>
&gt; &gt;<br/>
&gt; &gt; How do you connect the external screen? Is it like a DP port with an<br/>
&gt; &gt; optional dock with a variety of active DP adapters? Or is there a DP++<br/>
&gt; &gt; port that you&#39;re plugging a DP &lt;-&gt; HDMI passive adapter into?<br/>
&gt; &gt;<br/>
&gt; &gt; On Tue, Jun 18, 2019 at 3:28 PM Harald Harders &lt;harald.harders@gmx.de&gt; wrote:<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt; Dear all,<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt; I have recently updated my Lenovo T440p with a dual graphics card (Intel Core + GeForce GT 730M) to OpenSUSE Leap 15.1. Since then, the external screen (connected either via VGA, DVI, HDMI, or DisplayPort) has a vertically stretched output which jumps horizontally in high frequency. Whenever touching any settings for the built in display (e.g. by gnome-control-center), also this screen starts incorrect display. Sometimes, however, also the external screen works as expected.<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt; Installed driver version is (only 2D installed):<br/>
&gt; &gt; &gt; xf86-video-nouveau: 1.0.15-lp151.4.1<br/>
&gt; &gt; &gt; libvdpau_nouveau: 18.3.2-lp151.22.4<br/>
&gt; &gt; &gt; libdrm_nouveau2: 2.4.97-lp151.1.1<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt; I have followed your instructions on the TroubleShooting page, No signs for NVIDIA drivers running, everything appears to be okay. Minimal xorg.conf did not work, screenshots are okay.Unfortunately, I failed in installing the most recent nouveau version (neither /lib/modules/4.12.14-lp151.28.4-default/source nor /lib/modules/4.12.14-lp151.28.4-default/build are present on my computer even though I have installed the Kernel sources). The installed version is still quite new, isn&#39;t it?<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt; I suspect that I might have the issue you describe under &quot;Blank monitor, flicker, snow, or other random live image corruption&quot;. I would like to make sure, however. And since you warn with regards to potential permanent damage, I would like to make sure, first.<br/>
&gt; &gt; &gt; Can you confirm that it should be this issue? Or are there any other things I should try first?<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt; Best regards<br/>
&gt; &gt; &gt; Harald<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt; lose:/home/harders/download/nouveau/drm # lspci &#124; grep -i vga<br/>
&gt; &gt; &gt; 00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor Integrated Graphics Controller (rev 06)<br/>
&gt; &gt; &gt; 02:00.0 VGA compatible controller: NVIDIA Corporation GK208M [GeForce GT 730M] (rev a1)<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt; _______________________________________________<br/>
&gt; &gt; &gt; Nouveau mailing list<br/>
&gt; &gt; &gt; Nouveau@lists.freedesktop.org<br/>
&gt; &gt; &gt; <a href="https://lists.freedesktop.org/mailman/listinfo/nouveau" target="_blank">https://lists.freedesktop.org/mailman/listinfo/nouveau</a><br/>
&gt; &gt; _______________________________________________<br/>
&gt; &gt; Nouveau mailing list<br/>
&gt; &gt; Nouveau@lists.freedesktop.org<br/>
&gt; &gt; <a href="https://lists.freedesktop.org/mailman/listinfo/nouveau" target="_blank">https://lists.freedesktop.org/mailman/listinfo/nouveau</a><br/>
&gt; _______________________________________________<br/>
&gt; Nouveau mailing list<br/>
&gt; Nouveau@lists.freedesktop.org<br/>
&gt; <a href="https://lists.freedesktop.org/mailman/listinfo/nouveau" target="_blank">https://lists.freedesktop.org/mailman/listinfo/nouveau</a></div>
</div>
</div>
</div>
_______________________________________________ Nouveau mailing list Nouveau@lists.freedesktop.org <a href="https://lists.freedesktop.org/mailman/listinfo/nouveau" target="_blank">https://lists.freedesktop.org/mailman/listinfo/nouveau</a></div>
</div>
</div>
</div>
</div>
_______________________________________________ Nouveau mailing list Nouveau@lists.freedesktop.org <a href="https://lists.freedesktop.org/mailman/listinfo/nouveau" target="_blank">https://lists.freedesktop.org/mailman/listinfo/nouveau</a></div>
</div>
</div>
</div></div></body></html>

--===============0507387362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0507387362==--
