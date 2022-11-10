Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CFC6244F5
	for <lists+nouveau@lfdr.de>; Thu, 10 Nov 2022 16:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8345510E161;
	Thu, 10 Nov 2022 15:01:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE1510E161
 for <nouveau@lists.freedesktop.org>; Thu, 10 Nov 2022 15:01:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gcfxn-nouveau@m.gmane-mx.org>) id 1ot93D-0007OH-TT
 for nouveau@lists.freedesktop.org; Thu, 10 Nov 2022 16:01:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: nouveau@lists.freedesktop.org
From: Timothy Madden <terminatorul@gmail.com>
Date: Thu, 10 Nov 2022 17:01:00 +0200
Message-ID: <3748590b-2863-c998-d8a3-eabd2f65c749@gmail.com>
References: <tk6dm1$jsm$1@ciao.gmane.io>
 <CACO55tt5QTM=Amm560pBoDyKdib+YL77-d3rArhi0AmtLOdPMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
In-Reply-To: <CACO55tt5QTM=Amm560pBoDyKdib+YL77-d3rArhi0AmtLOdPMg@mail.gmail.com>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 Ajay Gupta <ajayg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 11/7/22 13:41, Karol Herbst wrote:
> On Sat, Nov 5, 2022 at 8:36 PM Timothy Madden <terminatorul@gmail.com> wrote:
>>
>> Hello
>>
>> My Msi Gaming X Trio 2080 Ti randomly ramps up the fans with no way to recover
>> (I have to reboot) even when the card is idle or is only showing the desktop.
>>
>> This issue happens even when the card is not connected to a monitor.
>>
>> My dmesg output from nouveau is included below, I think the last 2 lines are
>> the relevant ones:
>> [ 9426.768449] nvidia-gpu 0000:0b:00.3: Unable to change power state from D3hot to D0, device inaccessible
>> [ 9427.889387] nvidia-gpu 0000:0b:00.3: i2c timeout error ffffffff
>>
>>
> 
> that's kind of odd, because "nvidia-gpu" implies you might have
> multiple drivers here? Though .3 should be some USB/UCSI or something
> related sub device on the GPU and Nvidia might have messed it up
> (adding the maintainer of the i2c-nvidia-gpu driver on CC).

Is there a way to check for multiple drivers ? I have openSUSE 
Tumbleweed at version 2022-11-08, and I did not install proprietary or 
other NVIDIA drivers.

> 
> Anyway, the fans are probably controlled by the Laptops firmware and

I meant the fans on the graphics card. No laptop here, my desktop 
computer has a Gigabyte X470 Aorus Gaming 5 WiFi motherboard with the 
latest UEFI from gigabyte web site.

> maybe something goes wrong with the runtime power management feature
> here, which as far as I can tell works on the Nouveau side, but
> i2c-nvidia-gpu might prevent the GPU from powering done and so causing
> more heat. It's also interesting that the GPU runs that hot, but given
> we don't support changing power states yet in Nouveau (still WIP
> wiring up the new released firmware from nvidia), not much we can do
> while the GPU is actually in use at this point.
> 
>>	

