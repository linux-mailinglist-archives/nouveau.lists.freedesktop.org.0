Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9685C41ADB4
	for <lists+nouveau@lfdr.de>; Tue, 28 Sep 2021 13:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422536E0C9;
	Tue, 28 Sep 2021 11:18:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955A66E0C2
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632827883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LTH1Bqp5aQrMW9U7Wyi09yKeBdxoa/KnxdAvfiFTjy0=;
 b=Nni1aaRj4EN/AiQXO7Pbdl0bn+QqVum0ZUocusceXoJGjizBnFRMIhVxPDO3n9FNi6BD9H
 ASfChXuC7ZIA8NuvsArmn78fyTGGx1bb7jQfxllVglv5AoXtgkvM6VsJGyHWU3i0YdhDfg
 l9FiZgKn+BX1BQGXFgkAkMqtOoVHWVM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-5rbGdN7HOKWVOOcyi5F9XA-1; Tue, 28 Sep 2021 07:18:02 -0400
X-MC-Unique: 5rbGdN7HOKWVOOcyi5F9XA-1
Received: by mail-wm1-f72.google.com with SMTP id
 200-20020a1c00d1000000b0030b3dce20e1so998696wma.0
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 04:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LTH1Bqp5aQrMW9U7Wyi09yKeBdxoa/KnxdAvfiFTjy0=;
 b=nFyr7PcPs3CkxMKXZFgKN9yklRutYhcOva4K1JYbeC+cP4l09MdAlnfEKaJRC55K0D
 /EBOwpN1rtmvClPqwYPISZ/jCOJfpj2teP+IbnJ2viFBkNPUAr4kBY8I3ZB4nV0G8OWs
 vtJ0IWug1u0Z3cZDgYh1TeLpywgNZ0ItF1nOgBtXd4VWrC2scnMcZ9xVwC/Y3vlAHQ7F
 GB/xSZPey84jumXCJ0Ya8tGFXYnarebeu5McemrX0/3+UEkE1vyuTOFJenByFqkriBkX
 gfpN5U/of5vpw36c8x8UyXL+LDsirLOKgwRowsimg3h/Yt+QF896vwnt4u/LLfjb2StK
 N40Q==
X-Gm-Message-State: AOAM532R0PxAMElkENM+FgtK13IqdzD8qsFtNWcAKEVJntlzKt3pgVbZ
 UBKZ1zcHaiwfbIGnX2egD7GVqZ868YoOFSSrg8jr3nZR/EJM4ODyZtndwnY16Wcgb/n0m4tctCv
 qRwKgk4AGB1Lh+CZXTpxhMjXOtGfFGXzv1H+t/hOFZQ==
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr5703242wrr.142.1632827881286; 
 Tue, 28 Sep 2021 04:18:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXey4AvCzQ1OIitejIrHYkhslIGKRMhKkajU7oL55IV3B2Y8nmEuFYibwyOSrec5I/msAUej7ScCzCJYa6KtI=
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr5703226wrr.142.1632827881160; 
 Tue, 28 Sep 2021 04:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210821021447.27097-1-luo.penghao@zte.com.cn>
In-Reply-To: <20210821021447.27097-1-luo.penghao@zte.com.cn>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 28 Sep 2021 13:17:50 +0200
Message-ID: <CACO55tt3FF1gEffPjQTS+m3oW1yWG_xUQL_kP=kezyesj_oYkg@mail.gmail.com>
To: CGEL <cgel.zte@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Alistair Popple <apopple@nvidia.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>, Luo penghao <luo.penghao@zte.com.cn>, 
 Zeal Robot <zealci@zte.com.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH linux-next] drm/nouveau/mmu/gp100-: drop
 unneeded assignment in the if condition.
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

Reviewed-by: Karol Herbst <kherbst@redhat.com>

but I will remove the unnecessary brackets as well

On Sat, Aug 21, 2021 at 10:46 AM CGEL <cgel.zte@gmail.com> wrote:
>
> From: Luo penghao <luo.penghao@zte.com.cn>
>
> In order to keep the code style consistency of the whole file,
> the 'inst' assignments should be deleted.
>
> The clang_analyzer complains as follows:
>
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c:499:8: warning:
> Although the value storedto 'inst' is used in the enclosing expression,
> the value is never actually read from 'inst'.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Luo penghao <luo.penghao@zte.com.cn>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> index f02abd9..5d7766a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> @@ -502,7 +502,7 @@ gp100_vmm_fault_cancel(struct nvkm_vmm *vmm, void *argv, u32 argc)
>         args->v0.inst |= 0x80000000;
>
>         if (!WARN_ON(nvkm_gr_ctxsw_pause(device))) {
> -               if ((inst = nvkm_gr_ctxsw_inst(device)) == args->v0.inst) {
> +               if ((nvkm_gr_ctxsw_inst(device)) == args->v0.inst) {
>                         gf100_vmm_invalidate(vmm, 0x0000001b
>                                              /* CANCEL_TARGETED. */ |
>                                              (args->v0.hub    << 20) |
> --
> 2.15.2
>
>

