Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C02285140
	for <lists+nouveau@lfdr.de>; Tue,  6 Oct 2020 19:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EF46E4E6;
	Tue,  6 Oct 2020 17:57:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C236E4E6
 for <nouveau@lists.freedesktop.org>; Tue,  6 Oct 2020 17:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602007022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cQzlTf0p9XdtxAl60KKNkLVxvGp7SURPOWwsRbY0s6Q=;
 b=ip80gvTb6RSZtHnC9g3Jc+h2706ZWIVe68bC4ufNYawXK3LPBaRZnNA0MXxfRLKFgMsX+g
 F7/cwZW34YHNOEa68VFk3jxCLtkRRZs7SkRTvbey85/nLVoiYkFZdi/HmJnhOVVYhCgHtA
 0LipLqhLyXws9kgp5Pv3IjEqe14hzLI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-SLyaOmYhPIax69oWaot2Fw-1; Tue, 06 Oct 2020 13:53:20 -0400
X-MC-Unique: SLyaOmYhPIax69oWaot2Fw-1
Received: by mail-qt1-f199.google.com with SMTP id u6so9605285qte.8
 for <nouveau@lists.freedesktop.org>; Tue, 06 Oct 2020 10:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cQzlTf0p9XdtxAl60KKNkLVxvGp7SURPOWwsRbY0s6Q=;
 b=eQ+bF4uGWgre4JrvHtosS8A8bV18Uoc2YfunlhzkXPp2weuXxwxNFP70smwq4No1Ms
 L4awfCZIJ8uzMUvBgwFqz12LtHdw1gdc01wifvnPkhFQcsdrcg/6IUYUYgjQyxFzqYQX
 hO0iR1DUwtxiYBPA2lWu2JD7Ly2JQQn5Nq/s60hRLfU+vwrp7sUICXvleWE7JtYzMdlH
 SVkNZyaGiNXknu+MlUCtpQRBKUSjLjqS0CwKZD6C58Sowq46Up0krsaGekagC9NFEB5T
 Djk6b27y1CR687fJ+zHOpcKF+I1zPYu7a2VPyUoTbbxf+wVtIJo5XbrvBmM0Ywhip/al
 DEJQ==
X-Gm-Message-State: AOAM533MUVJaWuLsSSdbZGMqxYAgeaurJ7k42vgc749VTgLuY/e11dLw
 UlJvNvhLV/JoTj2TJWJD3huXL3TCPMkcRuJNOclwD0ybm2ZfZgeLn3/Z/CWBFIyCojC10vhzjPn
 RR1I6diiaxmrJqrGHJfk1D49Ixw==
X-Received: by 2002:a0c:9e0e:: with SMTP id p14mr5747560qve.25.1602006800138; 
 Tue, 06 Oct 2020 10:53:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWAsXkB5zqRDqT1/1H8FATPWbI7TUxMxzz1/GHXuIO9q0alPJidXgwMlUYZSbzJwD5z8Ad9A==
X-Received: by 2002:a0c:9e0e:: with SMTP id p14mr5747535qve.25.1602006799876; 
 Tue, 06 Oct 2020 10:53:19 -0700 (PDT)
Received: from xps13 ([136.56.20.95])
 by smtp.gmail.com with ESMTPSA id u4sm2923490qkk.68.2020.10.06.10.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 10:53:17 -0700 (PDT)
Date: Tue, 6 Oct 2020 13:53:15 -0400
From: Jeremy Cline <jcline@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20201006175315.GA16561@xps13>
References: <20201005135230.735914-1-kherbst@redhat.com>
 <20201006164332.GA1172704@xps13.dannf>
 <CACO55ttsBedogmWUV370vWpS49FmyQOk7spc5WkrnZKbbjyvGA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55ttsBedogmWUV370vWpS49FmyQOk7spc5WkrnZKbbjyvGA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: dann frazier <dann.frazier@canonical.com>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Oct 06, 2020 at 06:46:35PM +0200, Karol Herbst wrote:
> On Tue, Oct 6, 2020 at 6:43 PM dann frazier <dann.frazier@canonical.com> wrote:
> >
> > On Mon, Oct 05, 2020 at 03:52:30PM +0200, Karol Herbst wrote:
> > > Previously the code relied on device->pri to be NULL and to fail probing
> > > later. We really should just return an error inside nvkm_device_ctor for
> > > unsupported GPUs.
> > >
> > > Fixes: 24d5ff40a732 ("drm/nouveau/device: rework mmio mapping code to get rid of second map")
> > > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > > Cc: dann frazier <dann.frazier@canonical.com>
> >
> > Thanks Karol! Got rid of the Oops for me.
> >
> > Tested-by: dann frazier <dann.frazier@canonical.com>
> >
> > Would it be appropriate to tag this for stable v5.8+?
> >
> 
> Due to the Fixes: tags it will get auto selected for stable releases
> afaik. But I think an explicit send might speed it up? I think it's
> fine either way.
> 

The patch looks to only applies to the out-of-tree driver (is it normal
to send patches this way?) so it'll need adjustment if it's Cc'd to
stable, but the easiest, most reliable way to make sure it's picked up
is to add an explicit Cc: stable@vger.kernel.org tag to the commit.

Also:

Reviewed-by: Jeremy Cline <jcline@redhat.com>

> >   -dann
> >
> > > ---
> > >  drm/nouveau/nvkm/engine/device/base.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
> > > index 9f4ac2672..68d665414 100644
> > > --- a/drm/nouveau/nvkm/engine/device/base.c
> > > +++ b/drm/nouveau/nvkm/engine/device/base.c
> > > @@ -3149,6 +3149,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
> > >               case 0x168: device->chip = &nv168_chipset; break;
> > >               default:
> > >                       nvdev_error(device, "unknown chipset (%08x)\n", boot0);
> > > +                     ret = -ENOSYS;
> > >                       goto done;
> > >               }
> > >
> >
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
