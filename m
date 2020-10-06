Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BE7285151
	for <lists+nouveau@lfdr.de>; Tue,  6 Oct 2020 20:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A0F6E0A8;
	Tue,  6 Oct 2020 18:02:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD906E0A8
 for <nouveau@lists.freedesktop.org>; Tue,  6 Oct 2020 18:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602007326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bBZk0lC0OCe7z/6HdLh2DgL/ofxbSkiLKgMDQUymnZY=;
 b=QIv+PjcCPwg+TaCa7qMEe17t8q5nfoYmD/83KsvB71LrYY9O7QS1aB0uMkMefAmBE/avg6
 wLo7sb3QYAArQDj8vcFkxkCV8an5IsTcm9Rl2wRDyXNNuHXLOvUGQIqnpNTst9s8iCjjwz
 SsTEaZmWLNthh2+4ULa9K2K4pykeCME=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-hb63CYKVONW1mam1ghuOxQ-1; Tue, 06 Oct 2020 14:02:03 -0400
X-MC-Unique: hb63CYKVONW1mam1ghuOxQ-1
Received: by mail-qk1-f198.google.com with SMTP id f126so5018634qke.17
 for <nouveau@lists.freedesktop.org>; Tue, 06 Oct 2020 11:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bBZk0lC0OCe7z/6HdLh2DgL/ofxbSkiLKgMDQUymnZY=;
 b=sRQfTqqlaWbBUSoLy/Ml4YU8xTp8ULU0sgpiPUNOiZytSh+n3fhdM6tqlYx6pLRzf+
 gQWGuubE/zA5OQmjATRfGnSiPy+94Q6HuSB+P/lEip9bsXcbyzZvP6menULBQ2CLlSGJ
 5p9Xh90ntYW00Sz9LwqUZIfz6Du5fgzXXHE64jLEJVvIEewqZXQwJWXmZ+0OoUcGcMiO
 vRdtJSmFwlz5kD11SQj5qngbg/HAW3qIRsEe4XFHh5/QTddlISB2+nKIA0msEWoLVJ1g
 DBlQ8Y+GTG+70tj7Jd3Mlw6SzBYuSUILWbk4TFMy0Reh29l8K3wsspkv/UCh2qJzwAza
 kclg==
X-Gm-Message-State: AOAM530CHgHmk3687/WM/KUxGqA0dYw+fcNVrxjTpVdFL72LFVVRA7P0
 fYsXKHZh2JIakNc8LImgKbC8RKLpCxlptNMMqycgDK6BMSmbEUFh5DQImdlzYaYDVW1X50G4urq
 EqtXIcip85wucK9JBdfFXUrbvP9urlbFS5DbtyEAcng==
X-Received: by 2002:ac8:544f:: with SMTP id d15mr6610214qtq.378.1602007323357; 
 Tue, 06 Oct 2020 11:02:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW4BskSedT8iSB+xC28c01C8itFcK4Myh6bysPPWyTo82y3qvu2YBN8Rv1sN84poCjk0h9gUhyzp+Q2zlkND8=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr6610184qtq.378.1602007323110; 
 Tue, 06 Oct 2020 11:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201005135230.735914-1-kherbst@redhat.com>
 <20201006164332.GA1172704@xps13.dannf>
 <CACO55ttsBedogmWUV370vWpS49FmyQOk7spc5WkrnZKbbjyvGA@mail.gmail.com>
 <20201006175315.GA16561@xps13>
In-Reply-To: <20201006175315.GA16561@xps13>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 6 Oct 2020 20:01:52 +0200
Message-ID: <CACO55ts1exDV8jFcg+uZCxi_qpP8p3jEvU9gQHi--ON9Zt8cNg@mail.gmail.com>
To: Jeremy Cline <jcline@redhat.com>
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
Cc: dann frazier <dann.frazier@canonical.com>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Oct 6, 2020 at 7:53 PM Jeremy Cline <jcline@redhat.com> wrote:
>
> On Tue, Oct 06, 2020 at 06:46:35PM +0200, Karol Herbst wrote:
> > On Tue, Oct 6, 2020 at 6:43 PM dann frazier <dann.frazier@canonical.com> wrote:
> > >
> > > On Mon, Oct 05, 2020 at 03:52:30PM +0200, Karol Herbst wrote:
> > > > Previously the code relied on device->pri to be NULL and to fail probing
> > > > later. We really should just return an error inside nvkm_device_ctor for
> > > > unsupported GPUs.
> > > >
> > > > Fixes: 24d5ff40a732 ("drm/nouveau/device: rework mmio mapping code to get rid of second map")
> > > > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > > > Cc: dann frazier <dann.frazier@canonical.com>
> > >
> > > Thanks Karol! Got rid of the Oops for me.
> > >
> > > Tested-by: dann frazier <dann.frazier@canonical.com>
> > >
> > > Would it be appropriate to tag this for stable v5.8+?
> > >
> >
> > Due to the Fixes: tags it will get auto selected for stable releases
> > afaik. But I think an explicit send might speed it up? I think it's
> > fine either way.
> >
>
> The patch looks to only applies to the out-of-tree driver (is it normal
> to send patches this way?) so it'll need adjustment if it's Cc'd to
> stable, but the easiest, most reliable way to make sure it's picked up
> is to add an explicit Cc: stable@vger.kernel.org tag to the commit.
>

Actually.. we do have a drm-fixes thing, I think it's probably better
to go through that instead of the nouveau tree? Mhh.. we need a better
process here anyway :p

> Also:
>
> Reviewed-by: Jeremy Cline <jcline@redhat.com>
>
> > >   -dann
> > >
> > > > ---
> > > >  drm/nouveau/nvkm/engine/device/base.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
> > > > index 9f4ac2672..68d665414 100644
> > > > --- a/drm/nouveau/nvkm/engine/device/base.c
> > > > +++ b/drm/nouveau/nvkm/engine/device/base.c
> > > > @@ -3149,6 +3149,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
> > > >               case 0x168: device->chip = &nv168_chipset; break;
> > > >               default:
> > > >                       nvdev_error(device, "unknown chipset (%08x)\n", boot0);
> > > > +                     ret = -ENOSYS;
> > > >                       goto done;
> > > >               }
> > > >
> > >
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> >
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
