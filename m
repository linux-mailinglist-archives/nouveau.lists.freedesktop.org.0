Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4A24A0141
	for <lists+nouveau@lfdr.de>; Fri, 28 Jan 2022 20:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01E310E1CE;
	Fri, 28 Jan 2022 19:58:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142DD10E1CE
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jan 2022 19:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643399890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=coCa9J+GhEzNyejkCKSC7tpX70/70zSfnqE1h06XrJU=;
 b=OAzxeyOh9lXRGj+waujr8bQ9bbDXRFaD7t5n8HSVS4IkklLz6s7L6k8Z9eKwLI7O6glBwN
 j5JTxvJDSpf0FeOV6RYhkW7sgZdkz0XdhbjGheop3r3pJJBwn38eKAsfRZlncGUIqG6e22
 2M6+avLpDM3f8L0DNM3SuVANl1zJgQw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-0dUu7xytMPGGVVizc9pbBg-1; Fri, 28 Jan 2022 14:58:08 -0500
X-MC-Unique: 0dUu7xytMPGGVVizc9pbBg-1
Received: by mail-wm1-f72.google.com with SMTP id
 c7-20020a1c3507000000b0034a0dfc86aaso4214579wma.6
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jan 2022 11:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=coCa9J+GhEzNyejkCKSC7tpX70/70zSfnqE1h06XrJU=;
 b=PX2C8Fc4ZTuCWc5VnOGtX+w4ipnlvqiK8a7LvVpobPPr9mSe8UW6fSwz0LStEYxxYl
 vMSNVRQw4BGFtmlxheVevZYWwm+eoa6OLd3WkkdPA2g+KXDUoX0jODWcWDi0CDmsVhrd
 qX47l8N8Xbjt+GwNmNZFR5FrqLtr+aGsBJVs1c27oQAFNM4IewlhmY77IgA7DHaMwDie
 kuoVISby1KA2Pndfk2bwS5UkBV/BQlrdLMrO2W4+YJp95bE3WWQEn0a/IiprKZjNW6bB
 aE8Vf6fDDkneiA5XnH3S+Pkz1QE12ytGmRMASLXTlYqk2itetSTaCnjQGbx6QGKSJ942
 b9tg==
X-Gm-Message-State: AOAM5329Kf83GOw4IdB5kkCbExDTUOAPbMB49rHpNL2B9o4JizSZ7r9J
 hcl+ZmKnm5lSkxkDgPyF2mIESuQC3PpTm4t0XFa7fvX1R3gDsd7UtqllCr07JqlhyxumrA3sHDz
 uwSnlZHxTy/p/lN8uqzJiPr6esbDnbvycEJt+JLmbcw==
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr17301233wmi.74.1643399887595; 
 Fri, 28 Jan 2022 11:58:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzO0BXUM+1aQ82/ST9VCeZw7PtSnkB3W5IUl/VvfjMagzhYYe6iU+54S1WO7PVXjD+mUK3GvsW3MVLGJienj1g=
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr17301215wmi.74.1643399887368; 
 Fri, 28 Jan 2022 11:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20220124165856.57022-1-zhou1615@umn.edu>
 <YfPC3N+H9Fu/gqpz@kroah.com>
 <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
 <CADnq5_MtMPNHbs92OMHEzvPYSHGt=nPJMdrny6Siuvj3SYTAXQ@mail.gmail.com>
In-Reply-To: <CADnq5_MtMPNHbs92OMHEzvPYSHGt=nPJMdrny6Siuvj3SYTAXQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 28 Jan 2022 20:57:56 +0100
Message-ID: <CACO55tt4P+beifvS=jcDsfwybFynngc8DHLR0n3BseeDJNrHyw@mail.gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
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
Cc: David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Zhou Qingyang <zhou1615@umn.edu>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jan 28, 2022 at 8:54 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Fri, Jan 28, 2022 at 2:20 PM Lyude Paul <lyude@redhat.com> wrote:
> >
> > Sigh-thank you for catching this - I had totally forgot about the umn.edu ban.
> > I pushed this already but I will go ahead and send a revert for this patch.
> > Will cc you on it as well.
>
> This seems short-sighted.  If the patch is valid I see no reason to
> not accept it.  I'm not trying to downplay the mess umn got into, but
> as long as the patch is well scrutinized and fixes a valid issue, it
> should be applied rather than leaving potential bugs in place.
>
> Alex
>

Even though knowing that malicious code can be introduced via
perfectly fine looking patches, and sometimes one will never spot the
problem, this patch isn't all that bad tbh.

So should we reject patches out of "policies" or should we just be
extra careful? But not addressing the concerns as Greg pointed out is
also kind of a bad move, but also not knowing what the state of
resolving this mess is anyway.

>
> >
> > On Fri, 2022-01-28 at 11:18 +0100, Greg KH wrote:
> > > On Tue, Jan 25, 2022 at 12:58:55AM +0800, Zhou Qingyang wrote:
> > > > In nvkm_acr_hsfw_load_bl(), the return value of kmalloc() is directly
> > > > passed to memcpy(), which could lead to undefined behavior on failure
> > > > of kmalloc().
> > > >
> > > > Fix this bug by using kmemdup() instead of kmalloc()+memcpy().
> > > >
> > > > This bug was found by a static analyzer.
> > > >
> > > > Builds with 'make allyesconfig' show no new warnings,
> > > > and our static analyzer no longer warns about this code.
> > > >
> > > > Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace
> > > > "secure boot"")
> > > > Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> > > > ---
> > > > The analysis employs differential checking to identify inconsistent
> > > > security operations (e.g., checks or kfrees) between two code paths
> > > > and confirms that the inconsistent operations are not recovered in the
> > > > current function or the callers, so they constitute bugs.
> > > >
> > > > Note that, as a bug found by static analysis, it can be a false
> > > > positive or hard to trigger. Multiple researchers have cross-reviewed
> > > > the bug.
> > > >
> > > >  drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 +++++----
> > > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > index 667fa016496e..a6ea89a5d51a 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > @@ -142,11 +142,12 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr, const
> > > > char *name, int ver,
> > > >
> > > >         hsfw->imem_size = desc->code_size;
> > > >         hsfw->imem_tag = desc->start_tag;
> > > > -       hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
> > > > -       memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
> > > > -
> > > > +       hsfw->imem = kmemdup(data + desc->code_off, desc->code_size,
> > > > GFP_KERNEL);
> > > >         nvkm_firmware_put(fw);
> > > > -       return 0;
> > > > +       if (!hsfw->imem)
> > > > +               return -ENOMEM;
> > > > +       else
> > > > +               return 0;
> > > >  }
> > > >
> > > >  int
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > As stated before, umn.edu is still not allowed to contribute to the
> > > Linux kernel.  Please work with your administration to resolve this
> > > issue.
> > >
> >
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> >
>

