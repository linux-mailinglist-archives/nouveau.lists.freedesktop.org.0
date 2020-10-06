Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AF6285770
	for <lists+nouveau@lfdr.de>; Wed,  7 Oct 2020 05:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA466E882;
	Wed,  7 Oct 2020 03:58:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BD36E4CA
 for <nouveau@lists.freedesktop.org>; Tue,  6 Oct 2020 16:43:39 +0000 (UTC)
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <dann.frazier@canonical.com>) id 1kPq3t-0003WV-Fa
 for nouveau@lists.freedesktop.org; Tue, 06 Oct 2020 16:43:37 +0000
Received: by mail-io1-f70.google.com with SMTP id z18so2274414ioi.17
 for <nouveau@lists.freedesktop.org>; Tue, 06 Oct 2020 09:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+spTJc9PGm/NUUgUK/vdAguglhDAnDx+sX/qHAq8Nuw=;
 b=Lc3lasv/318AXI/WZjE7mwVaw4zPoa5FaMGQX+qKojYb1YuuUK52qcRAD1EsWC2Fax
 swAjIBm+bbRuGVtZgWojWqoa3vxZKarZ/0L7yKbonZziHlSdO4BindldOPfYLVJxkEfU
 6e0SHfamIWtsVNJP7JOYe2RTbETlvBZ5cGmUtTaFoqNPO3XtcHxLbFGMBUKMsdgTRRCO
 LP8iXJswZP8HcLAnrtPsLVN5oLL/GDw/ocn3ErF6jRUygOV+3HS9BuKIs8L3Mjhg69kl
 DoDyhIbVy8T/E2lKVjuVXNiKzMCBj974yhcjAuUw7wRuLb1oA44b4ZEFcMKjEJ5f9RoH
 mXqw==
X-Gm-Message-State: AOAM530IPVqXfoRKactpaVGD+bkS4RqDhy2v5eeXkpBaYpoDoK2AK1OW
 o9ZQKN1NrR34WtZ95zGBTM8q4UHF4j3Jr9+cfeQqXCH249UtmX38Tx/S7MhYVt99cCsTQV9nSQw
 XGzHkqEJuwP9U2lp0APUBUf+4KlmN+/xC5sDBZF9iNc4=
X-Received: by 2002:a6b:cd89:: with SMTP id d131mr1813114iog.41.1602002616389; 
 Tue, 06 Oct 2020 09:43:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOh5iB7zRMN8vJkTwVUDdRUWmYaDXSAz3CsEyAZe+Fy+SnZeZiFSrF4U7H60Xzs1ZUABMxHw==
X-Received: by 2002:a6b:cd89:: with SMTP id d131mr1813092iog.41.1602002616031; 
 Tue, 06 Oct 2020 09:43:36 -0700 (PDT)
Received: from xps13.dannf (c-71-56-235-36.hsd1.co.comcast.net. [71.56.235.36])
 by smtp.gmail.com with ESMTPSA id c66sm550554ilg.46.2020.10.06.09.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 09:43:35 -0700 (PDT)
Date: Tue, 6 Oct 2020 10:43:32 -0600
From: dann frazier <dann.frazier@canonical.com>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20201006164332.GA1172704@xps13.dannf>
References: <20201005135230.735914-1-kherbst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005135230.735914-1-kherbst@redhat.com>
X-Mailman-Approved-At: Wed, 07 Oct 2020 03:58:34 +0000
Subject: Re: [Nouveau] [PATCH] device: return error for unknown chipsets
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
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Oct 05, 2020 at 03:52:30PM +0200, Karol Herbst wrote:
> Previously the code relied on device->pri to be NULL and to fail probing
> later. We really should just return an error inside nvkm_device_ctor for
> unsupported GPUs.
> 
> Fixes: 24d5ff40a732 ("drm/nouveau/device: rework mmio mapping code to get rid of second map")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> Cc: dann frazier <dann.frazier@canonical.com>

Thanks Karol! Got rid of the Oops for me.

Tested-by: dann frazier <dann.frazier@canonical.com>

Would it be appropriate to tag this for stable v5.8+?

  -dann

> ---
>  drm/nouveau/nvkm/engine/device/base.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
> index 9f4ac2672..68d665414 100644
> --- a/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drm/nouveau/nvkm/engine/device/base.c
> @@ -3149,6 +3149,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>  		case 0x168: device->chip = &nv168_chipset; break;
>  		default:
>  			nvdev_error(device, "unknown chipset (%08x)\n", boot0);
> +			ret = -ENOSYS;
>  			goto done;
>  		}
>  
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
