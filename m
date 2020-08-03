Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A0223A2D8
	for <lists+nouveau@lfdr.de>; Mon,  3 Aug 2020 12:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EAA6E249;
	Mon,  3 Aug 2020 10:42:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9816E248
 for <nouveau@lists.freedesktop.org>; Mon,  3 Aug 2020 10:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596451370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+bnr20DWse3hnxM4IaXhaBpbW0TWRM0m+ZB+3jgFT9M=;
 b=Jql41LA/T+7xRkneNAvrYMDAo9fj0IZRyuGNgCdeqAHroUVXyfatCTiWXHnWZID2VD1KHP
 wodJGdviVl0BcRU2pMzff3jcM6DIy+R2Z051DKZLoyd3PZCr1Qf1cRHPv0zOcydPztesB0
 SsrzocXpBoHQy4Gy+b7zjYLpn6odheY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-dwlPfxhYNx2sIJmSav7oaA-1; Mon, 03 Aug 2020 06:42:47 -0400
X-MC-Unique: dwlPfxhYNx2sIJmSav7oaA-1
Received: by mail-qv1-f70.google.com with SMTP id l10so15442984qvw.22
 for <nouveau@lists.freedesktop.org>; Mon, 03 Aug 2020 03:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+bnr20DWse3hnxM4IaXhaBpbW0TWRM0m+ZB+3jgFT9M=;
 b=t+QKi3ZZOaRffxAeTa/RQtcBNEpk7JsL33aZtHkHgtAof3ZjpZgPAT58YE4+RmjnGO
 4JZ0S/LESbANQID2fTU04hWwLFbiJ5UqJE1S6I8sDVpOv+5YmggxbNyQPboUDNjDtgp2
 lHaj+SBooV+9UBABFjdrupbtN5z9frpzKDTwYizRcGSFI25WXgsI00MTnul0k/lwL6I4
 SYvk8kMVouNehaqsj09+oe8L24Svqv9HAFctBkWF9naXEsI92FCUc7UzTdmV8FXp1a1e
 +Q61PKAEECS+LLDnge0HiM5y6Pgm8yPJgOBMkGxaOPqc+YgPWf8zfXvgW1IdWe1FgDIE
 +73g==
X-Gm-Message-State: AOAM5325rI/ZbMq3Ri6T8WOPIAmuEFnlBx06VwVNTld9AkwjCjcGOtu2
 u7UGVXp8NzkH0PDj9SM285IeeTOQfi8wxAh6etVwXIJKsQ7jqpwijFfedClgrC9BD2QSA4BsIfX
 FPvZtowmwgBlb+r6BkyvLC4SdIJf8/3S3xoCgHn/cog==
X-Received: by 2002:a37:90e:: with SMTP id 14mr15896184qkj.102.1596451365673; 
 Mon, 03 Aug 2020 03:42:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhxbdP+GWP4eAMFRYsKdTR78UMQm0cR2+UBqbqAyJHGCbvlFNyBXYetm44K0qZipDzP6iTc6iemkg+iwFYP3s=
X-Received: by 2002:a37:90e:: with SMTP id 14mr15896161qkj.102.1596451365347; 
 Mon, 03 Aug 2020 03:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200803034827.100685-1-jingxiangfeng@huawei.com>
In-Reply-To: <20200803034827.100685-1-jingxiangfeng@huawei.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 3 Aug 2020 12:42:34 +0200
Message-ID: <CACO55tsFuRmHac1_7KdebdrgGk=bAh2_aAUB302PH9rSSxdsjQ@mail.gmail.com>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau/acr: fix a coding style in
 nvkm_acr_lsfw_load_bl_inst_data_sig()
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Mon, Aug 3, 2020 at 5:46 AM Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:
>
> This patch performs the following changes:
> 1. remove a redundant parentheses around the  nvkm_acr_lsfw_add() calls
> 2. do assignment before this if condition, it is more readable
>
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> index 07d1830126ab..5f6006418472 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> @@ -191,7 +191,8 @@ nvkm_acr_lsfw_load_bl_inst_data_sig(struct nvkm_subdev *subdev,
>         u32 *bldata;
>         int ret;
>
> -       if (IS_ERR((lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id))))
> +       lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id);
> +       if (IS_ERR(lsfw))
>                 return PTR_ERR(lsfw);
>
>         ret = nvkm_firmware_load_name(subdev, path, "bl", ver, &bl);
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
