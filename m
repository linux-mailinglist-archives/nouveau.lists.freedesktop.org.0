Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A644AB7E
	for <lists+nouveau@lfdr.de>; Tue, 18 Jun 2019 22:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351A36E237;
	Tue, 18 Jun 2019 20:12:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538AF6E237
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2019 20:12:51 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [92.201.122.123] ([92.201.122.123]) by web-mail.gmx.net
 (3c-app-gmx-bs22.server.lan [172.19.170.74]) (via HTTP); Tue, 18 Jun 2019
 22:12:47 +0200
MIME-Version: 1.0
Message-ID: <trinity-1a0b5a21-eb2a-4e86-81ce-5c34a2831c44-1560888767918@3c-app-gmx-bs22>
From: "Harald Harders" <harald.harders@gmx.de>
To: nouveau <nouveau@lists.freedesktop.org>
Date: Tue, 18 Jun 2019 22:12:47 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAKb7UvifuLNe_Nq+7oGHTzgmo4a3mQ1kg0QX-kKfdABB8Ok_Hg@mail.gmail.com>
References: <trinity-60f06d18-ea3c-49a9-8a25-d6aa7f233436-1560886110718@3c-app-gmx-bs22>
 <CAKb7UvifuLNe_Nq+7oGHTzgmo4a3mQ1kg0QX-kKfdABB8Ok_Hg@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:QhwprRzGA5IRquKjtq/+RXfkT6hnAh434etTFe3ouSVqjz5zjbuY8tkQ4ef47db+jinUG
 TwEXroa8ojbfF6sISfoO7vjo4mu2G83aKAvVwn1Mr9+f+HKx/Pb/kcYZLLSH6UdWFH37B+ED9mIp
 gEWdOd8EQcmiI9pyD8AG9SrGh/pZDlH3AMEFA8YHTKQNxBi2mVhZvJlr3Xmdf8BV+qY1iNs9T4ec
 AtC8FCX7r+7TRWBmxrQktGZPPSRZjOE5C3fwt/4c64qIKj1lePeL1rL3ZLyyqQsBl6Ji/5+5DAtw
 Ow=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OtwoX+B6/qo=:yDel6QkbP7ySeT2VVh/Xvd
 b02y6DOInW6dy3HMj1PzsrqsaD9ROPYefcAj2HD3rDROCzW21rnRi4MnDQRgFHlAG2DuXN17B
 AbOiSi/aN0OxE2uZr6m5KndS6nJz/jlioF7UJ0CHn3nG7DpC5Oe4vvAKik92WxxZX80htdToh
 TrctR8gpvyT/ImHm/vymhZAnPqiw1aidYPfSu53/YSTCDwMXDcaBIX2IUroGQ50h/oMlPVuxw
 x0vSSYxCJyItRhTQRaViV2qlngRG85DwNLBDEeXbzvTdA+C0ArYhhHGelZVLXIFyC9ZFLo5PN
 FqxmI1tbGXhVSBFoNQIkWwQfQ+mdK/gAjAOJQ8EmBrytiAcfeabyvn+SlzHhcbfG7xYX4wVS6
 b6oHxe9sfvPXSRJHD3kVcORvIRIcScVl/OaKG6aejbrU7wbNwyMsbav9YMW0r5UdiAEGLoQvh
 17/LvTY4T5AIsEv9pM/3HZHFL1z1UqvlTG0M+Zlmk8natUtENgJvodPs93PXd+qQsBP9OoLbX
 CQe19ecvW5lprWCdrNRtkgluwCF3pA5l0FXorUDKwmHJvHJER9cK55IaX++O3EMANusFek0lo
 3TH2TAXBFE/NuIzGtSP+DHHjuCokXKq4AcXrgUQuwi7fZ0JhzpdDWBCw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1560888768;
 bh=Dkt1w5r7p2UCtGXE1sOrSUwGMk2goA0QMKVfAMqX7xY=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=PUbaEdXPeOrBuKoIkSUTQBwlY/hQYZgEs4MrlwwftY0X7eVWHxHcE9RXIQCaVZnOw
 2CBh03Zh5iO7iPzJ+aAzxwxqMas/CO3CvORiOHm95lbdEh1xRVRzugJd2u3hKJQEKG
 KLx1mlvevoyxceBVJF/VF6dzWodkiicJp6eAwZ0s=
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
Content-Type: multipart/mixed; boundary="===============1202199696=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1202199696==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>Hi Ilia,</div>

<div>&nbsp;</div>

<div>First I had upgraded from OpenSUSE 13.2 (where it worked) to OpenSUSE Leap 15.1. After having the same issue I have done a clean new install. The new kernel version is 4.12.14, as you suspected. In OpenSUSE, I suspect it was version 3.16.7. Unfortunately, I cannot find out anymore which nouveau version I have used before. I have a file backup of the old installation. Can I find out which nouveau version I had before?</div>

<div>&nbsp;</div>

<div>During all my attempts, I have also installed Ubuntu 18.04.2 with the same strange behaviour. I guess this was the 4.18 kernel version?</div>

<div>Do you know which distrubtion already uses a 5.0 kernel? I will try a live system, then.</div>

<div>&nbsp;</div>

<div>I have a docking station with 4 monitor ports: VGA, DVI, HDMI, Displayport. And my laptop has VGA and Mini-Displayport. My monitor (Fujitsu P24W-7 LED) has VGA, DVI, HDMI, and Displayport.</div>

<div>I have tried&nbsp; DVI-&gt;DVI and DisplayPort-&gt;HDMI cable on the docking station (I don&#39;t hav. In one of my attempts, I have connected the screen via analog VGA cable directly to the computer. The same effect resulted. Thus, I believe the docking station and digital connection to the monitor are not part of the problem.</div>

<div>&nbsp;</div>

<div>Best regards</div>

<div>Harald</div>

<div>&nbsp;</div>

<div>PS: I guess sending to the mailing list and omitting your personal mail address is correct, right?</div>

<div>&nbsp;
<div>
<div>&nbsp;
<div style="margin: 10.0px 5.0px 5.0px 10.0px;padding: 10.0px 0 10.0px 10.0px;border-left: 2.0px solid rgb(195,217,229);">
<div style="margin: 0 0 10.0px 0;"><b>Gesendet:</b>&nbsp;Dienstag, 18. Juni 2019 um 21:36 Uhr<br/>
<b>Von:</b>&nbsp;&quot;Ilia Mirkin&quot; &lt;imirkin@alum.mit.edu&gt;<br/>
<b>An:</b>&nbsp;&quot;Harald Harders&quot; &lt;harald.harders@gmx.de&gt;<br/>
<b>Cc:</b>&nbsp;nouveau &lt;nouveau@lists.freedesktop.org&gt;<br/>
<b>Betreff:</b>&nbsp;Re: [Nouveau] Instable graphics with GeForce GT 730M, especially on external monitor</div>

<div>Which kernel did you update from and to? Also, 4.12 is fairly old -<br/>
can you try like a live usb image of some distro with e.g. a 5.0<br/>
kernel or something?<br/>
<br/>
How do you connect the external screen? Is it like a DP port with an<br/>
optional dock with a variety of active DP adapters? Or is there a DP++<br/>
port that you&#39;re plugging a DP &lt;-&gt; HDMI passive adapter into?<br/>
<br/>
On Tue, Jun 18, 2019 at 3:28 PM Harald Harders &lt;harald.harders@gmx.de&gt; wrote:<br/>
&gt;<br/>
&gt; Dear all,<br/>
&gt;<br/>
&gt; I have recently updated my Lenovo T440p with a dual graphics card (Intel Core + GeForce GT 730M) to OpenSUSE Leap 15.1. Since then, the external screen (connected either via VGA, DVI, HDMI, or DisplayPort) has a vertically stretched output which jumps horizontally in high frequency. Whenever touching any settings for the built in display (e.g. by gnome-control-center), also this screen starts incorrect display. Sometimes, however, also the external screen works as expected.<br/>
&gt;<br/>
&gt; Installed driver version is (only 2D installed):<br/>
&gt; xf86-video-nouveau: 1.0.15-lp151.4.1<br/>
&gt; libvdpau_nouveau: 18.3.2-lp151.22.4<br/>
&gt; libdrm_nouveau2: 2.4.97-lp151.1.1<br/>
&gt;<br/>
&gt; I have followed your instructions on the TroubleShooting page, No signs for NVIDIA drivers running, everything appears to be okay. Minimal xorg.conf did not work, screenshots are okay.Unfortunately, I failed in installing the most recent nouveau version (neither /lib/modules/4.12.14-lp151.28.4-default/source nor /lib/modules/4.12.14-lp151.28.4-default/build are present on my computer even though I have installed the Kernel sources). The installed version is still quite new, isn&#39;t it?<br/>
&gt;<br/>
&gt; I suspect that I might have the issue you describe under &quot;Blank monitor, flicker, snow, or other random live image corruption&quot;. I would like to make sure, however. And since you warn with regards to potential permanent damage, I would like to make sure, first.<br/>
&gt; Can you confirm that it should be this issue? Or are there any other things I should try first?<br/>
&gt;<br/>
&gt; Best regards<br/>
&gt; Harald<br/>
&gt;<br/>
&gt;<br/>
&gt;<br/>
&gt;<br/>
&gt;<br/>
&gt;<br/>
&gt;<br/>
&gt;<br/>
&gt;<br/>
&gt; lose:/home/harders/download/nouveau/drm # lspci &#124; grep -i vga<br/>
&gt; 00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor Integrated Graphics Controller (rev 06)<br/>
&gt; 02:00.0 VGA compatible controller: NVIDIA Corporation GK208M [GeForce GT 730M] (rev a1)<br/>
&gt;<br/>
&gt; _______________________________________________<br/>
&gt; Nouveau mailing list<br/>
&gt; Nouveau@lists.freedesktop.org<br/>
&gt; <a href="https://lists.freedesktop.org/mailman/listinfo/nouveau" target="_blank">https://lists.freedesktop.org/mailman/listinfo/nouveau</a></div>
</div>
</div>
</div>
</div></div></body></html>

--===============1202199696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1202199696==--
