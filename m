Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3694D310BC9
	for <lists+nouveau@lfdr.de>; Fri,  5 Feb 2021 14:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979626E3CE;
	Fri,  5 Feb 2021 13:28:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mupuf.org (mupuf.org [167.71.42.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 757246E3CE
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 13:28:48 +0000 (UTC)
Received: from [IPv6:2a01:4b00:86b9:100:9ede:1593:85ef:7eda] (unknown
 [IPv6:2a01:4b00:86b9:100:9ede:1593:85ef:7eda])
 by Neelix.spliet.org (Postfix) with ESMTPSA id 791A16003C
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 13:28:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 Neelix.spliet.org 791A16003C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spliet.org;
 s=default; t=1612531723;
 bh=traCTwy/JAhlfkq/LXGOmmZBI+gmUifdVl2UrFgO2sU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=XrJUkQwMty/ZRUK9l465ReyBeX0gYmw6oGfPHNhZ05vFNvUmPGwaCVQm/TXapepJJ
 eK7O1Z2GtjUvvrUNHQhRL1qzbIY8GLX+XtauaWV/bgKJ9Z7vJD5Kfd+F5Tmb4wfreZ
 q9ZNa4NObSUJknQrW2ZRvNMZqzbmq/PstnreSrxE=
To: nouveau@lists.freedesktop.org
References: <20210205130502.1440514-1-unixbhaskar@gmail.com>
From: Roy Spliet <nouveau@spliet.org>
Message-ID: <51687b2a-db0a-09dd-944e-5fb575a22522@spliet.org>
Date: Fri, 5 Feb 2021 13:28:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205130502.1440514-1-unixbhaskar@gmail.com>
Content-Language: en-GB
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
 URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on Neelix
X-Virus-Scanned: clamav-milter 0.103.0 at Neelix
X-Virus-Status: Clean
Subject: Re: [Nouveau] [PATCH] drivers: drm: nouveau: nvkm: Replace a word
 with a better phonetic word in the file macros.fuc
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Op 05-02-2021 om 13:05 schreef Bhaskar Chowdhury:
> 
> 
> s/fuck/heck/
> 
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc
> index 3737bd27f74e..1407a1b16d95 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc
> @@ -46,7 +46,7 @@
>   #define NV_PPWR_INTR_EN_SET_SUBINTR                                  0x00000800
>   #define NV_PPWR_INTR_EN_SET_WATCHDOG                                 0x00000002
>   #define NV_PPWR_INTR_EN_CLR                                              0x0014
> -#define NV_PPWR_INTR_EN_CLR_MASK                    /* fuck i hate envyas */ -1
> +#define NV_PPWR_INTR_EN_CLR_MASK                    /* heck, i hate envyas */ -1

Please make sure that the values remain properly right-justified when 
proposing such changes.
Best,

Roy

>   #define NV_PPWR_INTR_ROUTE                                               0x001c
>   #define NV_PPWR_TIMER_LOW                                                0x002c
>   #define NV_PPWR_WATCHDOG_TIME                                            0x0034
> --
> 2.30.0
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
