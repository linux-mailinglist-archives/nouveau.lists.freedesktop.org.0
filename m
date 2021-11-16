Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78034452FEA
	for <lists+nouveau@lfdr.de>; Tue, 16 Nov 2021 12:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E74E6E9F4;
	Tue, 16 Nov 2021 11:09:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DE16E9F4
 for <nouveau@lists.freedesktop.org>; Tue, 16 Nov 2021 11:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637060959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HL9hhLdIrLyUpBuE4w+BC97fd9zpve2OyGyAHsqNBwE=;
 b=DEC4tYVqVE97FFFuwOk91/GtZN1xD2nGcA0K3Pfuk1kN83eX2c4qMIzAW7FqXsitywfPFR
 H4xhqjlKnjY7xGm92W1Rm65P3Kyxac4+XFeorqFwi0zsWI4vERAMhuh86lZoQ4TZo1a/qQ
 0N9Cy+lkzXFvKtQF+SAA9+GJt7vGh7U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-I9OmwNCEOYuLb6EuMMER3g-1; Tue, 16 Nov 2021 06:09:18 -0500
X-MC-Unique: I9OmwNCEOYuLb6EuMMER3g-1
Received: by mail-wr1-f70.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso4398031wrj.12
 for <nouveau@lists.freedesktop.org>; Tue, 16 Nov 2021 03:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HL9hhLdIrLyUpBuE4w+BC97fd9zpve2OyGyAHsqNBwE=;
 b=KNbCyJWUT9e/RJ+YB/yJZJn5VoUJk6/CbefRf6CgRFly5uu2DHTEaAObDe7q5AScNt
 U1nhg+IxlPKNqLfSRCYRX8+g87DtnvugqsWmhG7jyTnrllXtI6LlaH/1An2c2EbA8Amg
 XiLCp/vjNqH2b03CjwcvVebBG8V39CJaO6PzNMPwl8nz+/etW245NeP7wKGAok8F+8eN
 6suJWmiABXZYYn+zxNFoVErCzFHRZo482v3rfjBlcz3KH14t4nFQ9Wq/7U9ymSo8m8xO
 WnKTvOn3jgOIQWNRL2Gc5WAS1A5oXJ54AghU/7owbVNuVsIAjsunYJP1dhOCG1Scmeze
 roDQ==
X-Gm-Message-State: AOAM531hZDRCyWiQfhKmnUVFDhkUAsDukoppSpLO0uSpvJgJKYR6hnSr
 /K13Nj5mkleOjWES6+3sV8dn0GyIyym5G90FO3wAuU1x8LJ0IPN5JnbWhFihAGWfZSUKt8XazbV
 XKJnlS7642tVmAYeAtSvFjNOe/OsVoVk4ss5P/Tbk/A==
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr8196479wrm.229.1637060956898; 
 Tue, 16 Nov 2021 03:09:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTgah4x2G9O8O+iUz5EmWC3uhlRWC07X48xzTEYzOUA98ZreV80VeBn9mcy5hBafA5uvas47+J9y5b040RUo4=
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr8196441wrm.229.1637060956649; 
 Tue, 16 Nov 2021 03:09:16 -0800 (PST)
MIME-Version: 1.0
References: <CABvMjLTVZaU8vMW__2BDo6FnjFa_bsh2S-kEmg=KV4KTsFiUzA@mail.gmail.com>
 <CACO55tuDQ9UC2rr=_Hsowvujk49oNK1zWfHj3jMnhEqsTAnh0Q@mail.gmail.com>
 <CABvMjLSFLpG4=+tE3Sr2wfRsEuKLXMm++Xx+JNmA8YXptgzkmw@mail.gmail.com>
In-Reply-To: <CABvMjLSFLpG4=+tE3Sr2wfRsEuKLXMm++Xx+JNmA8YXptgzkmw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 16 Nov 2021 12:09:05 +0100
Message-ID: <CACO55tu5V1pF-Ox937Auq6vSreFTfz3gkaz0zg6Zk+ydyVpZwg@mail.gmail.com>
To: Yizhuo Zhai <yzhai003@ucr.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau/core: fix the uninitialized use
 in nvkm_ioctl_map()
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 6:58 AM Yizhuo Zhai <yzhai003@ucr.edu> wrote:
>
> Hi Karol:
> Thanks for the feedback, the patch might be too old to apply to the
> latest code tree. Let me check and get back to you soon.
>

sorry, that's not what I meant. It used whitespaces instead of tabs
and the headers were also a bit broken. I just suspect that when
sending it something went wrong or so.

> On Sat, Nov 13, 2021 at 12:22 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > something seems to have messed with the patch so it doesn't apply correctly.
> >
> > On Thu, Jun 17, 2021 at 9:39 AM Yizhuo Zhai <yzhai003@ucr.edu> wrote:
> > >
> > > In function nvkm_ioctl_map(), the variable "type" could be
> > > uninitialized if "nvkm_object_map()" returns error code,
> > > however, it does not check the return value and directly
> > > use the "type" in the if statement, which is potentially
> > > unsafe.
> > >
> > > Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> > > ---
> > >  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > > b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > > index d777df5a64e6..7f2e8482f167 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > > @@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
> > >                 ret = nvkm_object_map(object, data, size, &type,
> > >                                       &args->v0.handle,
> > >                                       &args->v0.length);
> > > +               if (ret)
> > > +                       return ret;
> > >                 if (type == NVKM_OBJECT_MAP_IO)
> > >                         args->v0.type = NVIF_IOCTL_MAP_V0_IO;
> > >                 else
> > > --
> > > 2.17.1
> > >
> >
>
>
> --
> Kind Regards,
>
> Yizhuo Zhai
>
> Computer Science, Graduate Student
> University of California, Riverside
>

