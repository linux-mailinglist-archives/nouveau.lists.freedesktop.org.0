Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D038F52B660
	for <lists+nouveau@lfdr.de>; Wed, 18 May 2022 11:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143EE10E772;
	Wed, 18 May 2022 09:31:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mailincloud.com (proxy.mailincloud.com [217.182.87.46])
 by gabe.freedesktop.org (Postfix) with ESMTP id B15D710E772
 for <nouveau@lists.freedesktop.org>; Wed, 18 May 2022 09:31:01 +0000 (UTC)
Received: from [10.0.0.11] (91-166-155-32.subs.proxad.net [91.166.155.32])
 by mailincloud.com (Postfix) with ESMTPSA id 73F0421E6F
 for <nouveau@lists.freedesktop.org>; Wed, 18 May 2022 11:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailincloud.com 73F0421E6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailincloud.com;
 s=mail; t=1652866260;
 bh=aJoAhi3QBLpod4oWuYi7dswmAVo2VbSYnBnA8O8MyQo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=rb4fpJ5lfAw5MbQKVDkhXsdl/OcqUYoNtNs5NEUc7rGFo+96k2AHntH5kCzZAUESA
 Kn1Id9KhWHfDTv6OLV9tdln/71JzhvtT1+Cm0ujDFivRHlXOM15F82eR0IDx3Omp8M
 bHIyyAB/txs8gOTdPMo4nbUhcuBJosyqx+c7vqOhNF2tRz6O/G/UIejyiqW8+1C2hY
 kqZT9L2lL5OWXK9HAA7PC0KZEfkAkfa6+Omod+yT+wT4Hdq5esh+yefP3lJd/A+BCI
 Eq+roMob3WDbNPX6HkjMrA/yGGfN2AoZv/o2bOfAAhVP32Mylk8TFRxO80OlhE/lEC
 LYVef6Bv+g7pw==
Message-ID: <f9aaaaf0-8ad2-79a3-3bda-a2812e5748ea@le-bars.net>
Date: Wed, 18 May 2022 11:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: nouveau <nouveau@lists.freedesktop.org>
References: <bdc569d7-ea37-809c-74ab-b34158ca645c@le-bars.net>
 <CACO55tuAvanHF87xaC8WRiyO5BnHPVn3bxAc+Pix4+yOGv++Rg@mail.gmail.com>
From: Yoann LE BARS <yoann@le-bars.net>
In-Reply-To: <CACO55tuAvanHF87xaC8WRiyO5BnHPVn3bxAc+Pix4+yOGv++Rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] nVidia has freed some modules,
 what to expect for Nouveau
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


Hello, everybody out there!

On 2022/05/12 2:08 PM, Karol Herbst wrote:
> all the code can be used to figure out the more annoying bugs inside
> the driver. And the firmware is redistributable, so we can make use of
> it for performance and the likes.

	Good! Thank you for this information.

	I have also found this, which is quite explanatory:

https://blogs.gnome.org/uraeus/2022/05/11/why-is-the-open-source-driver-release-from-nvidia-so-important-for-linux/

	Best regards.

-- 
Yoann LE BARS
https://le-bars.net/yoann/
