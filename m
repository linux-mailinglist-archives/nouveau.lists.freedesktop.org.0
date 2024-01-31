Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89119844866
	for <lists+nouveau@lfdr.de>; Wed, 31 Jan 2024 21:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044DD10E28F;
	Wed, 31 Jan 2024 20:06:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE1A10E28F
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jan 2024 20:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1706731567; x=1707336367; i=linuxuser330250@gmx.net;
 bh=c3ydkZouiPJ6UWktyOVo11Fplj+0ueiqjXRK+8GimwY=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=q+CLbHQHfbSDWddSPCLLwm1/sZugD0w3MqrdZF3mO+kSUsdlhAv8JXxLOZS2fbqH
 eTQ1JwOgzTJbDU+DdxrypzjU+coGRtjJkMDEWPnH3/JLYsy07zh7LWe2b+42AUAIM
 Q+0IgIrfwN6tOUEh35VV07yb2kufVRzZ4h06xM+a3kOTmjPcSNhqab4m8Bh7gsSzL
 Qos383sensVwaTJDnaxBA1ATWIKxeiLXTm5YZQA3BhZ1P35pvb7/WI0wTBEl4oq4f
 dLZvPBlo+gmFeB7FkwgwpcQfKP2VufWGExvQSiPu3FYVxQLRFRAohzT35T2M8eS4n
 MFP15fHpKwGO9i1Jrg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.45.71] ([90.146.247.13]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MplXz-1qhtKM0VTx-00q8yd; Wed, 31
 Jan 2024 21:06:07 +0100
Message-ID: <f5e55792-522d-441f-89d2-0bfddc4f8515@gmx.net>
Date: Wed, 31 Jan 2024 21:06:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Nouveau] Thinkpad P17 gen 2 kernel 6.4 and 6.6 lack of support
 for nvidia GA104GLM [RTX A5000 Mobile] and missing module firmware
Content-Language: de-AT, en-US
To: marc_nouveau@merlins.org, nouveau@lists.freedesktop.org
References: <20231202171326.GB24486@merlins.org>
From: Linux User #330250 <linuxuser330250@gmx.net>
In-Reply-To: <20231202171326.GB24486@merlins.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qhI75h+UNUmmg3HTJYA5Sg3gviuBLZivV6l0n/9O9Ms1oydzsEi
 n85xCwOyNPruBmZIjp4qXJ82KFRaWrBv5S/kSYIBMo1zFnebPlzsnIneaJKO2tRS+CrakDj
 XFB6ur3abHbS7t6u/UdfeTtGsIDs0zBwkU1tya6/Cb2MhU5Lcv0TU6T2BoLrbSNZPZmXM8n
 4OzcmY3uvYznh9/o20Q7A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nZuwqSmd9QQ=;0KUpKWLX+ZMB4O9z5cAxGjkzO/V
 mOg/8WmIBb5SIVNcUmCYyLQaWV3cLu95o3CGSt55CZsrdud2kKuv0aBIWhcEfG5QiD9oQcU5x
 qvIfIb8mL49vhrg+LR9umLqfj1sh7//mzIUQVO9VKprWw0AHfcYFmRyCU5SKfHt4J9chSBXpG
 r14NkfiyE9J61IE4Z/lhi45WVFuhayQqe+G81e7GIWpKcDrAzPQ2uhuDW5CBAZtLmhBbK+QX7
 KufUzsqOnX13vhdpklkpcxdBYdH/kdX6dAgiSkCB/eFdMXdVhDyUkt7ez0zFuERNJxsarU6c9
 MREVaIfGBa55PigN+FCargBWsh3+jAj8OvpR0zcHEzjRtGz1C6oiV1iMZFDUwjTKnp/sEc91V
 7+8SPf+BGuL0YOXeE56L1MTmkApydJN2XGS1oka5GmkQ2z3VDCAAVFC7+LaO8RJz18fnMIU2Y
 QByAUtxvFK/0p0Tvyza3BWgiDNTqievqn4vYj2pSvzzFSrRDJ+h0B+TRReKTetX8gzwuJeOQs
 QlHP0SZVV+1mCoLGBVjBGBQPnIo3nxbM/Dg7RIaiLTX9QYhnLnzW+9q/bMxFJ3H1pzu2YnwIG
 EHB/VRhsVDbLAkCsKOEni5DS2S06BnXo/ZHP19t3LyqNlcPYg9tJFKKxWxoJi8jSYP962M0Q2
 1L+/DHGU7uXIPefQnpXOwb+Wo+JR1za8T/kLRlpxgroBVE/ZYzFFxB6hgRnW6E16m7hy8/chj
 8vJVpQy/QAtJQ6szSy3vVzNiiPKCus5Nf0DlAcvhjYAIHiVyCLzfwUROdRRrfnVVyyNIGAdMw
 vt4gMhyrgiQqmmi1YAeK4320CYSMizwmum3b8QQllfJeM=
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 12/02/23 Marc MERLIN wrote:
> Howdy,

Howdy!

> I'm trying a Thnkpad P17 gen2, the last thinkpad that still comes in 17"
> 4K (newer ones are 16" only, so I'm looking for other worthwhile linux
> laptops with 17" or bigger LCD that also does 4K, the alienware I saw
> was 18" but not 4K)
>
> Unfortunately I seem to need the nouveau driver to turn off the nvidia
> chip I don't plan on using (intel graphics is fine for me), and bios
> only allows 'bybrid' or nvidia only)
> On my P73, nouveau never really worked in the 3 years I've had it, but
> it could at least turn off the nvidia chip. On P17gen2 it does not seem
> to be able to do so.

At the moment you'd have to use the proprietary Nvidia driver for
graphics support. But there are, and have been for a long time, ways to
disable the additional dedicated graphics device completely and save
power, which is nice thing on a laptop...

> sauron:~# lspci | grep VGA
> 00:02.0 VGA compatible controller: Intel Corporation Tiger Lake-H GT1 [U=
HD Graphics] (rev 01)
> 01:00.0 VGA compatible controller: NVIDIA Corporation GA104GLM [RTX A500=
0 Mobile] (rev a1)

Note the Nvidia card's PCI address is 01:00.0...

> What is the next recommended step?

STEP #1: disable nouveau by blacklisting the module.

There's more than one way to do this:

* Add it to /etc/modprobe.d/<someconfigfilename>.conf
E.g. /etc/modprobe.d/blacklist-nouveau.conf, run in a root shell (if the
file doesn't already exist!):
echo "blacklist nouveau" > /etc/modprobe.d/blacklist-nouveau.conf

* Add a kernel command line parameter: modprobe.blacklist=3Dnouveau
How you do this depends on which Linux (distribution) you're running.
E.g. GRUB's command line may be used, if GRUB /is/ used, or dracut and
so on...

STEP #2: you could power down the PCI device (only after you've disabled
the driver in step #1).

Try it out first by disabling the PCI device you noted above on a
running system (as root!), e.g. like this:

echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/remove

If that works, you'd do something like adding a new udev rule in e.g.
/etc/udev/rules.d/00-remove-nvidia.rules with contents of the sort:
ACTION=3D=3D"add", SUBSYSTEM=3D=3D"pci", ATTR{vendor}=3D=3D"0x10de",
ATTR{class}=3D=3D"0x03[0-9]*", ATTR{power/control}=3D"auto", ATTR{remove}=
=3D"1"

Take a full example from the Arch Wiki:
https://wiki.archlinux.org/title/Hybrid_graphics

Other resouces:
https://github.com/bayasdev/nvidia-gpu-off
https://unix.stackexchange.com/questions/702774/how-to-disable-pcie-device=
-at-boot

> Thanks,
> Marc

Welcome! Hope this helps, and I also hope it's not too late. I just saw
your posting and thought, better late than never...
Linux User #330250
