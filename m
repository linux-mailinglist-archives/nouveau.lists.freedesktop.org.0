Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770654B1C5
	for <lists+nouveau@lfdr.de>; Wed, 19 Jun 2019 08:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665C06E296;
	Wed, 19 Jun 2019 06:03:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766C46E296
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jun 2019 06:03:16 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [92.201.98.39] ([92.201.98.39]) by web-mail.gmx.net
 (3c-app-gmx-bs56.server.lan [172.19.170.140]) (via HTTP); Wed, 19 Jun 2019
 08:03:14 +0200
MIME-Version: 1.0
Message-ID: <trinity-500c06a8-5dd3-4622-88f6-d6f4a3a6088a-1560924194315@3c-app-gmx-bs56>
From: "Harald Harders" <harald.harders@gmx.de>
To: nouveau <nouveau@lists.freedesktop.org>
Date: Wed, 19 Jun 2019 08:03:14 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAKb7Uvg4=G5Y_jGr8MGJ08ghkvv+FPPiz-zkkHKP2bZNjhrd7g@mail.gmail.com>
References: <trinity-60f06d18-ea3c-49a9-8a25-d6aa7f233436-1560886110718@3c-app-gmx-bs22>
 <CAKb7UvifuLNe_Nq+7oGHTzgmo4a3mQ1kg0QX-kKfdABB8Ok_Hg@mail.gmail.com>
 <trinity-1a0b5a21-eb2a-4e86-81ce-5c34a2831c44-1560888767918@3c-app-gmx-bs22>
 <CAKb7Uvg4=G5Y_jGr8MGJ08ghkvv+FPPiz-zkkHKP2bZNjhrd7g@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Je/fFApJGxSSxX2wa/ZYCoTQOTzD3pyzmDlZ6N6s3UNK76xU93FTCoOjxFJ+7YKt8P43d
 c0pe6g0mw+Mrh5zP4SYXr9hmZ83lvw33WqHXx5b7IQx/3Os8HYSD0GHT9zl0inTmGwcWYAQ4QhZK
 VrB9VaSw9ynQpxOszvouQdJrqsyPf3hV530w2NirZF3HJKD2Z9uuAgnVcGEHoL4/UQvVLl5gRvKs
 gi/XnBmQ0oq8JRcLdzVYoThqcN6esMAoStfovNkGPRudVGAW8iS47Bju912bItE5a4RCfDU4EQ0j
 ks=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9bAazshIrRw=:F+h/V0QtF5O73Z/0oNNR+e
 VhgmAyvwX5daHA77urZzDyWepp3B7vJ6OhEubueELKvRMY2PQRCgY2dj9722rmhAOWg/VhL6z
 ucTy8RFHT01qvH0gDNl5IAMaQChS8B3RUXyqrHwZ3Y5cQoXUQX2z+j+JScnzmWNDbdKTYwhhJ
 NF60YIuAi5WvZyoB+IeuIQrQ4LwN+WzwvJCgVMDSkqh6fEsY+hlxCZLygBhUH077t/jri83Ta
 9pjlvD/oyRo2pgBxUi/Lrge5NyjAjadZUA4bSJ6znAwXVrJPQBy+8m5fMZ3RA1k3bZQSKYiOy
 tmmuHIgJn652E0O/kiaS6tEdujBJzIfMG9NINSZWePUDIA5kSjyi92H1szCjeif0XZTzKlceq
 Vf7qZGe9PYz14F03KbIrSNhnTOCEz/54hYZT7bWM0VduMeiu9PAVlbJF4eHpnnjvbbgopYY6+
 XzdgDePMZNQKiNPjNWAFWwXkULS/3t71Np5+eKtIs4v7MvVNxGYKSV2exjK0/a53cfVJzei6j
 1v0bO7HEUMzB419IoT69RKycw5yAfwU/sEoT2UtQoclJJX4z4/QgaWKTfqnTATK4m5WYIFT6E
 Qe3dQ+h7V1Vb2kVvJxktl6opDJG9jKBm7tH24SDELbzWh315KsEhNV8g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1560924194;
 bh=tCZRJgBevWXYLa0PJyBZ/xEw8z9s2Kr/Nv5d4NPz9FQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=PWs25AeMVByTNDSIPtLdzfILywtlg4qf6/A5u9CDiJqZ/bwbzESaBeo2Xuye2g9Qm
 Eu8XoHdN+Du5PDk2j4ciNyIu98vMyG315J3AzyMXVrlJdi+GSCMHg8u/Dr7stx6AWG
 +Nuej0X4GGN3rGpVbeqje4OWEpaGEA0C/7p+zZ8U=
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
Content-Type: multipart/mixed; boundary="===============0333807119=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0333807119==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>When the monitor is connected via DVI, the xrandr output is as follows:</div>

<div>&nbsp;</div>

<div>
<div>harders@lose:~&gt; xrandr<br/>
Screen 0: minimum 320 x 200, current 3840 x 1200, maximum 8192 x 8192<br/>
XWAYLAND0 connected 1920x1080+1920+0 (normal left inverted right x axis y axis) 310mm x 170mm<br/>
&nbsp;&nbsp; 1920x1080&nbsp;&nbsp;&nbsp;&nbsp; 59.96*+<br/>
XWAYLAND1 connected 1920x1200+0+0 (normal left inverted right x axis y axis) 520mm x 320mm<br/>
&nbsp;&nbsp; 1920x1200&nbsp;&nbsp;&nbsp;&nbsp; 59.88*+</div>

<div>&nbsp;</div>

<div>or verbose:</div>

<div>&nbsp;</div>

<div>
<div>harders@lose:~&gt; xrandr --verbose<br/>
Screen 0: minimum 320 x 200, current 3840 x 1200, maximum 8192 x 8192<br/>
XWAYLAND0 connected 1920x1080+1920+0 (0x24) normal (normal left inverted right x axis y axis) 310mm x 170mm<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Identifier: 0x21<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Timestamp:&nbsp; 41572<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Subpixel:&nbsp;&nbsp; unknown<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gamma:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.0:1.0:1.0<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Brightness: 0.0<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Clones:&nbsp;&nbsp; &nbsp;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CRTC:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CRTCs:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Transform:&nbsp; 1.000000 0.000000 0.000000<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.000000 1.000000 0.000000<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.000000 0.000000 1.000000<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; filter:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; non-desktop: 0<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; supported: 0, 1<br/>
&nbsp; 1920x1080 (0x24) 173.000MHz -HSync +VSync *current +preferred<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; h: width&nbsp; 1920 start 2048 end 2248 total 2576 skew&nbsp;&nbsp;&nbsp; 0 clock&nbsp; 67.16KHz<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v: height 1080 start 1083 end 1088 total 1120&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock&nbsp; 59.96Hz<br/>
XWAYLAND1 connected 1920x1200+0+0 (0x25) normal (normal left inverted right x axis y axis) 520mm x 320mm<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Identifier: 0x23<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Timestamp:&nbsp; 41572<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Subpixel:&nbsp;&nbsp; unknown<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gamma:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.0:1.0:1.0<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Brightness: 0.0<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Clones:&nbsp;&nbsp; &nbsp;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CRTC:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CRTCs:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Transform:&nbsp; 1.000000 0.000000 0.000000<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.000000 1.000000 0.000000<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.000000 0.000000 1.000000<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; filter:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; non-desktop: 0<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; supported: 0, 1<br/>
&nbsp; 1920x1200 (0x25) 193.250MHz -HSync +VSync *current +preferred<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; h: width&nbsp; 1920 start 2056 end 2256 total 2592 skew&nbsp;&nbsp;&nbsp; 0 clock&nbsp; 74.56KHz<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v: height 1200 start 1203 end 1209 total 1245&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock&nbsp; 59.88Hz</div>

<div>&nbsp;</div>

<div>When switching to VGA cable, the only changes are in the gamma, brightness, and Identifier values. I don&#39;t find anything which refers to DP or a port. What else can I do to narrow it down?</div>
</div>
</div>

<div class="signature">--<br/>
Harald Harders<br/>
harald.harders@gmx.de</div>

<div>&nbsp;
<div>&nbsp;
<div name="quote" style="margin:10px 5px 5px 10px; padding: 10px 0 10px 10px; border-left:2px solid #C3D9E5; word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">
<div style="margin:0 0 10px 0;"><b>Gesendet:</b>&nbsp;Dienstag, 18. Juni 2019 um 22:30 Uhr<br/>
<b>Von:</b>&nbsp;&quot;Ilia Mirkin&quot; &lt;imirkin@alum.mit.edu&gt;<br/>
<b>An:</b>&nbsp;&quot;Harald Harders&quot; &lt;harald.harders@gmx.de&gt;<br/>
<b>Cc:</b>&nbsp;nouveau &lt;nouveau@lists.freedesktop.org&gt;<br/>
<b>Betreff:</b>&nbsp;Re: [Nouveau] Instable graphics with GeForce GT 730M, especially on external monitor</div>

<div name="quoted-content">What&#39;s the connector name when you plug in via, say, DVI? Is it &quot;DP-1&quot;<br/>
or is it &quot;DVI-D-1&quot; or whatever? You should be able to see the name in<br/>
&#39;xrandr&#39;. Unfortunately I don&#39;t know how the T440p is wired, there are<br/>
a few ways it could go. In some cases, even the &quot;VGA&quot; port is secretly<br/>
a DP -&gt; VGA active adapter inside the laptop.<br/>
<br/>
Basically I&#39;m trying to rule DisplayPort as a source of potential issues.<br/>
<br/>
-ilia<br/>
<br/>
On Tue, Jun 18, 2019 at 4:12 PM Harald Harders &lt;harald.harders@gmx.de&gt; wrote:<br/>
&gt;<br/>
&gt; Hi Ilia,<br/>
&gt;<br/>
&gt; First I had upgraded from OpenSUSE 13.2 (where it worked) to OpenSUSE Leap 15.1. After having the same issue I have done a clean new install. The new kernel version is 4.12.14, as you suspected. In OpenSUSE, I suspect it was version 3.16.7. Unfortunately, I cannot find out anymore which nouveau version I have used before. I have a file backup of the old installation. Can I find out which nouveau version I had before?<br/>
&gt;<br/>
&gt; During all my attempts, I have also installed Ubuntu 18.04.2 with the same strange behaviour. I guess this was the 4.18 kernel version?<br/>
&gt; Do you know which distrubtion already uses a 5.0 kernel? I will try a live system, then.<br/>
&gt;<br/>
&gt; I have a docking station with 4 monitor ports: VGA, DVI, HDMI, Displayport. And my laptop has VGA and Mini-Displayport. My monitor (Fujitsu P24W-7 LED) has VGA, DVI, HDMI, and Displayport.<br/>
&gt; I have tried DVI-&gt;DVI and DisplayPort-&gt;HDMI cable on the docking station (I don&#39;t hav. In one of my attempts, I have connected the screen via analog VGA cable directly to the computer. The same effect resulted. Thus, I believe the docking station and digital connection to the monitor are not part of the problem.<br/>
&gt;<br/>
&gt; Best regards<br/>
&gt; Harald<br/>
&gt;<br/>
&gt; PS: I guess sending to the mailing list and omitting your personal mail address is correct, right?<br/>
&gt;<br/>
&gt;<br/>
&gt; Gesendet: Dienstag, 18. Juni 2019 um 21:36 Uhr<br/>
&gt; Von: &quot;Ilia Mirkin&quot; &lt;imirkin@alum.mit.edu&gt;<br/>
&gt; An: &quot;Harald Harders&quot; &lt;harald.harders@gmx.de&gt;<br/>
&gt; Cc: nouveau &lt;nouveau@lists.freedesktop.org&gt;<br/>
&gt; Betreff: Re: [Nouveau] Instable graphics with GeForce GT 730M, especially on external monitor<br/>
&gt; Which kernel did you update from and to? Also, 4.12 is fairly old -<br/>
&gt; can you try like a live usb image of some distro with e.g. a 5.0<br/>
&gt; kernel or something?<br/>
&gt;<br/>
&gt; How do you connect the external screen? Is it like a DP port with an<br/>
&gt; optional dock with a variety of active DP adapters? Or is there a DP++<br/>
&gt; port that you&#39;re plugging a DP &lt;-&gt; HDMI passive adapter into?<br/>
&gt;<br/>
&gt; On Tue, Jun 18, 2019 at 3:28 PM Harald Harders &lt;harald.harders@gmx.de&gt; wrote:<br/>
&gt; &gt;<br/>
&gt; &gt; Dear all,<br/>
&gt; &gt;<br/>
&gt; &gt; I have recently updated my Lenovo T440p with a dual graphics card (Intel Core + GeForce GT 730M) to OpenSUSE Leap 15.1. Since then, the external screen (connected either via VGA, DVI, HDMI, or DisplayPort) has a vertically stretched output which jumps horizontally in high frequency. Whenever touching any settings for the built in display (e.g. by gnome-control-center), also this screen starts incorrect display. Sometimes, however, also the external screen works as expected.<br/>
&gt; &gt;<br/>
&gt; &gt; Installed driver version is (only 2D installed):<br/>
&gt; &gt; xf86-video-nouveau: 1.0.15-lp151.4.1<br/>
&gt; &gt; libvdpau_nouveau: 18.3.2-lp151.22.4<br/>
&gt; &gt; libdrm_nouveau2: 2.4.97-lp151.1.1<br/>
&gt; &gt;<br/>
&gt; &gt; I have followed your instructions on the TroubleShooting page, No signs for NVIDIA drivers running, everything appears to be okay. Minimal xorg.conf did not work, screenshots are okay.Unfortunately, I failed in installing the most recent nouveau version (neither /lib/modules/4.12.14-lp151.28.4-default/source nor /lib/modules/4.12.14-lp151.28.4-default/build are present on my computer even though I have installed the Kernel sources). The installed version is still quite new, isn&#39;t it?<br/>
&gt; &gt;<br/>
&gt; &gt; I suspect that I might have the issue you describe under &quot;Blank monitor, flicker, snow, or other random live image corruption&quot;. I would like to make sure, however. And since you warn with regards to potential permanent damage, I would like to make sure, first.<br/>
&gt; &gt; Can you confirm that it should be this issue? Or are there any other things I should try first?<br/>
&gt; &gt;<br/>
&gt; &gt; Best regards<br/>
&gt; &gt; Harald<br/>
&gt; &gt;<br/>
&gt; &gt;<br/>
&gt; &gt;<br/>
&gt; &gt;<br/>
&gt; &gt;<br/>
&gt; &gt;<br/>
&gt; &gt;<br/>
&gt; &gt;<br/>
&gt; &gt;<br/>
&gt; &gt; lose:/home/harders/download/nouveau/drm # lspci &#124; grep -i vga<br/>
&gt; &gt; 00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor Integrated Graphics Controller (rev 06)<br/>
&gt; &gt; 02:00.0 VGA compatible controller: NVIDIA Corporation GK208M [GeForce GT 730M] (rev a1)<br/>
&gt; &gt;<br/>
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
</div></div></body></html>

--===============0333807119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0333807119==--
