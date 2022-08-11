Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A5F5908F5
	for <lists+nouveau@lfdr.de>; Fri, 12 Aug 2022 01:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A635B8B075;
	Thu, 11 Aug 2022 23:08:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6493F90173
 for <nouveau@lists.freedesktop.org>; Thu, 11 Aug 2022 23:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660259289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TEz4BvdUOM4yS16H2n1DOBilGuWlNnlyfiq2+8sGnPo=;
 b=cYMNEi7nu3EKHjlZZARTMvk1a5sKdvPenlvvsHKxMdmGfduh0ZP8nO2K7IEIb+UZ8bjJUt
 pg4gIhpOXzzcWry4tiSjnc7vRWHDUTx7U/13bcBKJQ9tnK0tlkkukr2uExm3W1HbSOJoXw
 cPw19NwAVefVtUlels9Jb4KQ15ugxqw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-U-AnzIsAOAG6YqzckTCv3Q-1; Thu, 11 Aug 2022 19:08:08 -0400
X-MC-Unique: U-AnzIsAOAG6YqzckTCv3Q-1
Received: by mail-qt1-f198.google.com with SMTP id
 g22-20020ac85816000000b00342b02072ceso13451646qtg.0
 for <nouveau@lists.freedesktop.org>; Thu, 11 Aug 2022 16:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=TEz4BvdUOM4yS16H2n1DOBilGuWlNnlyfiq2+8sGnPo=;
 b=3KQkQqC+FHfigBueDseemgTD63i+KKGL3jQEe8MdyUfpKXVYLiJawKyeikSd25p3w2
 0foWNDMhYTJw7QsoHDDVbEWxLbut2pmrlfNrkWg6EJiF1fraIaPvw4NJAahhN5bmmzk1
 lGn2NUVAxzPfc24d8Ezc/t6Hcc+Ls9n5GD9iC+UfTOCXPdneTgLkvCH/fYC3grp0nimh
 S9etXk5R82NrOofz8CwVWiE/eu5h+fZmgTtOFKiJ6tcIISR5xN71l06PL4OeXmciPFJM
 KUJ2y9cJ9+sgI0IoBUtdDeiLrfS40rOMmKF+B+zYZJp0Iv91gYVrBPImG/POl4GQx1xu
 YuyA==
X-Gm-Message-State: ACgBeo31nIH2C6Fq9UNQwhiuZLkZvXyiN4g2HWyF7Yq4eskKYD6pHuE2
 Iyr7BuxcbPMaiAg3+FsnhKHiZGqFgx6fp/3vN8NJMmVp+ORCVCMMjKxEjY9KRm0f9Y8NtVhsvmm
 Q5hzrJb9VsAjXyEQz6LSSRi45aygTHVB6hwEmofHTWw==
X-Received: by 2002:a05:6214:1c8c:b0:473:408f:ddd6 with SMTP id
 ib12-20020a0562141c8c00b00473408fddd6mr1358677qvb.74.1660259282408; 
 Thu, 11 Aug 2022 16:08:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR45hMfbfNXPsPKIv93YCOv07f/KK3/g5wjVmKrUcDBtYnd37lQ2rhjIrPtejmI5uDPYjjYLIdT1iYvqVE9Yvy4=
X-Received: by 2002:a05:6214:1c8c:b0:473:408f:ddd6 with SMTP id
 ib12-20020a0562141c8c00b00473408fddd6mr1358662qvb.74.1660259282228; Thu, 11
 Aug 2022 16:08:02 -0700 (PDT)
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
In-Reply-To: <31a134642314b288771637610659a4f50f971f27.camel@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 12 Aug 2022 01:07:51 +0200
Message-ID: <CACO55tvBR5exrpMP=mKhxZjfJVQxuvQoYApnwFZjQWxFv_6msQ@mail.gmail.com>
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

On Thu, Aug 11, 2022 at 11:20 PM Lyude Paul <lyude@redhat.com> wrote:
>
> On Thu, 2022-08-11 at 00:08 +0200, Karol Herbst wrote:
> > the thing is, without this patch, the "hw path" fails with a timeout
> > of... 30 seconds?, the code falls back to sw and it takes up to 2-3
> > minutes to finish up. So even if this solution is overkill, it fixes a
> > real issue. I suspect _something_ is bonkers with the fencing we do
> > here and we don't see that the stuff is actually finished or whatever,
> > or maybe we never emit the fence in the first place.. I didn't dig
> > deep enough.
> >
> > With this, it's really quick and everything.
>
> I guess with a todo comment this is probably fine then, since this would only
> really be affecting GPUs using m2mf anyway
>

I was mostly wondering if this is safe, but it probably is and it does
fix real user issues. I don't have a better solution at the moment
anyway.

> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>

