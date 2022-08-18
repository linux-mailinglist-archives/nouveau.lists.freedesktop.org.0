Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF948598F4C
	for <lists+nouveau@lfdr.de>; Thu, 18 Aug 2022 23:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38F010EEE9;
	Thu, 18 Aug 2022 21:17:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2841710ED3E
 for <nouveau@lists.freedesktop.org>; Thu, 18 Aug 2022 21:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660857447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8QD2MiGjdFmmTZH4HfJi+2KKvKrU3zTssHLQbu/eao4=;
 b=gh6huPAxkkHcbj6kzPPQtFztVnmOgt0xwGnVZQpMUWnXBk7owae9y8ze3QmHU2PADFbDs+
 XrjZLOkfK12kspwHh5/eMnJSzpZMCQomxVQ31VNIs7B5/dZdRjDHghYdviqYu0JCNU1tk7
 9WdM5//dbxtvZvXmhcho9o+5fw23zC4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-247-6bvz47ppMZqa5F1jFM9Nmg-1; Thu, 18 Aug 2022 17:17:26 -0400
X-MC-Unique: 6bvz47ppMZqa5F1jFM9Nmg-1
Received: by mail-qv1-f70.google.com with SMTP id
 c10-20020a0ce64a000000b00496b34088f3so1665861qvn.15
 for <nouveau@lists.freedesktop.org>; Thu, 18 Aug 2022 14:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=8QD2MiGjdFmmTZH4HfJi+2KKvKrU3zTssHLQbu/eao4=;
 b=jXU18wyfDb4OaF0zivKM9NqJ8hfyT2IC7rCbTmAA/LQblA9skBkCUOJuoAqgFvJ4nw
 1Rouxli3ifBeh0U5yhF7zgVKymxetgMkjmNprCdHDH3EBAUjsM0zgZjYNV6XhMkRaBwg
 EWFuScNog29OdwgMeygx5noo5XGptlWZTi56Zg6AjUhXn4y7Lh4RttUiKZZ2BbrL3duo
 y6bJbgfkxS8ifkVNpdxVK0yiKU6JfcvD5K87eBGRpeEy0IS6KUGs/Z6iLXtV3ypU4QA3
 wRRsHG5/zkMxi2Wk/hXveh4jeHXqEO6XOl09UXNNqJrnkbgO3bicYi5Jg76e/a2t0+Z8
 FieQ==
X-Gm-Message-State: ACgBeo3dRdfS4u/yZBrpnLqiUzqiRfWYi53R6P9HCaAz+o8a8Gng125x
 2sH/BxMDPVP5ycvUlHWM7gnGaNqqcEIM05erFsSM/+kuEFmecfzIXervgUdz4gLyZ+V51Y/pfhm
 RNZXHt+6fk7eaPfipg//jfXxoZARp5RS1LJMN4g0F8w==
X-Received: by 2002:a37:8882:0:b0:6b8:e449:afbe with SMTP id
 k124-20020a378882000000b006b8e449afbemr3373674qkd.345.1660857445719; 
 Thu, 18 Aug 2022 14:17:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4LOJorFLZXLwm1MrdUTX7uUiWfuXS/ZYkvF9Wc53vcMOh58I9CztjqacUImAK3wjuXSINz/VI2kyuUPSkhx54=
X-Received: by 2002:a37:8882:0:b0:6b8:e449:afbe with SMTP id
 k124-20020a378882000000b006b8e449afbemr3373667qkd.345.1660857445536; Thu, 18
 Aug 2022 14:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAHSpYy3G7EPhLBAiy4MgngKRqFgs1cTC-pnJb662vxxmkmxPXA@mail.gmail.com>
 <CAKb7UvhBekZhHhq=aD+hLCfOWe33whi_bScbLiDhXDwvEvbzfA@mail.gmail.com>
 <YWhgFZPqx3qKqr0C@debian.fritz.box>
 <CAKb7UviFVRe7hbtEXF6hUQh2TuZPthu+bt90h+8haf3A1FYt7g@mail.gmail.com>
 <2296778.YFyOdMMpyM@debian>
 <CAHSpYy1HJzY5kNoxk36yGRsKhmxQYP7FVM=Orn7RyKCtZc293w@mail.gmail.com>
 <CACO55tsJCPLw+UH6ADyHy62CfQKTtAwskoP86as2pwKnO7-NwQ@mail.gmail.com>
 <071b71819660d61d9b5caa368f683189a192754f.camel@redhat.com>
 <CACO55ttafiSS+eU=g0=uqwvU7yi+B_6LJK1VJ2FLObn6Rg8LYQ@mail.gmail.com>
 <31a134642314b288771637610659a4f50f971f27.camel@redhat.com>
 <CACO55tvBR5exrpMP=mKhxZjfJVQxuvQoYApnwFZjQWxFv_6msQ@mail.gmail.com>
 <eac32fb892e7260efd8d5ad82696efa076c9e36e.camel@redhat.com>
In-Reply-To: <eac32fb892e7260efd8d5ad82696efa076c9e36e.camel@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 18 Aug 2022 23:17:14 +0200
Message-ID: <CACO55tvudY1hsgXN-VTjeo65ww3T7r69wS+Agi=Om3TAmVPHTg@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Advice about debugging nouveau driver suspend issue
 (init_on_alloc=1 and init_on_free=1)
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
Cc: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Aug 18, 2022 at 10:39 PM Lyude Paul <lyude@redhat.com> wrote:
>
> So then - if we can get this patch re-submitted with the /* TODO */ added,
> I'll be happy to push this
>

yeah, I'll send something out tomorrow then.

> On Fri, 2022-08-12 at 01:07 +0200, Karol Herbst wrote:
> > On Thu, Aug 11, 2022 at 11:20 PM Lyude Paul <lyude@redhat.com> wrote:
> > >
> > > On Thu, 2022-08-11 at 00:08 +0200, Karol Herbst wrote:
> > > > the thing is, without this patch, the "hw path" fails with a timeout
> > > > of... 30 seconds?, the code falls back to sw and it takes up to 2-3
> > > > minutes to finish up. So even if this solution is overkill, it fixes a
> > > > real issue. I suspect _something_ is bonkers with the fencing we do
> > > > here and we don't see that the stuff is actually finished or whatever,
> > > > or maybe we never emit the fence in the first place.. I didn't dig
> > > > deep enough.
> > > >
> > > > With this, it's really quick and everything.
> > >
> > > I guess with a todo comment this is probably fine then, since this would only
> > > really be affecting GPUs using m2mf anyway
> > >
> >
> > I was mostly wondering if this is safe, but it probably is and it does
> > fix real user issues. I don't have a better solution at the moment
> > anyway.
> >
> > > --
> > > Cheers,
> > >  Lyude Paul (she/her)
> > >  Software Engineer at Red Hat
> > >
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>

