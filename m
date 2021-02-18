Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9155331E5E7
	for <lists+nouveau@lfdr.de>; Thu, 18 Feb 2021 06:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4686E25A;
	Thu, 18 Feb 2021 05:48:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82506E21C
 for <nouveau@lists.freedesktop.org>; Thu, 18 Feb 2021 03:40:38 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id s24so639205iob.6
 for <nouveau@lists.freedesktop.org>; Wed, 17 Feb 2021 19:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ringerc-id-au.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=s0rw69a+cUuuhGi9O45ymfV2zPF7FW9u6hYo7awwirM=;
 b=J8zaDqJwUwOJo6/RWTMUmIHQaR4BXHJtt5Er5pNadx0QW80c0Cetlm+nF6K9ktFbwD
 kS6Tc8kmkmF443i8HJdv+4qlXBMZgjINdJj/MXdr4OKC4UJGgEpqh1R0d6HJfQqGnm7I
 ct5LLCOc6BLVWcMUb5UKZZK0PmyLFsKAGA75Ul8q2VXOcKmqWqeDIs2DL2L9fBh5h4U2
 sFEWB8jD0bNgL/bBboUnYRwpxazglv3BGYfRAb2ClB/bJj3vYkNYJPm48cz82bTPB61U
 wwu4mp/y2Osss0+71pKRsfoMxwcqZRJTCiBMD4MHp7NG9RWh5jkrMcJXLXo4CbHe1oA9
 ISyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=s0rw69a+cUuuhGi9O45ymfV2zPF7FW9u6hYo7awwirM=;
 b=HipbG0946hBM54d/A9/b2ZRlsYgnH+gNdOp+LEP0f4VPow0tVVo+COwmJwnfHPA4Ul
 pxMQmnMrTlA2wSdW45yJS5VCOnb7aWO6nKpGZKVHuQEKvtCicEI8KzbtyumAgxOH3wqe
 dGeuxr8PffAZ7aMRbS1dlNnDJmJ5qlsOnvO5R+NGOzQffd7W/pG9zVd+mTWLWgYb2WUF
 fFmLyVhaPm9SeelcTyynwH7Fb9eX0i29fb5mQ66zlQOE0GptwlsDBi+prJFxuIp/MMqv
 WhMDjBgP3j8SR8g4rmNuBr2EVVDfjaFTpcww/i/SwA4o6BKqKLU2NXV/6kerpal631FE
 yY0A==
X-Gm-Message-State: AOAM532NqqmMwkCz9DatUbFbIAAGKMsZtFJx1E6Ag2PEie6a9rzQw1XH
 f/KU636ehjNPSdhQEE9fYEQXousjocLVbwASzAXTJ0ldOVgQ3g==
X-Google-Smtp-Source: ABdhPJwbxYTxon6EEo1Z+sBBxJ/AoHX1v/bLcpK36kH5LZF0H/GVXGFc4NnsQYGNWXqAHD95qL8F7K6lUeAys9JRXrE=
X-Received: by 2002:a6b:7d42:: with SMTP id d2mr2026205ioq.176.1613619637808; 
 Wed, 17 Feb 2021 19:40:37 -0800 (PST)
MIME-Version: 1.0
References: <CAD2md3HfNcL=S83BkVN_DpUnhKJpRAkPcg=ds4uFb_uTLHF6kA@mail.gmail.com>
In-Reply-To: <CAD2md3HfNcL=S83BkVN_DpUnhKJpRAkPcg=ds4uFb_uTLHF6kA@mail.gmail.com>
From: Craig Ringer <ringerc@ringerc.id.au>
Date: Thu, 18 Feb 2021 11:40:26 +0800
Message-ID: <CAD2md3HWx-Pc+B6JOuDy1APhAHa=T=TD_4PrRA7NUVurb39YeQ@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 18 Feb 2021 05:48:13 +0000
Subject: Re: [Nouveau] Optimus HDMI hotplug fails with "DRM: Dropped ACPI
 reprobe event due to RPM error: -22"
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1015566670=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1015566670==
Content-Type: multipart/alternative; boundary="00000000000050847205bb94194c"

--00000000000050847205bb94194c
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Feb 2021 at 11:06, Craig Ringer <ringerc@ringerc.id.au> wrote:

> Hi all
>
> I'm trying to get HDMI hotplug working on my Lenovo T15g laptop with
> Optimus graphics. HDMI works when plugged in at boot, but does not work
> when hotplugged after boot, or when hot-unplugged then re-plugged. The
> external display is not detected, its status remains 'disconnected' in
> sysfs, and the display stays in what looks like DPMS-off state.
> [snip]
> I'll attach a detailed lspci, bigger excerpts from demesg, etc in a
> followup to make sure I don't upset any mail filter.
>

Detailed PCI info and trimmed dmesg uploaded to a GDrive since I don't
really want to send all that to the whole list. Files here:

https://drive.google.com/drive/folders/1oE3ow7d8N6npDNbL8vqHYjbAvvJCUcPN?usp=sharing

Contains:

$ sudo lspci -vvvvnnnnPPq | sed '/Device Serial Number/d' > pci.list

$ sudo dmesg | egrep -v
'e1000e|nvme|BTRFS|audit:|SELinux:|systemd\[1\]|thunderbolt|cfg80211|WiFi|Bluetooth|battery|iwlwifi|uvcvideo|usbcore|zram|iTCO_wdt|snd_hda_intel|squashfs|EXT4-fs|iSCSI|wlp0s20f3|IPv6|\<bridge\>|\<tun\>|virbr0|rfkill|nf_conntrack|psmouse'
| sed 's/SerialNumber.*$/SerialNumber REDACTED/' > dmesg.out

$ sudo dmidecode | sed '/Serial Number:/d;/Asset Tag/d' > dmi.dump

$ sudo cat /sys/kernel/debug/vgaswitcheroo/switch
0:DIS: :DynOff:0000:01:00.0
1:IGD:+:Pwr:0000:00:02.0
2:DIS-Audio: :DynOff:0000:01:00.1

I can provide raw or decompiled ACPI DSDT and SSDTs on request, as well as
kernel logs with higher log levels, a nouveau module debug string, info
from /sys/kernel/debug, 'perf' runs, etc.

There's also some nouveau info in /sys/kernel/debug/dri/1 .

Also, I note that

    echo 'on' > /sys/kernel/debug/dri/1/HDMI-A-1/force

does not appear to have any effect when the display is plugged in and
turned on, but not being detected by nouveau. Also true for other ports
DP-1, DP-2, DP-3, eDP-2.

-- 
Craig Ringer

--00000000000050847205bb94194c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, 18 Feb 2021 at 11:06, Craig Ringer &lt;<a href=3D"=
mailto:ringerc@ringerc.id.au">ringerc@ringerc.id.au</a>&gt; wrote:<br><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div>Hi all</div><div><br></div><div>I&#39;m trying to get HD=
MI hotplug working on my Lenovo T15g laptop with Optimus graphics. HDMI wor=
ks when plugged in at boot, but does not work when hotplugged after boot, o=
r when hot-unplugged then re-plugged. The external display is not detected,=
 its status remains &#39;disconnected&#39; in sysfs, and the display stays =
in what looks like DPMS-off state.<br></div>[snip]<br></div><div dir=3D"ltr=
"><div>I&#39;ll attach a detailed lspci, bigger excerpts from demesg, etc i=
n a followup to make sure I don&#39;t upset any mail filter.<br></div></div=
></blockquote><div><br></div><div>Detailed PCI info and trimmed dmesg uploa=
ded to a GDrive since I don&#39;t really want to send all that to the whole=
 list. Files here:</div><div><br></div><div><a href=3D"https://drive.google=
.com/drive/folders/1oE3ow7d8N6npDNbL8vqHYjbAvvJCUcPN?usp=3Dsharing">https:/=
/drive.google.com/drive/folders/1oE3ow7d8N6npDNbL8vqHYjbAvvJCUcPN?usp=3Dsha=
ring</a></div><div><br></div><div>Contains:<br></div><div><br></div><div>$ =
sudo lspci -vvvvnnnnPPq | sed &#39;/Device Serial Number/d&#39; &gt; pci.li=
st</div><div><br></div><div>$ sudo dmesg | egrep -v &#39;e1000e|nvme|BTRFS|=
audit:|SELinux:|systemd\[1\]|thunderbolt|cfg80211|WiFi|Bluetooth|battery|iw=
lwifi|uvcvideo|usbcore|zram|iTCO_wdt|snd_hda_intel|squashfs|EXT4-fs|iSCSI|w=
lp0s20f3|IPv6|\&lt;bridge\&gt;|\&lt;tun\&gt;|virbr0|rfkill|nf_conntrack|psm=
ouse&#39; | sed &#39;s/SerialNumber.*$/SerialNumber REDACTED/&#39; &gt; dme=
sg.out<br></div><div><br></div><div>$ sudo dmidecode | sed &#39;/Serial Num=
ber:/d;/Asset Tag/d&#39; &gt; dmi.dump<br></div><div><br></div><div>$ sudo =
cat /sys/kernel/debug/vgaswitcheroo/switch<br>0:DIS: :DynOff:0000:01:00.0<b=
r>1:IGD:+:Pwr:0000:00:02.0<br>2:DIS-Audio: :DynOff:0000:01:00.1</div><div><=
br></div><div class=3D"gmail_quote">I can provide raw or decompiled ACPI DS=
DT and SSDTs on request, as well as kernel logs with higher log levels, a n=
ouveau module debug string, info from /sys/kernel/debug, &#39;perf&#39; run=
s, etc.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote=
">There&#39;s also some nouveau info in /sys/kernel/debug/dri/1 .</div><div=
 class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Also, I note th=
at</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">=C2=
=A0=C2=A0=C2=A0 echo &#39;on&#39; &gt; /sys/kernel/debug/dri/1/HDMI-A-1/for=
ce</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">doe=
s not appear to have any effect when the display is plugged in and turned o=
n, but not being detected by nouveau. Also true for other ports DP-1, DP-2,=
 DP-3, eDP-2.<br></div><div class=3D"gmail_quote"><div><br></div></div></di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><=
div>Craig Ringer</div></div></div></div></div>

--00000000000050847205bb94194c--

--===============1015566670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1015566670==--
