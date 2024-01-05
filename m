Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0226982EE6C
	for <lists+nouveau@lfdr.de>; Tue, 16 Jan 2024 12:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E55810E4AA;
	Tue, 16 Jan 2024 11:48:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4C510E6AB;
 Fri,  5 Jan 2024 21:19:04 +0000 (UTC)
Received: from [192.168.1.114] (unknown [185.145.125.130])
 by mail.ispras.ru (Postfix) with ESMTPSA id 3F35140737A3;
 Fri,  5 Jan 2024 21:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 3F35140737A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1704489208;
 bh=pGz5BeUn1J1tLUOnuc57+4ifZTNHWxB2x2fBLp9vnFE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qjy0+Z+eEeWLGd73OAA7npgyIBsdSzQogG9Ujge6ZiMDH75iVPWiQ2OuDGRhXrnCi
 zdZZCg9KakFJ9uwPfUPyHpNQPjA/N9mcNujSbe4DwUH8ghvo3nxjIQbrQg4Qa3sQWH
 q5DTuLrHYKxpF7qUt7ZRD7FxSFJH64WiVlyHdOTs=
Subject: Re: [PATCH] therm.c: Adding an array index check before accessing an
 element.
To: Andrey Shumilin <shum.sdl@nppct.ru>, Karol Herbst <kherbst@redhat.com>
References: <20231116063028.35871-1-shum.sdl@nppct.ru>
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
Message-ID: <5be85b32-7339-d306-897e-142332807c9b@ispras.ru>
Date: Fri, 5 Jan 2024 20:50:34 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20231116063028.35871-1-shum.sdl@nppct.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: ru-RU
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 16 Jan 2024 11:47:29 +0000
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
Cc: "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

> Subject: therm.c: Adding an array index check before accessing an element.

As

$ git log --oneline drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
a215721fb64e drm/nouveau/bios/therm: pointers are 32-bit
46484438ab7d drm/nouveau/bios: convert to new-style nvkm_subdev
7f5f518fd70b drm/nouveau/bios: remove object accessor functions
60b29d207179 drm/nouveau/bios: switch to subdev printk macros
9ace404b1098 drm/nouveau/device: include core/device.h automatically for
subdevs/engines
d390b48027f8 drm/nouveau/bios: namespace + nvidia gpu names (no binary
change)
c39f472e9f14 drm/nouveau: remove symlinks, move core/ to nvkm/ (no code
changes)

shows, a better prefix should be
drm/nouveau/bios: or drm/nouveau/bios/therm:
and there should not be a dot at the end.

e.g.
drm/nouveau/bios: avoid invalid memory memory access in
nvbios_therm_fan_parse()


On 16.11.2023 09:30, Andrey Shumilin wrote:
> It is possible to access an element at index -1 if at the first iteration of the loop the result of switch is equal to 0x25
> 


If nvbios_rd08(bios, entry + 0) returns 0x25 before 0x24, buffer
underrun happens as far as &fan->trip[fan->nr_fan_trip - 1] points to
invalid memory.

> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Andrey Shumilin <shum.sdl@nppct.ru>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
> index 5babc5a7c7d5..78387053f214 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
> @@ -180,6 +180,8 @@ nvbios_therm_fan_parse(struct nvkm_bios *bios, struct nvbios_therm_fan *fan)
>  			cur_trip->fan_duty = duty_lut[(value & 0xf000) >> 12];
>  			break;
>  		case 0x25:
> +			if (fan->nr_fan_trip == 0)
> +				fan->nr_fan_trip++;

I would suggest to return -EINVAL if the assumption on valid nr_fan_trip
is failed.


>  			cur_trip = &fan->trip[fan->nr_fan_trip - 1];
>  			cur_trip->fan_duty = value;
>  			break;
> 

--
Alexey
