Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5FA4A00C6
	for <lists+nouveau@lfdr.de>; Fri, 28 Jan 2022 20:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A8210E201;
	Fri, 28 Jan 2022 19:20:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFD510E201
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jan 2022 19:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643397630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mig7DWzSwp/dgfKpPr73AnI1RojscQkVEm4yd9tasvQ=;
 b=ZgCICZpQZO/Mu6Ov79WDvKs4ewnUxwTA7ubd+ifIO0K8j8OJlLCW7FVzMclqf5v4IS3hON
 rFoObURAyp7GyEN2O80RySsObxks3UdWvAHfGW3P8yJAkD2qScTs+YL7G5DHZJUXaMpo2w
 jhuWvn4beHhOB0vJodRx/RPE24qgSvw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-7_JaU9EpOFWQLCOEi0LD8Q-1; Fri, 28 Jan 2022 14:20:26 -0500
X-MC-Unique: 7_JaU9EpOFWQLCOEi0LD8Q-1
Received: by mail-qt1-f197.google.com with SMTP id
 x5-20020ac84d45000000b002cf826b1a18so5344132qtv.2
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jan 2022 11:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=mig7DWzSwp/dgfKpPr73AnI1RojscQkVEm4yd9tasvQ=;
 b=Dc0QxIc7uYlFa2yOg7OV5OLfVZDMS1giLQS6i4jI7J0c1Y4tvyLv6Te8d2Vz5OAYJG
 5bsbvKLXMIFNPALgoEhvJdVDPEypdzEVUYp9rX4KkyE0vK5MD6/Zh+rWtTVZlNQGB23x
 qSCvpUGiMXYrDI/WinZpi27O1G2tRwC+6P4oM3Vt58/csIl//gSZqb9Hd7ZPgXYKMaQy
 gIdi7oHorvNzz6feYWIoG+x/l06G7CkxOYoo65UMIB/xxPtU+q4zf0lfTUkkvp9BGH4P
 FPtpBTBN5XeslEvRINXRQhBLU2CRAojkeux2Cj6WJ9gNd1DAwY00emXN4YGKwqF6cP66
 yGTQ==
X-Gm-Message-State: AOAM5318BtQnH+WOtYieMo9d7JFae8AMoGtj8SRIKJIgoAX9W4oikygz
 mhFvUEP19wY5fXS9EQxbCgI8sxa7h9afBN7IKteGZk9huyZM51WbRqfsBhsV5JxTWTrIFAO37Sr
 Ua/L5hYha8oFkfZi4eV6zxdpyng==
X-Received: by 2002:ad4:5769:: with SMTP id r9mr8886862qvx.52.1643397626480;
 Fri, 28 Jan 2022 11:20:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+Z3FzcdHTo3905MS7g1gUVZTFQpk0hs9iapN/w42adkJFAEEkEGcoNse6Q6tOGh2WnkBPtg==
X-Received: by 2002:ad4:5769:: with SMTP id r9mr8886848qvx.52.1643397626259;
 Fri, 28 Jan 2022 11:20:26 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id c14sm2243444qtc.31.2022.01.28.11.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 11:20:25 -0800 (PST)
Message-ID: <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>, Zhou Qingyang <zhou1615@umn.edu>
Date: Fri, 28 Jan 2022 14:20:24 -0500
In-Reply-To: <YfPC3N+H9Fu/gqpz@kroah.com>
References: <20220124165856.57022-1-zhou1615@umn.edu>
 <YfPC3N+H9Fu/gqpz@kroah.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Sigh-thank you for catching this - I had totally forgot about the umn.edu ban.
I pushed this already but I will go ahead and send a revert for this patch.
Will cc you on it as well.

On Fri, 2022-01-28 at 11:18 +0100, Greg KH wrote:
> On Tue, Jan 25, 2022 at 12:58:55AM +0800, Zhou Qingyang wrote:
> > In nvkm_acr_hsfw_load_bl(), the return value of kmalloc() is directly
> > passed to memcpy(), which could lead to undefined behavior on failure
> > of kmalloc().
> > 
> > Fix this bug by using kmemdup() instead of kmalloc()+memcpy().
> > 
> > This bug was found by a static analyzer.
> > 
> > Builds with 'make allyesconfig' show no new warnings,
> > and our static analyzer no longer warns about this code.
> > 
> > Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace
> > "secure boot"")
> > Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> > ---
> > The analysis employs differential checking to identify inconsistent 
> > security operations (e.g., checks or kfrees) between two code paths 
> > and confirms that the inconsistent operations are not recovered in the
> > current function or the callers, so they constitute bugs. 
> > 
> > Note that, as a bug found by static analysis, it can be a false
> > positive or hard to trigger. Multiple researchers have cross-reviewed
> > the bug.
> > 
> >  drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > index 667fa016496e..a6ea89a5d51a 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > @@ -142,11 +142,12 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr, const
> > char *name, int ver,
> >  
> >         hsfw->imem_size = desc->code_size;
> >         hsfw->imem_tag = desc->start_tag;
> > -       hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
> > -       memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
> > -
> > +       hsfw->imem = kmemdup(data + desc->code_off, desc->code_size,
> > GFP_KERNEL);
> >         nvkm_firmware_put(fw);
> > -       return 0;
> > +       if (!hsfw->imem)
> > +               return -ENOMEM;
> > +       else
> > +               return 0;
> >  }
> >  
> >  int
> > -- 
> > 2.25.1
> > 
> 
> As stated before, umn.edu is still not allowed to contribute to the
> Linux kernel.  Please work with your administration to resolve this
> issue.
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

