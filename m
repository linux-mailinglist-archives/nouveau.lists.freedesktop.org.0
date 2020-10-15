Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372DE28F769
	for <lists+nouveau@lfdr.de>; Thu, 15 Oct 2020 19:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0BE6ED87;
	Thu, 15 Oct 2020 17:03:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF696ED87
 for <nouveau@lists.freedesktop.org>; Thu, 15 Oct 2020 17:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602781408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MZ+HtkW9/US8p9eIWMS1JqM01+ysPLOkWvnGLPTK0bk=;
 b=R+LB2SGo8dEJimaEO+igBX8TTV0sHwqTNBwQ20njW5cuf4k5clkvBtrlH+4tBAsL79/Fuo
 Z8Li29hIpaBOh4u/WoPdO/c7jsDJXtgf7Ly4pK7R6nU4+DWN3h7+ta4Qt0FivHbN1i34iG
 8mFrK0fCFphFBd/f3qgjmpwHNOoMkHU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-9HSuWkiROCy6m4CXm4kOug-1; Thu, 15 Oct 2020 13:03:26 -0400
X-MC-Unique: 9HSuWkiROCy6m4CXm4kOug-1
Received: by mail-qt1-f197.google.com with SMTP id 2so2339691qtb.5
 for <nouveau@lists.freedesktop.org>; Thu, 15 Oct 2020 10:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MZ+HtkW9/US8p9eIWMS1JqM01+ysPLOkWvnGLPTK0bk=;
 b=E6bah58+jB94Kpo8jdvzGjEf8ADumu0t8pj2R2LPRyQAjGfAiGKrwc8J9PPBI3yfyJ
 CoMvlsUYIUbbmmsE7Jw1FLTJmtbMPnrzehPmeAfAqq4qZlQWIVb1RnqYWuGC54nRgSO/
 lXzJNLjZLkOJOH6kofwodBnGSzJQtgBJAWEnJOBZYL5hKrWfz2X6ezQ31W+2Ev4Aje0h
 c9H4l4nNF6E+YblAxz04KyltGWoec22Qz8fFJkYjPEU2cAbPbdKA4G3J5k9EuvxD+SN8
 YmEx6HJ586oTmGO/UJpIFBy9imeYIWBtXMEAMBQ9Azwg5B8Gdhen0iTlEwZKaOdfhFY/
 T8RQ==
X-Gm-Message-State: AOAM530tQFqojVmOOoxGKhfXa/fJuF/0r5/OP1Tppko+quNxn+cxb/5T
 1/1QfyLhYj1NMvghNsGs9GX8Ocq+BFzwIg96tqivT3Er5poAN290htODpaTpurZYAPWgRLol7H1
 /IiNeFjC6T3oTLeCnxBKMrHmP6HOvOeMmB+bReY/ybA==
X-Received: by 2002:a05:620a:1668:: with SMTP id
 d8mr5081788qko.192.1602781405507; 
 Thu, 15 Oct 2020 10:03:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9/19KaH9fBtSabelwlRB2jV6hDoMo13yhmIvM2xtY6dLjjAeCvxgABDoRY001mtnGcqtc06Nfdel1kicxM30=
X-Received: by 2002:a05:620a:1668:: with SMTP id
 d8mr5081767qko.192.1602781405261; 
 Thu, 15 Oct 2020 10:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201014075419.19974-1-keitasuzuki.park@sslab.ics.keio.ac.jp>
 <CACO55ttZCVZM2v1oWRq7mzZy3DVDe3h1fH80D6RNFM3xR4VjuQ@mail.gmail.com>
In-Reply-To: <CACO55ttZCVZM2v1oWRq7mzZy3DVDe3h1fH80D6RNFM3xR4VjuQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 15 Oct 2020 19:03:14 +0200
Message-ID: <CACO55ttfu1xbQ6e1rk0KZkNdJ7Jik91u0vp=e046hf6D7g1Z9Q@mail.gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH RFC] drm/nouveau: fix memory leak in
 nvkm_iccsense_oneinit
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
Cc: takafumi@sslab.ics.keio.ac.jp, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Oct 15, 2020 at 6:32 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> Ben, I think this is like the 5th patch tackling this issue, I think
> we should merge one of those.
>

maybe I just confused that with reports, but it seems to turn up quite
a bit and maybe I should have pushed more of it as well...

Anyway, the patch itself looks good.

Reviewed-by: Karol Herbst <kherbst@redhat.com>

> On Thu, Oct 15, 2020 at 6:23 AM Keita Suzuki
> <keitasuzuki.park@sslab.ics.keio.ac.jp> wrote:
> >
> > struct pw_rail_t is allocated as an array in function nvios_iccsense_parse,
> > and stored to a struct member of local variable. However, the array is not
> > freed when the local variable becomes invalid, and the reference is not
> > passed on, leading to a memory leak.
> >
> > Fix this by freeing struct pw_rail_t when exiting nvkm_iccsense_oneinit.
> >
> > Signed-off-by: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > index fecfa6afcf54..8ba8d8e3f52a 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > @@ -280,8 +280,10 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
> >                         }
> >
> >                         rail = kmalloc(sizeof(*rail), GFP_KERNEL);
> > -                       if (!rail)
> > +                       if (!rail) {
> > +                               kfree(stbl.rail);
> >                                 return -ENOMEM;
> > +                       }
> >
> >                         rail->read = read;
> >                         rail->sensor = sensor;
> > @@ -291,6 +293,7 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
> >                         list_add_tail(&rail->head, &iccsense->rails);
> >                 }
> >         }
> > +       kfree(stbl.rail);
> >         return 0;
> >  }
> >
> > --
> > 2.17.1
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> >

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
