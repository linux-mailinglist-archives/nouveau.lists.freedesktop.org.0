Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EAB4A013E
	for <lists+nouveau@lfdr.de>; Fri, 28 Jan 2022 20:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C55110E17D;
	Fri, 28 Jan 2022 19:57:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02EE10E17D
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jan 2022 19:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643399863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmGbmOUvK4yjDAJwMxxJBb4Z/xtyIfwX7CGR6Y/DpC0=;
 b=GgjQjr/p8gJknhxOsojb2BaomOPMVg5FZffqClQNARDD4dxD+EggibY6/hso8slF+x4J55
 jjHs/pO419qaxBZEwQevCVvcEzyEQ/Dq4vomroEvPUJ2Fv1FLrghEzl6SEwiqGo+1RIJiL
 HjjO5SX6t0RXfKlvImbO5VVVLl+4MBI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-SPlMG5UINdaY-6oqlmGcew-1; Fri, 28 Jan 2022 14:57:39 -0500
X-MC-Unique: SPlMG5UINdaY-6oqlmGcew-1
Received: by mail-qk1-f197.google.com with SMTP id
 z205-20020a3765d6000000b0047db3b020dfso5573320qkb.22
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jan 2022 11:57:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=gmGbmOUvK4yjDAJwMxxJBb4Z/xtyIfwX7CGR6Y/DpC0=;
 b=yA/a1WHnzIB6DfC/rIfbKgj0pImGM+BSwsaxUHlgNhHBXjoi6I+CFG+Whf2NZbd8fY
 z1Aca3T7ybHEo/yJQrMwrVHjnsJEpc9pRWwaDe+f/xZ9KP3xMhLUiUgP+zntMUv1Lusg
 P/xBuyoUmCGfDw3RQuG/f15w6c42ZwLBo7J2ewj8uCbKjWgPjwZQl2rGooEBJaHQNzVZ
 cKpB/eBga8wvqqFZ5q2FWmUVpH53FhobgrAszY7KSqSlq63X5MTmY9h+Lt8Spjq49x2/
 Im+l/hu/Bd4d2q0+RJRILk/faXcu60jTzZzpACZBkWZgB/CGp5nDS1ph9/zAjw489eDV
 8KNg==
X-Gm-Message-State: AOAM531raEHH77UmUwirsyyRoFyOH76OaeWpSqFIKI2QkuRWwYbWIs/F
 sE0aamRPIeCPRLwRS3nEp6x4dN1QsMflARyPea4urR3McolV1q4aG23vnG+rM8A4JA3eEE30fyN
 cbLSxAJu3UdJOBOtQs6DE+v3jww==
X-Received: by 2002:a05:622a:34f:: with SMTP id
 r15mr7313873qtw.614.1643399859192; 
 Fri, 28 Jan 2022 11:57:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqqqWZZnT4Gi792LqHhFNNSJChpEPsdTeaK71iFNML++Ifr0P0KAn1UTLen+GqF1t7TRUCOg==
X-Received: by 2002:a05:622a:34f:: with SMTP id
 r15mr7313857qtw.614.1643399858977; 
 Fri, 28 Jan 2022 11:57:38 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id bl1sm3880139qkb.16.2022.01.28.11.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 11:57:38 -0800 (PST)
Message-ID: <9457f3e139bdf3938e829e1affd01300c11c67dc.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Jan 2022 14:57:36 -0500
In-Reply-To: <CADnq5_MtMPNHbs92OMHEzvPYSHGt=nPJMdrny6Siuvj3SYTAXQ@mail.gmail.com>
References: <20220124165856.57022-1-zhou1615@umn.edu>
 <YfPC3N+H9Fu/gqpz@kroah.com>
 <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
 <CADnq5_MtMPNHbs92OMHEzvPYSHGt=nPJMdrny6Siuvj3SYTAXQ@mail.gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 2022-01-28 at 14:53 -0500, Alex Deucher wrote:
> On Fri, Jan 28, 2022 at 2:20 PM Lyude Paul <lyude@redhat.com> wrote:
> > 
> > Sigh-thank you for catching this - I had totally forgot about the umn.edu
> > ban.
> > I pushed this already but I will go ahead and send a revert for this
> > patch.
> > Will cc you on it as well.
> 
> This seems short-sighted.  If the patch is valid I see no reason to
> not accept it.  I'm not trying to downplay the mess umn got into, but
> as long as the patch is well scrutinized and fixes a valid issue, it
> should be applied rather than leaving potential bugs in place.
> 

Yeah - I sent a revert for this, but that was mainly just to make sure I
didn't cause problems with Linus or something like that. If it's all the same
I'd much rather just leave this patch in, as looking at the code the fix seems
completely valid.

> Alex
> 
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
> > > >  drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 +++++----
> > > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > index 667fa016496e..a6ea89a5d51a 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > @@ -142,11 +142,12 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr,
> > > > const
> > > > char *name, int ver,
> > > > 
> > > >         hsfw->imem_size = desc->code_size;
> > > >         hsfw->imem_tag = desc->start_tag;
> > > > -       hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
> > > > -       memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
> > > > -
> > > > +       hsfw->imem = kmemdup(data + desc->code_off, desc->code_size,
> > > > GFP_KERNEL);
> > > >         nvkm_firmware_put(fw);
> > > > -       return 0;
> > > > +       if (!hsfw->imem)
> > > > +               return -ENOMEM;
> > > > +       else
> > > > +               return 0;
> > > >  }
> > > > 
> > > >  int
> > > > --
> > > > 2.25.1
> > > > 
> > > 
> > > As stated before, umn.edu is still not allowed to contribute to the
> > > Linux kernel.  Please work with your administration to resolve this
> > > issue.
> > > 
> > 
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

