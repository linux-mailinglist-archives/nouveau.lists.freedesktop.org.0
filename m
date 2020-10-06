Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0751F285021
	for <lists+nouveau@lfdr.de>; Tue,  6 Oct 2020 18:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4FB892B2;
	Tue,  6 Oct 2020 16:46:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45ED9892B2
 for <nouveau@lists.freedesktop.org>; Tue,  6 Oct 2020 16:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602002809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JU7wilwbas+HkpndsUQQ7D52pW+3LP6usH9bbWJUWEY=;
 b=f2OC0FnIJENY5blRJ5pWHD01NPTCvl3WXEfFi9DsLScZNnbr8OMFCOzgDGUolb+m8w8MXD
 WyDWcx9XgLq9ZeTEeSpQot/tEy1Xjg8UB7h1rFKBO6HtMNOEkuWDErPlM5qQyVY8g1Lso1
 ocI72ZyAvA0jQurDBMnV3rxceKnGy70=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-hQnpJaArOViZZ84AF4uySA-1; Tue, 06 Oct 2020 12:46:47 -0400
X-MC-Unique: hQnpJaArOViZZ84AF4uySA-1
Received: by mail-qt1-f197.google.com with SMTP id k13so7787938qta.15
 for <nouveau@lists.freedesktop.org>; Tue, 06 Oct 2020 09:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JU7wilwbas+HkpndsUQQ7D52pW+3LP6usH9bbWJUWEY=;
 b=nlY+VYDUKaopce2UO1tFJzSq5RtnaeyArLnuu26cP4cjsErRUY7EZPegYkUj5uoJTQ
 +jayvgZNB/vo57XMSaBCVUj3Mup/01CyHot9f0BfOHesLVasNghRuuJACEs+6IRI43dw
 9vWzBDCmPG/rtX2CeeaUbonfQUBLTrShJjshjAffDIgF1zh40OlpsJ1L85uTTdr6LF3e
 MfI0Ly21r0rKYH7OC0U7p9hMEerfUDnkRxTZ6rflpQMf6JAFav+5lCBQhlFEclmBg+lD
 aBnpXtcxx4I32rxNXnwtq5+NhiG9DaRXWhS1l+ixSWqUqqpetrv3Yr99lsxNyaFzng5A
 1sgw==
X-Gm-Message-State: AOAM532tDQeKPunPRipkRl5IuRQNk5gA+5BwWe4c8h3UoMqdMtCS8sa3
 Dg8U7+zk7r7/esI7a9CeErr2R2M2bdRzzmnLK9s4Z+B6mXlMXP4rpIoSs9Snpe0baB5Swo3xezS
 mI+GbpZftBlAy8G0ZIyQAPUPo0jG7H71xh/TKjql1wg==
X-Received: by 2002:ad4:59cf:: with SMTP id el15mr5890602qvb.17.1602002806267; 
 Tue, 06 Oct 2020 09:46:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwgG9TiKyJclXeFd8vK3ayHmEtFvqiZW98sQG6HNZB+4n5ccnT3f0wb0rePCx0jD5BNZx5dXdB+2B/XDP6P5U=
X-Received: by 2002:ad4:59cf:: with SMTP id el15mr5890586qvb.17.1602002806055; 
 Tue, 06 Oct 2020 09:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201005135230.735914-1-kherbst@redhat.com>
 <20201006164332.GA1172704@xps13.dannf>
In-Reply-To: <20201006164332.GA1172704@xps13.dannf>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 6 Oct 2020 18:46:35 +0200
Message-ID: <CACO55ttsBedogmWUV370vWpS49FmyQOk7spc5WkrnZKbbjyvGA@mail.gmail.com>
To: dann frazier <dann.frazier@canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Oct 6, 2020 at 6:43 PM dann frazier <dann.frazier@canonical.com> wrote:
>
> On Mon, Oct 05, 2020 at 03:52:30PM +0200, Karol Herbst wrote:
> > Previously the code relied on device->pri to be NULL and to fail probing
> > later. We really should just return an error inside nvkm_device_ctor for
> > unsupported GPUs.
> >
> > Fixes: 24d5ff40a732 ("drm/nouveau/device: rework mmio mapping code to get rid of second map")
> > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > Cc: dann frazier <dann.frazier@canonical.com>
>
> Thanks Karol! Got rid of the Oops for me.
>
> Tested-by: dann frazier <dann.frazier@canonical.com>
>
> Would it be appropriate to tag this for stable v5.8+?
>

Due to the Fixes: tags it will get auto selected for stable releases
afaik. But I think an explicit send might speed it up? I think it's
fine either way.

>   -dann
>
> > ---
> >  drm/nouveau/nvkm/engine/device/base.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
> > index 9f4ac2672..68d665414 100644
> > --- a/drm/nouveau/nvkm/engine/device/base.c
> > +++ b/drm/nouveau/nvkm/engine/device/base.c
> > @@ -3149,6 +3149,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
> >               case 0x168: device->chip = &nv168_chipset; break;
> >               default:
> >                       nvdev_error(device, "unknown chipset (%08x)\n", boot0);
> > +                     ret = -ENOSYS;
> >                       goto done;
> >               }
> >
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
