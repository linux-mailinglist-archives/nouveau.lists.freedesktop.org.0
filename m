Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7613712F7F9
	for <lists+nouveau@lfdr.de>; Fri,  3 Jan 2020 13:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928526E2D7;
	Fri,  3 Jan 2020 12:06:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mupuf.org (mupuf.org [167.71.42.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 36CC26E2D7
 for <nouveau@lists.freedesktop.org>; Fri,  3 Jan 2020 12:06:30 +0000 (UTC)
Received: from [192.168.0.115] (84-104-227-30.cable.dynamic.v4.ziggo.nl
 [84.104.227.30])
 by Neelix.spliet.org (Postfix) with ESMTPSA id F2D1260041;
 Fri,  3 Jan 2020 11:58:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 Neelix.spliet.org F2D1260041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spliet.org;
 s=default; t=1578052704;
 bh=if3OT7trk+3D0p1H1q4P0eAOtA0IRNZQ1F4gmGc6w9U=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=ros4K5vIElpf/kXtFwsMHIG2wuF7Nl5IHl1VQOxOEfYAKTwHp86YIBGkemuSthaCw
 r2Z2wQX0lnIN5avc5FH15cRiMyAof84f+Z+c239k1xVbUrURBXkKJ3LSBz5bsnL+Sk
 C0kDxGNiqiwsJo49hHsGSZpwkcc66Xl7zQ8w3OBg=
To: nouveau@lists.freedesktop.org, "wuxu.wu" <wuxu.wu@huawei.com>
References: <1578039033-6458-1-git-send-email-wuxu.wu@huawei.com>
From: Roy Spliet <nouveau@spliet.org>
Message-ID: <fd3273d3-5814-be43-dbec-e49bc7990705@spliet.org>
Date: Fri, 3 Jan 2020 12:58:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1578039033-6458-1-git-send-email-wuxu.wu@huawei.com>
Content-Language: en-US
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on Neelix
X-Virus-Scanned: clamav-milter 0.101.5 at Neelix
X-Virus-Status: Clean
Subject: Re: [Nouveau] [PATCH] drm/nouveau/bios: fix incorrect kfree in
 platform_init
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

(re-sending as plain text)

NACK. The before and after of this patch are functionally identical. The 
if-block returns unconditionally ("return priv;"), so the kfree will 
only ever be reached if the condition in the if-statement evaluates to 
false. Explicitly writing out an else-block is thus superfluous.

Op 03-01-2020 om 09:10 schreef wuxu.wu:
> Hi, I think there has a incorrect kfree in pcirom_init function. In
> pcirom_init function priv porinter could be free only when priv != null
> and priv->rom is null.
> 
> Signed-off-by: wuxu.wu <wuxu.wu@huawei.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
> index 9b91da0..d776e01 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
> @@ -70,8 +70,9 @@ pcirom_init(struct nvkm_bios *bios, const char *name)
>   			    (priv->rom = pci_map_rom(pdev, &priv->size))) {
>   				priv->pdev = pdev;
>   				return priv;
> +			} else {
> +			    kfree(priv);
>   			}
> -			kfree(priv);
>   		}
>   		pci_disable_rom(pdev);
>   	}
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
