Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 207B16244C6
	for <lists+nouveau@lfdr.de>; Thu, 10 Nov 2022 15:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2FD10E83C;
	Thu, 10 Nov 2022 14:52:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C444F10E83C
 for <nouveau@lists.freedesktop.org>; Thu, 10 Nov 2022 14:52:00 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gcfxn-nouveau@m.gmane-mx.org>) id 1ot8uL-0005bx-Qe
 for nouveau@lists.freedesktop.org; Thu, 10 Nov 2022 15:51:57 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: nouveau@lists.freedesktop.org
From: Timothy Madden <terminatorul@gmail.com>
Date: Thu, 10 Nov 2022 16:51:50 +0200
Message-ID: <tkj366$kaf$1@ciao.gmane.io>
References: <tk6dm1$jsm$1@ciao.gmane.io>
 <CACO55tuPJy3GfYOyNkV=5aLLWrNQx=7DVZ3R6yCxd_X0+wUUNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
In-Reply-To: <CACO55tuPJy3GfYOyNkV=5aLLWrNQx=7DVZ3R6yCxd_X0+wUUNg@mail.gmail.com>
Subject: Re: [Nouveau] Fans ramping up randomly when idle
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

On 11/10/22 01:44, Karol Herbst wrote:
>> [   10.776280] nouveau 0000:0b:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none
>> [ 3275.720190] nouveau 0000:0b:00.0: therm: temperature (90 C) hit the 'fanboost' threshold
> 
> one thing which might help to figure out what's going on would be to
> know the output of `lspci -t` and `grep .
> /sys/bus/pci/devices/*/power/control`

localhost:/home/timothy # lspci -t
-[0000:00]-+-00.0
            +-00.2
            +-01.0
            +-01.1-[01]----00.0
            +-01.3-[02-09]--+-00.0
            |               +-00.1
            |               \-00.2-[03-09]--+-00.0-[04]--
            |                               +-01.0-[05]--
            |                               +-02.0-[06]----00.0
            |                               +-03.0-[07]----00.0
            |                               +-04.0-[08]--
            |                               \-09.0-[09]----00.0
            +-02.0
            +-03.0
            +-03.1-[0a]--+-00.0
            |            \-00.1
            +-03.2-[0b]--+-00.0
            |            +-00.1
            |            +-00.2
            |            \-00.3
            +-04.0
            +-07.0
            +-07.1-[0c]--+-00.0
            |            +-00.2
            |            \-00.3
            +-08.0
            +-08.1-[0d]--+-00.0
            |            +-00.2
            |            \-00.3
            +-14.0
            +-14.3
            +-18.0
            +-18.1
            +-18.2
            +-18.3
            +-18.4
            +-18.5
            +-18.6
            \-18.7
localhost:/home/timothy # grep . /sys/bus/pci/devices/*/power/control
/sys/bus/pci/devices/0000:00:00.0/power/control:on
/sys/bus/pci/devices/0000:00:00.2/power/control:on
/sys/bus/pci/devices/0000:00:01.0/power/control:on
/sys/bus/pci/devices/0000:00:01.1/power/control:auto
/sys/bus/pci/devices/0000:00:01.3/power/control:auto
/sys/bus/pci/devices/0000:00:02.0/power/control:on
/sys/bus/pci/devices/0000:00:03.0/power/control:on
/sys/bus/pci/devices/0000:00:03.1/power/control:auto
/sys/bus/pci/devices/0000:00:03.2/power/control:auto
/sys/bus/pci/devices/0000:00:04.0/power/control:on
/sys/bus/pci/devices/0000:00:07.0/power/control:on
/sys/bus/pci/devices/0000:00:07.1/power/control:auto
/sys/bus/pci/devices/0000:00:08.0/power/control:on
/sys/bus/pci/devices/0000:00:08.1/power/control:auto
/sys/bus/pci/devices/0000:00:14.0/power/control:on
/sys/bus/pci/devices/0000:00:14.3/power/control:on
/sys/bus/pci/devices/0000:00:18.0/power/control:on
/sys/bus/pci/devices/0000:00:18.1/power/control:on
/sys/bus/pci/devices/0000:00:18.2/power/control:on
/sys/bus/pci/devices/0000:00:18.3/power/control:on
/sys/bus/pci/devices/0000:00:18.4/power/control:on
/sys/bus/pci/devices/0000:00:18.5/power/control:on
/sys/bus/pci/devices/0000:00:18.6/power/control:on
/sys/bus/pci/devices/0000:00:18.7/power/control:on
/sys/bus/pci/devices/0000:01:00.0/power/control:on
/sys/bus/pci/devices/0000:02:00.0/power/control:on
/sys/bus/pci/devices/0000:02:00.1/power/control:on
/sys/bus/pci/devices/0000:02:00.2/power/control:auto
/sys/bus/pci/devices/0000:03:00.0/power/control:auto
/sys/bus/pci/devices/0000:03:01.0/power/control:auto
/sys/bus/pci/devices/0000:03:02.0/power/control:auto
/sys/bus/pci/devices/0000:03:03.0/power/control:auto
/sys/bus/pci/devices/0000:03:04.0/power/control:auto
/sys/bus/pci/devices/0000:03:09.0/power/control:auto
/sys/bus/pci/devices/0000:06:00.0/power/control:auto
/sys/bus/pci/devices/0000:07:00.0/power/control:on
/sys/bus/pci/devices/0000:09:00.0/power/control:on
/sys/bus/pci/devices/0000:0a:00.0/power/control:auto
/sys/bus/pci/devices/0000:0a:00.1/power/control:auto
/sys/bus/pci/devices/0000:0b:00.0/power/control:on
/sys/bus/pci/devices/0000:0b:00.1/power/control:auto
/sys/bus/pci/devices/0000:0b:00.2/power/control:auto
/sys/bus/pci/devices/0000:0b:00.3/power/control:auto
/sys/bus/pci/devices/0000:0c:00.0/power/control:on
/sys/bus/pci/devices/0000:0c:00.2/power/control:on
/sys/bus/pci/devices/0000:0c:00.3/power/control:on
/sys/bus/pci/devices/0000:0d:00.0/power/control:on
/sys/bus/pci/devices/0000:0d:00.2/power/control:on
/sys/bus/pci/devices/0000:0d:00.3/power/control:auto
localhost:/home/timothy #


